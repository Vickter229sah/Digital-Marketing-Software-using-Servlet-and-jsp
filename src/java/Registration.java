
import java.sql.*;
import java.io.*;
import java.net.URLEncoder;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Registration extends HttpServlet {

    // Add your test Gmail server details
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String SMTP_USERNAME = "vickterpsk@gmail.com";
    private static final String SMTP_PASSWORD = "stsbbgjolxnwvvdm";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Check if email and password are not empty
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                throw new IllegalArgumentException("Email and password cannot be empty");
            }

            Class.forName("com.mysql.cj.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");

            // Check if the email is already registered
            if (isEmailRegistered(con, email)) {
                throw new IllegalStateException("Email already registered");
            }

            // Insert the user into the database with a verification status
            String query = "INSERT INTO project (email, password, verified) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setBoolean(3, false); // User is not yet verified
            ps.executeUpdate();

            // Send verification email to the user's email address
            sendVerificationEmail(email);

            // Store user email in session
            HttpSession session = request.getSession();
            session.setAttribute("email", email);

            // Create and add a cookie
            Cookie emailCookie = new Cookie("email", email);
            emailCookie.setMaxAge(24 * 60 * 60); // Cookie lasts for 1 day (24 hours)
            response.addCookie(emailCookie);

            response.sendRedirect("index.jsp");

        } catch (ClassNotFoundException | SQLException | IllegalArgumentException | IllegalStateException e) {
            e.printStackTrace();
            // Redirect back to the login page with error message
            response.sendRedirect("login.html?error=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void sendVerificationEmail(String email) {
        // Create properties for the email session
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Create a Session object
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
            }
        });

        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SMTP_USERNAME));
            message.setSubject("Login");

            // Get the current date and time
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedDate = dateFormat.format(calendar.getTime());

            // Concatenate the email address with the verification message
            String verificationMessage = "To email: " + email + "\nDate and Time: " + formattedDate;
            message.setText(verificationMessage);
            // Send the message
            Transport.send(message);

            System.out.println("Verification email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private boolean isEmailRegistered(Connection con, String email) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT COUNT(*) FROM project WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
            return false;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }
}

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import jakarta.servlet.http.Cookie;
import java.sql.*;
import javax.mail.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class GoogleCallbackServlet extends HttpServlet {

    private String password;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        String clientId = "434646176935-o7a78i2ig64jl3mhpm23rvnr2i3akqo1.apps.googleusercontent.com";
        String clientSecret = "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";
        String redirectURI = "http://localhost:8080/finalprojectjava/oauth2callback";
        String tokenURL = "https://oauth2.googleapis.com/token?"
                + "code=" + URLEncoder.encode(code, "UTF-8")
                + "&client_id=" + URLEncoder.encode(clientId, "UTF-8")
                + "&client_secret=" + URLEncoder.encode(clientSecret, "UTF-8")
                + "&redirect_uri=" + redirectURI
                + // Do not URL encode redirectURI
                "&grant_type=authorization_code";

        // Exchange authorization code for access token
        String accessToken = exchangeCodeForAccessToken(code, clientId, clientSecret, redirectURI);

        // Use access token to get user information
        String userInfo = getUserInfo(accessToken);

        // Parse user information
        String email = extractEmail(userInfo);
        // Assuming you have a method to extract email from userInfo

        // Store user information in the database
        saveUserToDatabase(email);

        // Send email to the user
        sendEmail(email);

        // Assuming the user is successfully logged in
        String message = "You are successfully logged in with Google!";
        // Encode the message to be stored in the cookie
        String encodedMessage = URLEncoder.encode(message, "UTF-8");
        // Create a cookie and set its value
        Cookie successCookie = new Cookie("login_success", encodedMessage);
        // Set the cookie path
        successCookie.setPath("/finalprojectjava");
        // Set the cookie to expire in 1 hour (you can adjust this)
        successCookie.setMaxAge(3600);
        // Add the cookie to the response
        response.addCookie(successCookie);
        // Redirect to your desired page
        response.sendRedirect("index.jsp");
    }

    private String exchangeCodeForAccessToken(String code, String clientId, String clientSecret, String redirectURI) throws IOException {
        String tokenURL = "https://oauth2.googleapis.com/token";

        URL url = new URL(tokenURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        String postData = "code=" + URLEncoder.encode(code, "UTF-8")
                + "&client_id=" + URLEncoder.encode(clientId, "UTF-8")
                + "&client_secret=" + URLEncoder.encode(clientSecret, "UTF-8")
                + "&redirect_uri=" + URLEncoder.encode(redirectURI, "UTF-8")
                + "&grant_type=authorization_code";

        try (OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream())) {
            writer.write(postData);
            writer.flush();
        }

        StringBuilder sb = new StringBuilder();
        int httpResult = conn.getResponseCode();
        if (httpResult == HttpURLConnection.HTTP_OK) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line).append("\n");
                }
            }
        }

        return sb.toString();
    }

    private String getUserInfo(String accessToken) throws IOException {
        String userInfoURL = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken;

        URL url = new URL(userInfoURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        StringBuilder sb = new StringBuilder();
        int httpResult = conn.getResponseCode();
        if (httpResult == HttpURLConnection.HTTP_OK) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line).append("\n");
                }
            }
        }

        return sb.toString();
    }

    private String extractEmail(String userInfo) {
        // Implement logic to extract email from userInfo JSON string
        // Return the extracted email
        return null;
        // Implement logic to extract email from userInfo JSON string
        // Return the extracted email
    }

    private void saveUserToDatabase(String email) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", " ");

            // Insert the user into the database with a verification status
            String query = "INSERT INTO project (email, password, verified) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, ""); // You don't have the password in this scenario
            ps.setBoolean(3, false); // User is not yet verified
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException | IllegalArgumentException | IllegalStateException e) {
            e.printStackTrace();
            // Handle database exception
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

   private void sendEmail(String recipientEmail) {
    if (recipientEmail == null || recipientEmail.isEmpty()) {
        System.out.println("Recipient email is null or empty.");
        return;
    }

    final String username = "vickterpsk@gmail.com"; // Your Gmail address
    final String password = "stsbbgjolxnwvvdm"; // Your Gmail password

    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session session = Session.getInstance(props, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });

    try {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Check for null before parsing
        message.setSubject("Welcome!");
        message.setText("Dear User,\n\nWelcome to our website!\n\nBest regards,\nYour Website Team");

        Transport.send(message);

        System.out.println("Email sent successfully!");

    } catch (MessagingException e) {
        throw new RuntimeException(e);
    }
}
}
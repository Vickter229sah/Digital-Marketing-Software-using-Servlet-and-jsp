import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

public class GoogleLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = "434646176935-o7a78i2ig64jl3mhpm23rvnr2i3akqo1.apps.googleusercontent.com";
        String redirectURI = "http://localhost:8080/finalprojectjava/oauth2callback";
// Update with your correct redirect URI
        
        String googleLoginURL = "https://accounts.google.com/o/oauth2/auth?client_id=" + clientId +
                "&redirect_uri=" + redirectURI +
                "&response_type=code&scope=openid%20email%20profile&access_type=offline";
        
        response.sendRedirect(googleLoginURL);
    }
}

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseUtils.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();
                if (rs.next() && BCrypt.checkpw(password, rs.getString("password"))) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", rs);
                    String role = rs.getString("role");

                    if (role.equals("Employee")) {
                        response.sendRedirect("requestAccess.jsp");
                    } else if (role.equals("Manager")) {
                        response.sendRedirect("pendingRequests.jsp");
                    } else if (role.equals("Admin")) {
                        response.sendRedirect("createSoftware.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=Invalid credentials");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}

<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h2>Request Access</h2>
    <form action="RequestServlet" method="POST">
        <label>Software:</label>
        <select name="software_id">
            <!-- Dynamically populate software list -->
            <% 
                // Assuming software list is available in request attributes
                List<Software> softwareList = (List<Software>) request.getAttribute("softwareList");
                for (Software s : softwareList) {
            %>
                <option value="<%= s.getId() %>"><%= s.getName() %></option>
            <% } %>
        </select><br><br>
        
        <label>Access Type:</label>
        <select name="access_type">
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>
        
        <label>Reason:</label>
        <textarea name="reason" required></textarea><br><br>

        <button type="submit">Request Access</button>
    </form>
</body>
</html>

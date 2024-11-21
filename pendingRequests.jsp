<!DOCTYPE html>
<html>
<head>
    <title>Pending Access Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <table border="1">
        <tr>
            <th>Employee Name</th>
            <th>Software Name</th>
            <th>Access Type</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <!-- Iterate over pending requests -->
        <% 
            // Assuming pending requests are available in request attributes
            List<Request> pendingRequests = (List<Request>) request.getAttribute("pendingRequests");
            for (Request r : pendingRequests) {
        %>
            <tr>
                <td><%= r.getEmployeeName() %></td>
                <td><%= r.getSoftwareName() %></td>
                <td><%= r.getAccessType() %></td>
                <td><%= r.getReason() %></td>
                <td><%= r.getStatus() %></td>
                <td>
                    <form action="ApprovalServlet" method="POST">
                        <input type="hidden" name="request_id" value="<%= r.getId() %>">
                        <button type="submit" name="action" value="approve">Approve</button>
                        <button type="submit" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
        <% } %>
    </table>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
    <h2>Create New Software</h2>
    <form action="SoftwareServlet" method="POST">
        <label>Software Name:</label>
        <input type="text" name="name" required><br><br>
        
        <label>Description:</label>
        <textarea name="description"></textarea><br><br>

        <label>Access Levels:</label><br>
        <input type="checkbox" name="access_levels" value="Read"> Read
        <input type="checkbox" name="access_levels" value="Write"> Write
        <input type="checkbox" name="access_levels" value="Admin"> Admin<br><br>

        <button type="submit">Create Software</button>
    </form>
</body>
</html>

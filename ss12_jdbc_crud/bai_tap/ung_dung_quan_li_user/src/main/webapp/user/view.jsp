<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/21/2024
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View User</title>
</head>
<body>
<h2>User information</h2>
<table border="1">
    <tr>
        <td>Name:</td>
        <td>${user.getName()}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${user.getEmail()}</td>
    </tr>
    <tr>
        <td>Country:</td>
        <td>${user.getCountry()}</td>
    </tr>
</table>
<h3><a href="/users">Back to list</a></h3>
</body>
</html>

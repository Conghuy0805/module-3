<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/19/2024
  Time: 7:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<form method="post">
    <table border="1">
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>Email: </td>
            <td><input type="email" name="email" value="${user.getEmail()}"></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><input type="text" name="country" value="${user.getCountry()}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Update"></td>
        </tr>
    </table>
</form>
<a href="/users"><h3>Back to list</h3></a>
</body>
</html>

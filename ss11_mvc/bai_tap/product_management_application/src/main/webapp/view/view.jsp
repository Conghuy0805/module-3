<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/18/2024
  Time: 1:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>View Product</h1>
<form method="post">
    <table class="table table-primary">
        <tr>
            <td>Id</td>
            <td>${product.getId()}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${product.getName()}</td>
        </tr>
        <tr>
            <td>Price</td>
            <td>${product.getPrice()}</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>${product.getDescription()}</td>
        </tr>
        <tr>
            <td>Manufacturer</td>
            <td>${product.getManufacturer()}</td>
        </tr>
    </table>
    <h5><a href="/product">Back list product</a></h5>
</form>
</body>
</html>

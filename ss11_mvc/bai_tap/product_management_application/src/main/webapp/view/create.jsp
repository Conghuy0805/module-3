<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/17/2024
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/style.css">

</head>
<body style="width: 30%; margin: 50px auto;">
<h2 style="margin-bottom: 20px; text-align: center">Create new customer</h2>
<form method="post" action="/product">
    <table class="table table-striped" style="height: 400px">
        <input type="hidden" value="create" name="action">
        <tr>
            <td style="width: 10px">Name</td>
            <td><input type="text" id="name" name="name" class="form-control"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" id="price" name="price" class="form-control"></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><textarea cols="25" rows="2" id="description" name="description"></textarea></td>
        </tr>
        <tr>
            <td>Manufacturer</td>
            <td><input type="text" id="manufacturer" name="manufacturer" class="form-control"></td>
        </tr>
    </table>
    <button class="btn-53" type="submit" value="Create">
        <div class="original"></div>
        <div class="letters">
            <span>C</span>
            <span>R</span>
            <span>E</span>
            <span>A</span>
            <span>T</span>
            <span>E</span>
        </div>
    </button>
</form>
<h6><a href="/product">Back to list</a></h6>
</body>
</html>

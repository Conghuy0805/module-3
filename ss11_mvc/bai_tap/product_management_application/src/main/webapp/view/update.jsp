<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/17/2024
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

</head>
<body>
<form method="post">
    <table>
        <tr>
            <td>Name </td>
            <td><input type="text" name="name" id="name" value="${product.getName()}" class="form-control"></td>
        </tr>
        <tr>
            <td>Price </td>
            <td><input type="number" name="price" id="price" value="${product.getPrice()}" class="form-control"></td>
        </tr>
        <tr>
            <td>Description </td>
            <td><textarea cols="30" rows="5" id="description" name="description">${product.getDescription()}</textarea>
            </td>
        </tr>
        <tr>
            <td>Manufacturer </td>
            <td><input type="text" id="manufacturer" name="manufacturer" class="form-control"
                       value="${product.getManufacturer()}">
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="form-control" value="UPDATE"></td>
        </tr>
    </table>
</form>
<h4><a href="${pageContext.request.contextPath}/product">Back to list</a></h4>
</body>
</html>

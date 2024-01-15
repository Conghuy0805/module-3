<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/10/2024
  Time: 7:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<h2>Danh sách khách hàng</h2>
<table class="table">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listCustomer}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dob}</td>
            <td>${customer.address}</td>
            <td>
                <img src="/static/img/${customer.img}" width="50px">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

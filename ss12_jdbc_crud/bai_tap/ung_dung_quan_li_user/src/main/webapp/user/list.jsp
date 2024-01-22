<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/19/2024
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="search" style="margin-top: 20px">
        <form method="post" action="/users?action=search">
            <input type="text" id="search" name="search">
            <input type="submit" value="Search">
        </form>
    </div>
    <div class="sort">
        <form method="get">
            <select name="action">
                <option value="sortByName">Name</option>
                <option value="sortByEmail">Email</option>
                <option value="sortByCountry">Country</option>
            </select>
            <button type="submit">Sort</button>
        </form>
    </div>
    <table border="1" class="table table-hover">
        <thead>
        <button class="btn btn-success" onclick="window.location.href='/users?action=create'"
                style="margin-bottom: 20px">Thêm mới
        </button>
        <tr>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>COUNTRY</th>
            <th colspan="2">CHOOSE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><a href="/users?action=view&id=${user.getId()}">${user.getName() }</a></td>
                <td>${user.getEmail()}</td>
                <td>${user.getCountry()}</td>
                <td>
                    <button onclick="window.location.href='/users?action=update&id=${user.getId()}'"
                            class="btn btn-warning">Cập nhật
                    </button>
                </td>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal${user.getId()}"> Xóa
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal${user.getId()}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Xóa user?</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa user ${user.getName()} không?
                                    Lưu ý hành động này không thể hoàn tác.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <button type="button" class="btn btn-primary"
                                            onclick="window.location.href='/users?action=delete&id=${user.getId()}'">Xác nhận
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
</html>

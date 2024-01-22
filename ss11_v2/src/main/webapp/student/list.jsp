<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/30/2022
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <button onclick="window.location.href='/student?action=create'">Thêm mới</button>
    <table border="1" class="table table-hover" id="example">
        <thead>
        <tr>
            <th>Code Student</th>
            <th>Name Student</th>
            <th>Point</th>
            <th>IdCard</th>
            <th>Rank</th>
            <th>Name class</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="temp" items="${listStudent}">
            <tr>
                <td>${temp.code}</td>
                <td>${temp.nameStudent}</td>
                <td><c:out value="${temp.point}"></c:out></td>
                <td>${temp.idCard}</td>
                <td>
                    <c:choose>
                        <c:when test="${temp.point >8}">Very good</c:when>
                        <c:when test="${temp.point >6.5}">Good</c:when>
                        <c:when test="${temp.point >5}">Not good</c:when>
                        <c:when test="${temp.point >3.5}">Bad</c:when>
                        <c:when test="${temp.point <=3.5}">Very Bad</c:when>
                    </c:choose>
                </td>
                <td>${temp.nameClass}</td>
                <td>
                    <button onclick="window.location.href='/student?action=update&code=${temp.code}'"
                            class="btn btn-warning">Cập nhật
                    </button>
                </td>
                    <%--Cách 1--%>
                    <%--                <td>--%>
                    <%--                    <!-- Button trigger modal -->--%>
                    <%--                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${temp.code}">--%>
                    <%--                        Xóa--%>
                    <%--                    </button>--%>

                    <%--                    <!-- Modal -->--%>
                    <%--                    <div class="modal fade" id="exampleModal${temp.code}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
                    <%--                        <div class="modal-dialog">--%>
                    <%--                            <div class="modal-content">--%>
                    <%--                                <div class="modal-header">--%>
                    <%--                                    <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh?</h5>--%>
                    <%--                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="modal-body">--%>
                    <%--                                    Bạn có muốn xóa học sinh ${temp.nameStudent} không?--%>
                    <%--                                    Lưu ý hành động này không thể hoàn tác.--%>
                    <%--                                </div>--%>
                    <%--                                <div class="modal-footer">--%>
                    <%--                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
                    <%--                                    <button type="button" class="btn btn-primary" onclick="window.location.href='/student?action=delete&code=${temp.code}'">Xác nhận</button>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%--                </td>--%>

                    <%--  Cách 2--%>
                <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                            onclick='deleteModal(${temp.code})'>
                        Launch demo modal
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="info"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="confirmDelete()">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
<script>
    new DataTable('#example');
    let codeDelete = -1;

    function deleteModal(code) {
        codeDelete = code;
        document.getElementById("info").innerText = "Bạn có muốn xóa học sinh " + code + " không?"
    }

    function confirmDelete() {
        window.location.href = "/student?action=delete&code="+codeDelete;
    }
</script>
</body>
</html>

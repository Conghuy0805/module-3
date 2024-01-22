<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/19/2024
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div>
    <form action="/users" method="post">
        <input type="hidden" name="action" value="create">
        <label>Name</label>
        <input class="form-control" type="text" name="name">
        <label>Email</label>
        <input class="form-control" type="email" name="email">
        <label>Country</label>
        <input class="form-control" type="text" name="country">
        <input type="submit" value="SUBMIT">
    </form>
</div>
<a href="/users"><h3>Back to list</h3></a>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Web đăng nhập hiển thị lời chào</title>
    <style type="text/css">
        .login {
            height: 180px;
            width: 265px;
          padding: 10px;
            margin: 0;
            border: 1px #ccc solid;
        }

        .login input {
            padding: 5px;
            margin: 5px;
        }

        h2 {
            text-align: center;
        }

        .submit {
            margin-left: 95px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <div class="login">
        <h2>Login</h2>
        <input type="text" name="username" size="30" placeholder="username">
        <input type="text" name="password" size="30" placeholder="password">
        <div class="submit">
            <input type="submit" value="Sign up">
        </div>
    </div>
</form>
</body>
</html>
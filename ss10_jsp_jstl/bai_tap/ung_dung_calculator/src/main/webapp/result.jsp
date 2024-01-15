<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/12/2024
  Time: 6:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <style>
        .result {
            color: cadetblue;
            font-size: 20px;
        }

        .error {
            color: red;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h2>Result: </h2>
<% if (request.getAttribute("result") != null) { %>
<p class="result">Result: <%= request.getAttribute("result")%>
</p>
<% } %>

<% if (request.getAttribute("errorMessage") != null) { %>
<p class="error"><%= request.getAttribute("errorMessage")%>
</p>
<% } %>
<%--<p class="result">${first} + ${aDouble} = ${result}</p>--%>
<%--<p class="error">Error: ${errorMessage}</p>--%>
</body>
</html>

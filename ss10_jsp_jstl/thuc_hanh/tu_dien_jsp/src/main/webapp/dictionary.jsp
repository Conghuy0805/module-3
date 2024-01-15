<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/10/2024
  Time: 7:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>
<%
    Map<String, String> dictionary = new HashMap<>();
%>
<%
    dictionary.put("hello", "xin chào");
    dictionary.put("how", "thế naào");
    dictionary.put("computer", "máy tính");
    dictionary.put("pencil", "bút chì");

    String search = request.getParameter("txtSearch");
    String result = dictionary.get(search);
    PrintWriter writer = response.getWriter();

    if (result != null) {
        writer.println("Word: " + search +"<br>");
        writer.println("Result: " + result);
    } else {
        writer.println("Not found");
    }
%>
</body>
</html>

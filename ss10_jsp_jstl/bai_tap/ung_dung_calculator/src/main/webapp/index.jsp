<%--
  Created by IntelliJ IDEA.
  User: RAZER
  Date: 1/10/2024
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
        }

        form {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        label {
            display: block;
            margin: 10px 0;
            font-weight: bold;
        }

        input[type="number"], select {
            width: 200px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculator" method="post">
    <label>First operand:</label>
    <input type="number" name="first"><br>

    <label>Operator:</label>
    <select id="operator" name="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select><br>

    <label>Second operand:</label>
    <input type="number" name="second"><br>

    <input type="submit" value="Calculate">
</form>
</body>
</html>

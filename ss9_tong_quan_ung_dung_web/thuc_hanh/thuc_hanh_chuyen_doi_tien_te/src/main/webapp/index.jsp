<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <style type="text/css">
        label {
            font-size: 20px;
        }

        input {
            padding: 10px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<h2>Currency Converter</h2>
<form action="convert" method="post">
    <label>Rate: </label><br>
    <input type="text" name="rate" value="24000" placeholder="RATE"><br>
    <label>USD: </label><br>
    <input type="text" name="usd" value="0" placeholder="USD"><br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>
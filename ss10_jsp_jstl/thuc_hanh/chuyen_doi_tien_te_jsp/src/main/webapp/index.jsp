<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <style>
        .container{
            border: 1px #ccc solid;
            width: 300px;
            height: 200px;
            font-size: 20px;
        }
        .container .input {
            width: 100%;
            height: 50px;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
    <div class="container">
        <div class="input">
            <label>Rate: </label><br>
            <input type="text" name="rate" value="24000" placeholder="RATE"><br>
        </div>
        <div class="input">
            <label>USD: </label><br>
            <input type="number" name="usd" value="0" placeholder="USD"><br>
        </div>
        <div class="input">
            <input type="submit" value="Converter">
        </div>
    </div>
</form>
</body>
</html>
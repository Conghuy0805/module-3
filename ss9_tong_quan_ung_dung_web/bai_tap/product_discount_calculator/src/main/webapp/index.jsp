<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
            div{
                margin-bottom: 20px;
            }
    </style>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="display-discount" method="post">
    <div>
        <label>Mô tả sản phẩm</label><br>
        <textarea name="describe"></textarea><br>
    </div>
    <div>
        <label>Giá niêm yết của sản phẩm</label><br>
        <input type="number" name="price"><br>
    </div>
    <div>
        <label>Tỷ lệ chiết khấu</label><br>
        <input type="number" name="discount_rate"><br>
    </div>
    <div>
        <input type="submit" value="Tính chiết khấu">
    </div>

</form>
</body>
</html>
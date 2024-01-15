create database demo;

use demo;

create table products(
	id int auto_increment,
    product_code varchar(30),
    product_name varchar(30),
    product_price double,
    product_amount int,
    product_description text,
    product_status varchar(30),
    primary key(id)
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values ('L101', 'Laptop ABC', 999.99, 500, 'High-performance laptop', 'Available'),
('L102', 'Macbook Pro M1', 1999.99, 273, 'High-performance laptop', 'Available'),
('P101', 'Smartphone XYZ', 499.99, 0, 'Feature-rich smartphone', 'Sold Out'),
('P102', 'Iphone 15', 999.99, 999, 'Feature-rich smartphone', 'Available'),
('I101', 'Tablet 123', 299.99, 32, 'Compact tablet', 'Available');

select * from products;
explain select * from products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_productCode 
on products (product_code);
explain select * from products where product_code = 'L101';

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_Price
on products(product_name, product_price);
explain select * from products where product_name = 'Smartphone XYZ' and product_price between 200 and 500;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view
create or replace view products_view as
select product_code, product_name, product_price, product_status
from products
where product_code = 'L101';

-- Tiến hành xoá view
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure getInfor()
begin
	select * from products;
end //
delimiter ;
call getInfor();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct(
	in new_product_code varchar(30),
	in new_product_name varchar(30),
	in new_product_price double,
	in new_product_amount int,
	in new_product_description text,
	in new_product_status varchar(30)
)
begin
	insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
    values (new_product_code, new_product_name, new_product_price, new_product_amount, new_product_description, new_product_status);
end //
delimiter ;
call addProduct('O104', 'Oppo A5s', 499.99, 400, 'Cheap smartphone', 'Sold Out');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateProduct(
	in id_upProduct int,
	in up_product_code varchar(30),
	in up_product_name varchar(30),
	in up_product_price double,
	in up_product_amount int,
	in up_product_description text,
	in up_product_status varchar(30))
begin 
	update products
    set product_code = up_product_code,
		product_name = up_product_name,
        product_price = up_product_price,
        product_amount = up_product_amount,
        product_description = up_product_description,
        product_status = up_product_status
	where id = id_upProduct;    
end //
delimiter ;
call updateProduct(6, 'O105', 'Oppo A15', 299.99, 200, 'Cheap smartphone', 'Available');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteProduct(
in id_deProduct int)
begin
	delete from products
    where id = id_deProduct;
end //
delimiter ;

call deleteProduct(6);
update products
set product_code = 'I106'
where id = 5;
call deleteProduct(5);

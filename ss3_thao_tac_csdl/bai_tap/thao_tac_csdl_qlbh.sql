use csdl_qlbh;

insert into customer(c_name, c_age)
values ('Minh Quan', 10);
insert into customer(c_name, c_age)
values ('Ngoc Oanh', 20);
insert into customer(c_name, c_age)
values ('Hong Ha', 50);

insert into orders(c_id, o_date, o_totalprice)
values (1, '2006-03-21', null);
insert into orders(c_id, o_date, o_totalprice)
values (2, '2006-03-23', null);
insert into orders(c_id, o_date, o_totalprice)
values (1, '2006-03-16', null);

insert into product(p_name, p_price)
values ('May giat', 3);
insert into product(p_name, p_price)
values ('Tu Lanh', 5);
insert into product(p_name, p_price)
values ('Dieu Hoa', 7);
insert into product(p_name, p_price)
values ('Quat', 1);
insert into product(p_name, p_price)
values ('Bep Dien', 2);

insert into orderdetail
values(1, 1, 3);
insert into orderdetail
values(1, 3, 7);
insert into orderdetail
values(1, 4, 2);
insert into orderdetail
values(2, 1, 1);
insert into orderdetail
values(3, 1, 8);
insert into orderdetail
values(2, 5, 4);
insert into orderdetail
values(2, 3, 3);

-- 1. Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id, o.o_date, o.o_totalprice;

-- 2. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name, p.p_name
from customer c 
join orders o on c.c_id = o.c_id
join orderdetail od on o.o_id = od.o_id
join product p on od.p_id = p.p_id; 

-- 3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_name
from customer c 
left join orders o on c.c_id = o.c_id
where o.c_id is null;

--  4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id as 'Mã hóa đơn', o.o_date as 'Ngày bán', sum(od.od_qty * p.p_price) as 'Tổng tiền'
from orders o
join orderdetail od on o.o_id = od.o_id
join product p on od.p_id = p.p_id
group by o.o_id;

select customer.*, product.* from customer
left join orders  on customer.c_id = orders.c_id
left join orderdetail on orders.o_id = orderdetail.o_id
left join product on orderdetail.p_id = product.p_id;
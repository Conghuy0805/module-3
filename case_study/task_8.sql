-- 8. Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Cách 1:
select distinct ho_ten
from khach_hang;

-- Cách 2:
select ho_ten
from khach_hang
group by ho_ten;

-- Cách 3:
create view khachhang_view as
select ho_ten
from khach_hang
group by ho_ten;

select * from khachhang_view;
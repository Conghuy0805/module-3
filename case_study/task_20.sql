-- 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
select nv.ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

-- select nv.ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi, 'Nhân viên' as type_of_person 
-- from nhan_vien nv
-- union all
-- select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi, 'Khách hàng' as type_of_person 
-- from khach_hang kh;

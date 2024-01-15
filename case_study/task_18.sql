-- 18. Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delimiter //
create trigger delete_hopdong_hopdongchitiet before delete on khach_hang
for each row
begin
delete from hop_dong_chi_tiet where ma_hop_dong in (select ma_hop_dong from hop_dong where ma_khach_hang = old.ma_khach_hang);
delete from hop_dong where ma_khach_hang = old.ma_khach_hang;
end //
delimiter ;
drop trigger delete_hopdong_hopdongchitiet;

CREATE TEMPORARY TABLE temp (select distinct kh.ma_khach_hang as ma_khach_hang from khach_hang kh join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021);
drop TEMPORARY TABLE temp;
set sql_safe_updates = 0;
delete from khach_hang where ma_khach_hang in (select ma_khach_hang from temp);
set sql_safe_updates = 1;







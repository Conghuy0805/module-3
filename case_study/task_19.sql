-- 19. Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem dvdk
set gia = gia * 2  where dvdk.ma_dich_vu_di_kem in (
select * from (
select dvdk.ma_dich_vu_di_kem 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where hdct.so_luong > 10 and year(hd.ngay_lam_hop_dong) = 2020) as temp);

-- select dvdk.ma_dich_vu_di_kem 
-- from dich_vu_di_kem dvdk
-- join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
-- join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
-- where hdct.so_luong > 10 and year(hd.ngay_lam_hop_dong) = 2020; 

-- > Tạo 1 bảng tạm để lưu kết quả đặt tên là temp
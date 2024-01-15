-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

-- Cách 1: 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= (select MAX(tong_so_luong) from 
(
      select SUM(hdct.so_luong) as tong_so_luong
      from hop_dong_chi_tiet hdct
      join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = 	dvdk.ma_dich_vu_di_kem
      group BY dvdk.ma_dich_vu_di_kem
) as subquery);

-- Cách 2:
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= all(select sum(hdct.so_luong)
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem);

-- select SUM(hdct.so_luong) as total_so_luong
--       from hop_dong_chi_tiet hdct
--       join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
--       group BY dvdk.ma_dich_vu_di_kem;

-- Điều này chứng minh răng bản chất của truy vấn con là tạo ra một bảng ảo với dữ liệu là kết quả của truy vấn đó
-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' 
and ((substring_index(kh.dia_chi, ', ', -1) like 'Quãng Ngãi') or (substring_index(kh.dia_chi, ', ', -1) like 'Vinh'))
group by dvdk.ma_dich_vu_di_kem;

-- (kh.dia_chi like 'Quãng Ngãi' or kh.dia_chi 'Vinh')
-- like: nó sẽ so sánh giá trị like với 1 chuỗi 
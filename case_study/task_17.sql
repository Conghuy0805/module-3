-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 và lớn hơn 10.000.000 VNĐ.
update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in (
  select * from (
    select kh.ma_khach_hang
    from khach_hang kh
    join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
    join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
    join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
    join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
    join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    where year(hd.ngay_lam_hop_dong) = 2021
    group by kh.ma_khach_hang
    having sum(dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) > 10000000
  ) as subquery
);

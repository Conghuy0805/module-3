-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, kh.so_dien_thoai as sdt_khach_hang, dv.ma_dich_vu, dv.ten_dich_vu, ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd 
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ma_hop_dong not in (select hd.ma_hop_dong from hop_dong hd where (quarter(hd.ngay_lam_hop_dong) = 1 or quarter(hd.ngay_lam_hop_dong)= 2) and year(hd.ngay_lam_hop_dong) = 2021)
and hd.ma_hop_dong in (select hd.ma_hop_dong from hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 4 and year(hd.ngay_lam_hop_dong) = 2020)
group by hd.ma_hop_dong;

-- select hd.ma_hop_dong from hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 4 and year(hd.ngay_lam_hop_dong) = 2020;
-- select hd.ma_hop_dong from hop_dong hd where (quarter(hd.ngay_lam_hop_dong) = 1 or quarter(hd.ngay_lam_hop_dong)= 2) and year(hd.ngay_lam_hop_dong) = 2021;

-- có thể group by theo các khóa ngoại hoặc khóa chính trong lúc join mà không cần khai báo trên câu lệnh select (nếu không được thì hãy group by thêm tất cả các cột trên select) 

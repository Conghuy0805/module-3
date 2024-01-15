-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select nv.ma_nhan_vien, nv.ho_ten
from nhan_vien nv 
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.ma_nhan_vien not in(
select nv.ma_nhan_vien from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) in (2019, 2020, 2021)
group by nv.ma_nhan_vien);

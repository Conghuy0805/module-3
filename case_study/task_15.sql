-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
where nv.ma_nhan_vien in (
select nv.ma_nhan_vien from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong)= 2020 or year(hd.ngay_lam_hop_dong)= 2021
group by nv.ma_nhan_vien
having count(nv.ma_nhan_vien) <= 3 );

-- count theo hd.ma_hop_dong cũng được

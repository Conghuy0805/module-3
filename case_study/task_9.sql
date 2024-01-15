-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as 'Tháng', count(hd.ma_hop_dong) as 'Số lượng khách hàng'
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong);


-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) as 'Số lần đặt'
from khach_hang kh 
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang, kh.ho_ten
order by count(kh.ma_khach_hang);
-- 3. Hiển thị thông tin của tất cả khách hàng 
-- có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khach_hang
where timestampdiff(year, ngay_sinh, current_date()) between 18 and 50 
and substring_index(dia_chi, ', ', -1) like 'Đà Nẵng' or substring_index(dia_chi, ', ',-1) like 'Quảng Trị';

-- Hàm CURRENT_DATE() trong SQL trả về ngày hiện tại có định dạng ‘YYYY-MM-DD’ hoặc YYYYMMDD
-- Hàm TIMESTAMPDIFF() trong SQL được sử dụng để tính số lượng đơn vị thời gian (như giây, phút, giờ, ngày, tháng, năm) giữa hai giá trị thời gian.

-- TIMESTAMPDIFF(unit, start_datetime, end_datetime)
-- unit: là đơn vị thời gian mà bạn muốn tính toán (ví dụ: SECOND, MINUTE, HOUR, DAY, MONTH, YEAR).
-- start_datetime: là giá trị thời gian bắt đầu.
-- end_datetime: là giá trị thời gian kết thúc.
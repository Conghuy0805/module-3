-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where (substring_index(ho_ten, ' ', -1) like 'H%' or
	(substring_index(ho_ten, ' ', -1) like 'T%' or
    (substring_index(ho_ten, ' ', -1) like 'K%'))) and 
    char_length(substring_index(ho_ten, ' ', -1)) <= 15;

-- Hàm SUBSTRING_INDEX trả về chuỗi con của chuỗi trước số lần xuất hiện của dấu phân cách.
-- SUBSTRING_INDEX( string, delimiter, number )

-- string: Chuỗi nguồn.
-- delimiter: Dấu phân cách để tìm kiếm trong chuỗi.
-- number: Số lần tìm kiếm dấu phân cách.

-- Hàm CHAR_LENGTH() trả về độ dài của chuỗi (tính bằng ký tự).
-- CHAR_LENGTH(string)
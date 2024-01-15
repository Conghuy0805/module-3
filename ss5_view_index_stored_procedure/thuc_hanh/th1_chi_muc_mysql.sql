use tao_csdl_qlsv;

-- Theo dõi kết quả “Tăng tốc MySQL” 
explain select * from student where student_name = 'Hung';

-- Thêm chỉ mục cho bảng student ở cột student_name tên là idx_studentName
alter table student add index idx_studentName(student_name);

-- Xóa chỉ mục có tên idx_studentName
alter table student drop index idx_studentName;
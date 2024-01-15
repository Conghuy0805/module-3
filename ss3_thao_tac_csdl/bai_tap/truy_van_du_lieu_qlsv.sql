use tao_csdl_qlsv;

-- 1. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select s. student_name
from student s
where student_name like 'h%';

-- 2. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select *
from class cl
where month(start_date) = 12;

-- 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select *
from subjects s
where credit between 3 and 5;

-- 4. Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
update student
set class_id = 2
where student_name = 'Hung';

-- 5. Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
select s.student_name, sub.sub_name, m.mark
from student s
join mark m on s.student_id = m.student_id
join subjects sub on m.sub_id = sub.sub_id
order by m.mark desc, student_name asc;
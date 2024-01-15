use tao_csdl_qlsv;

-- 1. Hiển thị danh sách tất cả các học viên
select * 
from student;

-- 2. Hiển thị danh sách các học viên đang theo học
select * 
from student 
where status_student = 1;

-- 3. Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ
select * 
from subjects
where credit < 10;

-- 4. Hiển thị danh sách học viên lớp A1
select s.student_id, s.student_name, cl.class_name
from student s 
join class cl on s.class_id = cl.class_id
where class_name = 'A1';

-- 5. Hiển thị điểm môn CF của các học viên
select s.student_id, s.student_name, sub.sub_name, m.mark
from student s
join mark m on s.student_id = m.student_id
join subjects sub on m.sub_id = sub.sub_id
where sub_name = 'CF';



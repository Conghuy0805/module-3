use tao_csdl_qlsv;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select sub_id, sub_name, status_sub, max(credit)
from subjects
group by sub_id, sub_name
having max(credit) >= all(select max(credit) from subjects group by sub_id);

-- 2. Hiển thị các thông tin môn học có điểm thi lớn nhất
select sub.sub_id, sub.sub_name, max(m.mark)
from subjects sub
join mark m on sub.sub_id = m.sub_id
group by sub.sub_id, sub.sub_name
having max(m.mark) >= all(select max(m.mark) from mark m group by m.mark_id);

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần
select s.student_id, s.student_name, avg(m.mark) as 'Điểm trung bình '
from student s
join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name 
order by avg(m.mark) desc;

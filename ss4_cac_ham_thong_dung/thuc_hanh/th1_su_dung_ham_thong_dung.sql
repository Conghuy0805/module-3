use tao_csdl_qlsv;

-- 1. Hiển thị số lượng sinh viên ở từng nơi
select s.address, count(student_id) as 'Số lượng sinh viên'
from student s
group by address;

-- 2. Tính điểm trung bình các môn học của mỗi học viên
select s.student_id, s.student_name, avg(m.mark) as 'Điểm trung bình'
from student s 
join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name;

-- 3. Hiển thị những bạn học viên có điểm trung bình các môn học lớn hơn 15
select s.student_id, s.student_name, avg(m.mark) as 'Điểm trung bình'
from student s
join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name
having avg(m.mark) > 15;

-- 4. Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select s.student_id, s.student_name, avg(m.mark) as 'Điểm trung bình'
from student s 
join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name
having avg(m.mark) >= all(select avg(m.mark) from mark m group by m.student_id);
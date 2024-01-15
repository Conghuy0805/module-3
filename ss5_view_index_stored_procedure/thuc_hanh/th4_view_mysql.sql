use tao_csdl_qlsv;

-- Taok view
create view student_view as
select student_id, student_name
from student;

select * from student_view;

-- Cập nhật view
create or replace view student_view as
select student_id, student_name, address, phone
from student
where address = 'Ha Noi';

select * from student_view;

-- Xóa view
drop view student_view;







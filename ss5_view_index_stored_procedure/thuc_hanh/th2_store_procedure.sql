use tao_csdl_qlsv;

drop procedure finAllStudent;

delimiter //
create procedure findAllStudent()
begin 
	select * from student where student_id = 1;
end //
delimiter ;

call findAllStudent();

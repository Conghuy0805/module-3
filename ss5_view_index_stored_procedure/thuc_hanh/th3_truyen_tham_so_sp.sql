use tao_csdl_qlsv;

-- Tham số loại IN
delimiter //
create procedure getStudentId(
in studentNum int(11))
begin 
	select * from student where student_id = studentNum;
end //
delimiter ;    

call getStudentId(2);

-- Tham số loại OUT
delimiter //
create procedure getStudentCountByAddress(
in in_address varchar(50),
out total int)
begin 
	select count(address)
    into total
    from student
    where address = in_address;
end //
delimiter ;    

call getStudentCountByAddress('Ha Noi', @total);
select @total;

-- Tham số loại INOUT
delimiter //
create procedure setCounter(
inout counter int,
in inc int)
begin 
	set counter = counter + inc;
end // 
delimiter ;    

set @counter = 1;
call setCounter(@counter, 1);
call setCounter(@counter, 1);
call setCounter(@counter, 5);
select @counter;




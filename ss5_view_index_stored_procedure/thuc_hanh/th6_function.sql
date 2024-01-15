use student_management;

delimiter //
create function sum_a_b(a int , b int) returns int
deterministic
reads sql data
begin
	declare sum int;
    set sum = a + b;
    return sum;
end //
delimiter ;

select sum_a_b(5,10);
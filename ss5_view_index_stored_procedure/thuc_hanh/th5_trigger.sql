use student_management;

-- Chạy trigger trước
delimiter //
create trigger insert_accountsjame before insert on student
for each row
begin
	INSERT INTO account_james (accounts, password)VALUES (new.accounts, '4561237489');
end // 
delimiter ;

-- Chạy insert sau
insert into student (name_student, date_of_birth, email, accounts, class_id_class)
values ('Kiệt', '2003-12-21', 'kiet@gmail.com', 'kiet.nguyen', 1);




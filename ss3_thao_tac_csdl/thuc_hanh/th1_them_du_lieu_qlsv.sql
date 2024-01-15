use tao_csdl_qlsv;

insert into class(class_name, start_date, status_class)
values ('A1', '2008-12-20', 1);
insert into class(class_name, start_date, status_class)
values ('A2', '2008-12-22', 1);
insert into class(class_name, start_date, status_class)
values ('B3', current_date, 0);


insert into student(student_name, address, phone, status_student, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student(student_name, address, status_student, class_id)
values ('Hoa', 'Hai Phong', 1, 1);
insert into student(student_name, address, phone, status_student, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into subjects(sub_name, credit, status_sub)
values ('CF', 5, 1);
insert into subjects(sub_name, credit, status_sub)
values ('C', 6, 1);
insert into subjects(sub_name, credit, status_sub)
values ('HDJ', 5, 1);
insert into subjects(sub_name, credit, status_sub)
values ('RDBMS', 10, 1);

insert into mark(sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1);
insert into mark(sub_id, student_id, mark, exam_times)
values (1, 2, 10, 2);
insert into mark(sub_id, student_id, mark, exam_times)
values (2, 1, 12, 1);

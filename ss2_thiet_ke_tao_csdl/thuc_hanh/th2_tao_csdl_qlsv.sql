create database tao_csdl_qlsv;

use tao_csdl_qlsv;

create table class(
	class_id int auto_increment,
    class_name varchar(60) not null,
    start_date datetime,
    status_class bit,
    primary key(class_id)
);

create table student(
	student_id int auto_increment,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status_student bit,
    class_id int not null,
    primary key(student_id),
    foreign key(class_id) references class(class_id)
);	

create table subjects(
	sub_id int auto_increment,
    sub_name varchar(30) not null,
    credit tinyint not null default 1 check(credit>=1),
    status_sub bit default 1,
    primary key(sub_id)
);

create table mark(
	mark_id int auto_increment,
    sub_id int not null,
    student_id int not null,
    mark float default 0 check (mark between 0 and 100),
    exam_times tinyint default 1,
    primary key(mark_id),
    unique(sub_id, student_id),
    foreign key(sub_id) references subjects(sub_id),
    foreign key(student_id) references student(student_id)
);



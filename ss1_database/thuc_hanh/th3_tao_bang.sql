create database student;

use student;

create table students(
	id_student int not null,
    name_student varchar(25) null,
    age int null,
    country varchar(45) null,
    primary key(id_student)
);
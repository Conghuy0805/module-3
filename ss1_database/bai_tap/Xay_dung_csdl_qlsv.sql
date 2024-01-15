create database xaydung_csdl_qlsv;

use xaydung_csdl_qlsv;

create table class(
	id_class int auto_increment,
    name_class varchar(25) not null,
    primary key(id_class)
);

create table teacher(
	id_teacher int auto_increment,
    name_teacher varchar(25) not null,
    age int,
    country varchar(25),
    primary key(id_teacher)
);
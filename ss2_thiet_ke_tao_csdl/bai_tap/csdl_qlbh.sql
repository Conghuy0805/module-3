create database csdl_qlbh;
	
use csdl_qlbh;

create table customer(
	c_id int auto_increment,
    c_name varchar(25) not null,
    c_age int not null,
    primary key(c_id)
);

create table orders(
	o_id int auto_increment,
    c_id int not null,
    o_date date,
    o_totalprice double,
    primary key(o_id),
    foreign key(c_id) references customer(c_id)
);

create table product(
	p_id int auto_increment,
    p_name varchar(25) not null,
    p_price double,
    primary key(p_id)
);

create table orderdetail(
	o_id int not null,
    p_id int not null,
    od_qty varchar(25) not null,
    primary key(o_id, p_id),
    foreign key(o_id) references orders(o_id),
    foreign key(p_id) references product(p_id)
);
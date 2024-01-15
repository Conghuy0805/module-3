create database tao_bang_csdl;

use tao_bang_csdl;

create table hocsinh(
	ma_hs int auto_increment,
    ten_hs varchar(25) not null,
    ngay_sinh date,
    lop varchar(25),
    gt varchar(25),
    primary key(ma_hs)
);

create table monhoc(
	ma_mh int auto_increment,
    ten_mh varchar(25) not null,
    primary key(ma_mh)
);

create table bangdiem(
	ma_hs int,
    ma_mh int,
    diem_thi int not null,
    ngay_kt date,
    primary key(ma_hs, ma_mh),
    foreign key(ma_hs) references hocsinh(ma_hs),
    foreign key(ma_mh) references monhoc(ma_mh)
);	

create table giaovien(
	ma_gv int auto_increment,
    ten_gv varchar(25) not null,
    sdt varchar(11) not null,
    primary key(ma_gv)
);

alter table monhoc
add ma_gv int;

alter table monhoc 
add foreign key(ma_gv) references giaovien(ma_gv);
create database chuyen_doi_erd;

use chuyen_doi_erd;

create table phieuxuat(
	so_px int auto_increment,
    ngay_xuat date not null,
    primary key(so_px)
);

create table vattu(
	ma_vtu int auto_increment,
    ten_vtu varchar(25) not null,
    primary key(ma_vtu)
);	

create table phieuxuat_vattu(
	so_px int,
    ma_vtu int,
    dg_xuat varchar(25) not null,
    sl_xuat int not null,
    primary key(so_px, ma_vtu),
    foreign key(so_px) references phieuxuat(so_px),
    foreign key(ma_vtu) references vattu(ma_vtu)
);
create table phieunhap(
	so_pn int auto_increment,
    ngay_nhap date not null,
    primary key(so_pn)
);

create table phieunhap_vattu(
	so_pn int,
    ma_vtu int,
    dg_nhap varchar(25) not null,
    sl_nhap int not null,
    primary key(so_pn, ma_vtu),
    foreign key(so_pn) references phieunhap(so_pn),
    foreign key(ma_vtu) references vattu(ma_vtu)
);
create table nhacungcap(
	ma_ncc int auto_increment,
    ten_ncc varchar(25) not null,
    dia_chi varchar(25) not null,
	primary key(ma_ncc)
);

create table dondh(
	so_dh int auto_increment,
    ngay_dh date not null,
    ma_ncc int,
    primary key(so_dh),
    foreign key(ma_ncc) references nhacungcap(ma_ncc)
);	

create table vattu_dondh(
	so_dh int,
    ma_vtu int,
    primary key(so_dh, ma_vtu),
    foreign key(so_dh) references dondh(so_dh),
    foreign key(ma_vtu) references vattu(ma_vtu)
);

create table sdt(
	id_sdt int,
    number_sdt varchar(11),
    ma_ncc int,
    primary key(id_sdt),
    foreign key(ma_ncc) references nhacungcap(ma_ncc)
);




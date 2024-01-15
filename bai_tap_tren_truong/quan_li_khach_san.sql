create database quanlikhachsan;

use quanlikhachsan;

create table DICHVU(
	MADV int auto_increment primary key,
    TENDV varchar(25),
    DVT varchar(10),
    TIENDV varchar(10)
);

create table KHACHTRO(
	MAKT int auto_increment primary key,
    HOLOT varchar(10),
    TENKT varchar(25),
    SOCMND varchar(20),
    PHAI bit(1),
    QUEQUAN varchar(25),
    DIENTHOAI varchar(25)
);	

create table SDDICHVU(
	ID int auto_increment primary key,
    MAKT int,
    MADV int,
    SOLUONG varchar(20),
    foreign key(MAKT) references KHACHTRO(MAKT),
    foreign key(MADV) references DICHVU(MADV)
);

insert into DICHVU (TENDV, DVT, TIENDV)
values ('Tiền điện', 'Kilowatt', '100000'),
	   ('Tiền nước', 'Mét khối', '20000'),
	   ('Dịch vụ giặt ủi', 'Kg', '15000'),
	   ('Dịch vụ vệ sinh', 'Lần', '120000'),
	   ('Internet', 'Tháng', '100000');

insert into KHACHTRO (HOLOT, TENKT, SOCMND, PHAI, QUEQUAN, DIENTHOAI)
values ('Nguyễn', 'Hải', '1234567890', 1, 'Hà Nội', '0123456789'),
	   ('Trần', 'Minh', '0987654321', 1, 'Hồ Chí Minh', '0987654321'),
	   ('Lê', 'Thị', '9876543210', 0 , 'Đà Nẵng', '0912345678'),
	   ('Phạm', 'Văn', '4567890123', 1, 'Hải Phòng', '0845678901'),
	   ('Võ', 'Thảo', '3210987654', 0, 'Cần Thơ', '0765432109');
                 
insert into SDDICHVU (MAKT, MADV, SOLUONG)
values (1, 1, '2'),
       (2, 3, '1'),
       (3, 2, '3'),
       (4, 1, '1'),
       (5, 4, '2');

-- 3.1. Thiết kế Q_lietkedichvu       
select k.MAKT, concat(k.HOLOT, '  ', k.TENKT) as HOTEN, dv.TENDV, sddv.SOLUONG, dv.TIENDV, (sddv.SOLUONG * dv.TIENDV) as THANH_TIEN
from KHACHTRO k
join SDDICHVU sddv ON k.MAKT = sddv.MAKT
join DICHVU dv ON sddv.MADV = dv.MADV
order by sddv.SOLUONG asc;


-- 3.2. Thiết kế Q_tongtientungdichvu
select dv.MADV, dv.TENDV, sum(sddv.SOLUONG * dv.TIENDV) as TONG_TIEN
from KHACHTRO k
join SDDICHVU sddv on k.MAKT = sddv.MAKT
join DICHVU dv on sddv.MADV = dv.MADV
group by dv.MADV, dv.TENDV
order by dv.MADV;

-- 3.3. Thiết kế Q_tongtientheokhach
select k.MAKT, concat(k.HOLOT, ' ', k.TENKT) as HOVATEN, sum(sddv.SOLUONG * dv.TIENDV) as TONG_TIEN
from KHACHTRO k 
join SDDICHVU sddv on k.MAKT = sddv.MAKT
join DICHVU dv on sddv.MADV = dv.MADV
group by k.MAKT;

-- 3.4. Thiết kế Q_nhapmadichvu
select k.MAKT, concat(k.HOLOT, ' ', k.TENKT) as HOTEN, k.PHAI, sddv.MADV, dv.TENDV, sddv.SOLUONG
from KHACHTRO k 
join SDDICHVU sddv on k.MAKT = sddv.MAKT
join DICHVU dv on sddv.MADV = dv.MADV
group by k.MAKT, k.PHAI, sddv.MADV, dv.TENDV, sddv.SOLUONG; 

-- 3.5. Thiết kế Q_tổng tiền sử dụng dịch vụ 
select k.MAKT, concat(k.HOLOT, ' ', k.TENKT) as HOVATEN, dv.TENDV, sum(sddv.SOLUONG * dv.TIENDV) as TONG_TIEN_DV
from KHACHTRO k 
join SDDICHVU sddv on k.MAKT = sddv.MAKT
join DICHVU dv on sddv.MADV = dv.MADV
group by k.MAKT, dv.TENDV;

-- 3.6. Thiết kế Q_cập nhật
update DICHVU
set TIENDV = TIENDV * 1.1;

-- 3.7. Thiết kế Q_xoa dichvu
delete from DICHVU
where MADV = 5;




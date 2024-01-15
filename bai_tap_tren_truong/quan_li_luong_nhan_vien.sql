create database quan_li_luong_nhanvien;

use quan_li_luong_nhanvien;

create table BoPhan(
	ma_bp int auto_increment,
    ten_bp varchar(50),
    primary key(ma_bp)
);

create table ChucVu(
	ma_cv int auto_increment,
    ten_cv varchar(50),
    primary key(ma_cv)
);

create table NhanVien(
	ma_nv int auto_increment,
    ho_nv varchar(25),
    ten_nv varchar(25),
    luong varchar(50),
    phai boolean,
    ngaysinh date,
	ma_cv int,
    ma_bp int,
    primary key(ma_nv),
    foreign key(ma_cv) references ChucVu(ma_cv),
    foreign key(ma_bp) references BoPhan(ma_bp)
);

insert into BoPhan(ten_bp)
values('Kế toán');
insert into BoPhan(ten_bp)
values('Kĩ thuật');
insert into BoPhan(ten_bp)
values('Quản lí');
insert into BoPhan(ten_bp)
values('Nhân sự');

insert into ChucVu(ten_cv)
values('Giám đốc');
insert into ChucVu(ten_cv)
values('Trưởng phòng');
insert into ChucVu(ten_cv)
values('Nhân viên');

insert into NhanVien(ho_nv, ten_nv, luong, phai, ngaysinh, ma_cv, ma_bp)
values('Nguyễn', 'Văn A', '1000000', 1, '2000-11-20', 1, 1);
insert into NhanVien(ho_nv, ten_nv, luong, phai, ngaysinh, ma_cv, ma_bp)
values('Phạm', 'Thị B', '1002200', 0, '1998-02-12', 2, 3);
insert into NhanVien(ho_nv, ten_nv, luong, phai, ngaysinh, ma_cv, ma_bp)
values('Trần', 'Tiến C', '1010000', 1, '1999-11-15', 3, 2);
insert into NhanVien(ho_nv, ten_nv, luong, phai, ngaysinh, ma_cv, ma_bp)
values('Nguyễn', 'Thị D', '2000000', 0, '2001-04-08', 1, 2);
 
-- 1. Liệt kê tất cả các nữ nhân viên sắp xếp tăng dần theo lương
select *
from NhanVien
where phai = 0
order by luong;
 
-- 2. Cho biết lương trung bình của tất cả các nhân viên
select avg(luong) as LuongTB
from NhanVien;
 
-- 3. Cho biết số lượng nhân viên của từng chức vụ
select cv.ma_cv, cv.ten_cv, count(cv.ma_cv) as 'Số lượng nhân viên'
from ChucVu cv
join NhanVien nv on cv.ma_cv = nv.ma_cv
group by cv.ma_cv, cv.ten_cv;

-- 4. Liệt kê mức lương thấp nhất, lương cao nhất và trung bình lương theo từng phòng
select bp.ma_bp, min(nv.luong) as 'Lương thấp nhất', max(nv.luong) as 'Lương cao nhất', 
	   avg(nv.luong) as 'Lương trung bình'
from NhanVien nv
join BoPhan bp on nv.ma_bp = bp.ma_bp
group by bp.ma_bp;

-- 5. Liệt kê các chức vụ có nữ ít hơn 3 người
select cv.ma_cv, cv.ten_cv, count(nv.ma_nv) as 'Sô lượng'
from ChucVu cv
join NhanVien nv on cv.ma_cv = nv.ma_cv
where nv.phai = 0
group by cv.ma_cv, cv.ten_cv
having count(nv.ma_nv) < 3
order by cv.ma_cv;

-- 6. Tìm lương trung bình của các nhân viên sinh vào tháng 11
select avg(luong) as 'Lương trung bình nhân viên tháng 11'
from NhanVien nv 
where month(ngaysinh) = 11;

-- 7. Liệt kê lương cao nhất, thấp nhất và tổng lương theo chức vụ
select cv.ma_cv, cv.ten_cv, max(nv.luong) as 'Lương cao nhất', min(nv.luong) as 'Lương thấp nhất', 
	   sum(nv.luong) as 'Tổng lương'
from NhanVien nv
join ChucVu cv on nv.ma_cv = cv.ma_cv
group by cv.ma_cv, cv.ten_cv;

-- 8. Liệt kê các phòng có ít hơn 7 nhân viên và in ra số lượng nhân viên tương ứng
select bp.ma_bp, bp.ten_bp, count(bp.ma_bp) as 'Số lượng nhân viên'
from BoPhan bp
join NhanVien nv on bp.ma_bp = nv.ma_bp
group by bp.ma_bp, bp.ten_bp
having count(bp.ma_bp) < 7;
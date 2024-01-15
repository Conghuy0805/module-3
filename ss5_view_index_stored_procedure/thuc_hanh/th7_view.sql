use student_management;

create view class_view as
select id_class, name_class
from class;

select * from class_view;

-- Khi thêm dữ liệu vào bảng thì bảng ảo cũng cập nhật dữ liệu
insert into class(name_class, type_of_class_id)
values ('A0723I1', 2);

drop view class_view;

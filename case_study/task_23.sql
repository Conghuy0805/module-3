-- 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang (
in id_delete int
)
begin
	SET FOREIGN_KEY_CHECKS=0;
	delete from khach_hang kh
    where kh.ma_khach_hang = id_delete;
    SET FOREIGN_KEY_CHECKS=1;
end //
delimiter ;

call sp_xoa_khach_hang(1);
drop procedure sp_xoa_khach_hang;

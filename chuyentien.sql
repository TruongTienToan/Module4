delimiter //
create procedure ChuyenTien(
	in sender_id int,
    in recipient_id int,
    in amount decimal(12, 0)
)
begin
	declare sender_balance decimal (12, 0);
    declare transfers_fee decimal (12, 0);
    declare total_amount decimal (12, 0);
    
    declare exit handler for sqlexception
    begin 
		rollback;
        select "Giao dịch bị hủy";
	end;
    
    start transaction;
    
    -- lấy số dư hiện tại của người gửi
    select balance into sender_balance from customers where id = sender_id;
    
    -- kiểm tra số dư người gửi có đủ hay không
    if sender_balance >= amount then
    
    -- công thức phí 10% giao dịch
    set transfers_fee = amount * 0.1;
    
    -- tổng số tiền chuyển bao gồm phí
    set total_amount = amount + transfers_fee;
    
    -- kiểm tra số dư người gửi có đủ khi bao gồm cả phí không
    if sender_balance >= total_amount then
    
    -- số dư người gửi sau khi ck
    update customers set balance = balance - total_amount where id = sender_id;
    
    -- kiểm tra id người gửi
    if row_count() = 0 then
		rollback;
        select "Không tìm thấy id người gửi" as "Thông báo";
	else
    -- số dư người nhận sau khi ck
    update customers set balance = balance + amount where id = recipient_id;
    
    -- kiểm tra id người nhận
    if row_count() = 0 then
		rollback;
        select "Không tìm thấy id người nhận" as "Thông báo";
	else
    
    
	-- thêm thông tin giao dịch vào bảng transfers
    insert into transfers (fees, fees_amount,transaction_amount, transfer_amount,recipient_id, sender_id )
    values (0.1, transfers_fee, total_amount, amount, recipient_id, sender_id );
    
    select "Chuyển khoản thành công" as "Thông báo";
    commit;
    end if;
    end if;
    else
		rollback;
        select "Số dư tài khoản không đủ chuyển khoản nếu bao gồm phí";
	end if;
    else 
		rollback;
        select "Số dư tài khoản không đủ để chuyển khoản";
	end if;

end//
delimiter ;
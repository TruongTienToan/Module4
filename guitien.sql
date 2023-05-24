
/*GỬI TIỀN */
delimiter //
create procedure DepositMoney (
	in customer_id int,
    in amount decimal(12, 0)
)
begin
		declare exit handler for sqlexception
        begin
			rollback;
            select "Giao dịch bị hủy";
		end;
        start transaction;
        update customers set balance = balance + amount where id = customer_id;
        if row_count() = 0 then
        rollback;
        select "không tìm thấy khách hàng có ID phù hợp";
	else 
		insert into deposits (customer_id, transaction_amount)
        values (customer_id, amount);
        select "Giao dịch thành công";
        commit;
	end if;
end//
delimiter ;


/* RÚT TIỀN */

/* RÚT TIỀN */
DELIMITER $$
create procedure WithdrawMoney(
  in customer_id int,
  in amount decimal(12, 0)
)
begin
  declare current_balance decimal(12, 0);
  declare exit handler for sqlexception
  begin
    rollback;
    select 'Giao dịch bị hủy' as "Thông báo";
  end;
  start transaction;
  select balance into current_balance from customers where customers.id = customer_id;
  if current_balance >= amount then
    update customers set balance = balance - amount where customers.id = customer_id;
    if row_count() = 0 then
        rollback;
      select 'Không tìm thấy khách hàng có ID phù hợp' as "Thông báo" ;
    else
      insert into withdraws (customer_id, transaction_amount)
      values (customer_id, amount);
      select 'Giao dịch thành công' as "Thông báo";
      commit;
    end if;
  else
    rollback;
    select 'Sốtiền trong tài khoản không đủ để rút';
  end if;
end$$
DELIMITER ;
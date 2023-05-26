CREATE 
VIEW `transfer_history_view` AS
    SELECT 
        `transfer`.`id` AS `id`,
        `sender`.`id` AS `sender_id`,
        `sender`.`full_name` AS `sender_name`,
        `recipient`.`id` AS `recipient_id`,
        `recipient`.`full_name` AS `recipient_name`,
        `transfer`.`transaction_amount` AS `transaction_amount`,
        `transfer`.`fees` AS `fees`,
        `transfer`.`created_at` AS `created_at`
    FROM
        ((`transfers` `transfer`
        JOIN `customers` `sender` ON ((`transfer`.`sender_id` = `sender`.`id`)))
        JOIN `customers` `recipient` ON ((`transfer`.`recipient_id` = `recipient`.`id`)))
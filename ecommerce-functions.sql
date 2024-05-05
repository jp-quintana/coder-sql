drop function if exists ecommerce.fn_biggest_purchase;
drop function if exists ecommerce.category_total_revenue;

delimiter //


create function ecommerce.fn_biggest_purchase(user_id int) returns varchar(255)
deterministic
begin
    declare biggest_purchase_details varchar(255);

    select concat('ID de la orden: ', p.purchase_id, ', Fecha: ', p.created_at, ', Total: ', 
                  sum(pi.quantity * pr.product_price)) into biggest_purchase_details
    from purchase p
    join purchase_item pi on p.purchase_id = pi.purchase_id
    join product pr on pi.product_id = pr.product_id
    where p.user_id = user_id
    group by p.purchase_id
    order by sum(pi.quantity * pr.product_price) desc
    limit 1;

    return biggest_purchase_details;
end //

create function ecommerce.category_total_revenue(category_id int) returns decimal(10,2)
deterministic
begin
    declare total_revenue decimal(10,2);

    select sum(pi.quantity * pr.product_price) into total_revenue
    from purchase p
    join purchase_item pi on p.purchase_id = pi.purchase_id
    join product pr on pi.product_id = pr.product_id
    join category c on pr.category_id = c.category_id
    where c.category_id = category_id;

    return total_revenue;
END //

delimiter ;

-- select fn_biggest_purchase(7) as result;
-- select category_total_revenue(2) as result;
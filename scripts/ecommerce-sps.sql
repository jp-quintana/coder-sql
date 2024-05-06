drop procedure if exists ecommerce.sp_product_review;
drop procedure if exists ecommerce.sp_manage_product;
drop procedure if exists ecommerce.sp_category_stats;
drop procedure if exists ecommerce.sp_sales_report;

delimiter //

create procedure ecommerce.sp_product_review(
    in order_by_column varchar(50),
    in sort_order varchar(4)
)
begin
    set @sql = concat('select 
                            p.product_id,
                            p.product_name,
                            p.product_price,
                            p.product_description,
                            c.category_name,
                            r.review_rating,
                            r.review_comment
                       from 
                            product p
                       join 
                            category c on p.category_id = c.category_id
                       left join 
                            review r on p.product_id = r.product_id
                       order by ', order_by_column, ' ', sort_order);

    prepare stmt from @sql;
    execute stmt;
    deallocate prepare stmt;
end //

create procedure ecommerce.sp_manage_product(
    in operation varchar(10),
    in product_name varchar(50),
    in product_price int,
    in product_description varchar(300),
    in category_id int
)
begin
    if operation = 'add' then
        insert into product (product_name, product_price, product_description, category_id)
        values (product_name, product_price, product_description, category_id);
    elseif operation = 'delete' then
    
    -- no está configurado el on delete cascade por lo que no funciona el delete
        delete from product
        where product_name = product_name;
    end if;
end //

create procedure ecommerce.sp_category_stats(
    in category_id int,
    out total_price decimal(10, 2),
    out total_products int
)
begin
    select sum(product_price) into total_price
    from product
    where category_id = category_id;

    select count(*) into total_products
    from product
    where category_id = category_id;
end //

create procedure ecommerce.sp_sales_report(
    in start_date date,
    in end_date date,
    out total_customers int,
    out average_order_value decimal(10, 2),
    out report_start_date date,
    out report_end_date date
)
begin
	set report_start_date = start_date;
    set report_end_date = end_date;

    select sum(pi.quantity * pr.product_price) into average_order_value
    from purchase p
    join purchase_item pi on p.purchase_id = pi.purchase_id
    join product pr on pi.product_id = pr.product_id
    where p.created_at between start_date and end_date;

    select COUNT(distinct user_id) into total_customers
    from purchase
    where created_at between start_date and end_date;

    SELECT round(average_order_value / total_customers, 2) into average_order_value;
end //

delimiter ;

-- call sp_category_stats(1, @total_price, @total_products);
-- select @total_price, @total_products;

-- call sp_sales_report('2024-01-01', '2024-12-31', @total_customers, @average_order_value, @report_start_date, @report_end_date);
-- select @total_customers, @average_order_value, @report_start_date, @report_end_date;

-- call ecommerce.sp_manage_product('add', 'New Product', 100, 'Description of the new product', 1);
-- call ecommerce.sp_manage_product('delete', 'New Product', null, null, null);

-- call ecommerce.sp_product_review('review_rating', 'desc');
-- call ecommerce.sp_product_review('review_rating', 'asc');


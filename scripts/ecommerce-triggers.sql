drop table if exists ecommerce.log_product;
create table ecommerce.log_product(
	log_id int auto_increment primary key,
	action_name enum('INSERT', 'DELETE', 'UPDATE') not null,
	user_name varchar(50) not null,
	action_date date,
	action_time time
);

drop table if exists ecommerce.log_category;
create table ecommerce.log_category(
	log_id int auto_increment primary key,
	action_name enum('INSERT', 'DELETE', 'UPDATE') not null,
	user_name varchar(50) not null,
	action_date date,
	action_time time
);

delimiter //

create trigger ecommerce.product_insert_trigger
before insert on product
for each row
begin
    insert into log_product (action_name, user_name, action_date, action_time)
    values ('INSERT', user(), current_date, current_time);
end //

create trigger ecommerce.product_delete_trigger
after delete on product
for each row
begin
    insert into log_product (action_name, user_name, action_date, action_time)
    values ('DELETE', user(), current_date, current_time);
end //

create trigger ecommerce.product_update_trigger
before update on product
for each row
begin
    insert into log_product (action_name, user_name, action_date, action_time)
    values ('UPDATE', user(), current_date, current_time);
end //

create trigger ecommerce.category_insert_trigger
before insert on category
for each row
begin
    insert into log_category (action_name, user_name, action_date, action_time)
    values ('INSERT', user(), current_date, current_time);
end //

create trigger ecommerce.category_delete_trigger
after delete on category
for each row
begin
    insert into log_category (action_name, user_name, action_date, action_time)
    values ('DELETE', user(), current_date, current_time);
end //

create trigger ecommerce.category_update_trigger
after update on category
for each row
begin
    insert into log_category (action_name, user_name, action_date, action_time)
    values ('UPDATE', user(), current_date, current_time);
end //

delimiter ;

-- insert into product (product_name, product_price, product_description, category_id)
-- values ('Test Product', 100, 'This is a test product', 1);

-- update product
-- set product_price = 150
-- where product_id = 31;

-- delete from product
-- where product_id = 31;

-- select * from log_product;

-- insert into category (category_name) 
-- values ('Test Category');

-- update category
-- set category_name = 'Updated Category'
-- where category_id = 16;

-- delete from category
-- where category_id = 16;

-- select * from ecommerce.log_category;





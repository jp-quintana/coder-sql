use ecommerce;

set sql_safe_updates = 0;
set foreign_key_checks = 0;
set autocommit = 0;

rollback;
start transaction;

delete from product where product_id in (1, 2, 3);

-- rollback;
-- commit; 

rollback;
start transaction;

insert into category (category_name) 
values 
    ('vestidos'),
    ('camisas'),
    ('pantalones'),
    ('zapatos');

savepoint sp1;

insert into category (category_name) 
values 
    ('accesorios de moda'),
    ('ropa deportiva'),
    ('ropa interior'),
    ('ropa de bebés');

savepoint sp2;

-- rollback;
-- commit;


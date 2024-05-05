create or replace view ecommerce.user_cart_view as 
select
    u.user_id,
    u.first_name,
    u.last_name,
    c.cart_id,
    count(ci.cart_item_id) as total_items,
    sum(p.product_price * ci.quantity) as total_price
from 
    user u
join 
    cart c on u.user_id = c.user_id
left join 
    cart_item ci on c.cart_id = ci.cart_id
left join  
    product p on ci.product_id = p.product_id
group by
    u.user_id, c.cart_id;   
    
create or replace view ecommerce.purchase_details_view as
select 
    p.purchase_id,
    p.city,
    p.country,
    p.created_at as purchase_date,
    u.first_name as user_first_name,
    u.last_name as user_last_name,
    pr.product_name,
    pr.product_price,
    pi.quantity,
    (pr.product_price * pi.quantity) as total_price
from 
    purchase p
join 
    user u on p.user_id = u.user_id
join 
    purchase_item pi on p.purchase_id = pi.purchase_id
join 
    product pr on pi.product_id = pr.product_id;
       
create or replace view ecommerce.user_favorite_view as
select 
    u.user_id,
    u.first_name,
    u.last_name,
    f.favorite_id,
    p.product_name as favorite_product
from 
    user u
join 
    favorite f on u.user_id = f.user_id
join 
    product p on f.product_id = p.product_id;
 
create or replace view ecommerce.product_review_view as
select 
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
order by  r.review_rating desc;

create or replace view ecommerce.user_purchase_history_view as
select 
    u.user_id,
    u.first_name,
    u.last_name,
    p.purchase_id,
    p.city as purchase_city,
    p.country as purchase_country,
    p.created_at as purchase_date,
    sum(pi.quantity) as total_items_purchased,
    sum(pi.quantity * pr.product_price) as total_purchase_amount
from 
    user u
join 
    purchase p on u.user_id = p.user_id
join 
    purchase_item pi on p.purchase_id = pi.purchase_id
join 
    product pr on pi.product_id = pr.product_id
group by 
    u.user_id, p.purchase_id;

-- select * from user_cart_view;
-- select * from purchase_details_view;
-- select * from user_favorite_view;user_purchase_history_view
-- select * from product_review_view;
-- select * from user_purchase_history_view;

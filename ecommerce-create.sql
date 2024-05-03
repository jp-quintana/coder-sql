drop schema if exists ecommerce;
create schema if not exists ecommerce;
use ecommerce;

create table user(
	user_id int auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(30) not null,
    birthdate date not null,
    password varchar(30) not null,
    created_at timestamp default current_timestamp
);

create table address(
	address_id int auto_increment primary key,
    city varchar(30) not null,
    country varchar(30) not null,
    zipcode varchar(10) not null,
    state varchar(30) not null,
    street_name varchar(30) not null,
    street_number varchar(30) not null,
    created_at timestamp default current_timestamp
);

create table user_address(
	user_address_id int auto_increment primary key,
    user_id int not null,
    shipping_address_id int not null,
    billing_address_id int not null,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references user(user_id),
    foreign key (shipping_address_id) references address(address_id),
    foreign key (billing_address_id) references address(address_id)
);

create table category(
	category_id int auto_increment primary key,
	category_name varchar(30) not null,
	created_at timestamp default current_timestamp
);

create table product(
	product_id int auto_increment primary key,
	product_name varchar(50) not null,
	product_price int not null,
	product_description varchar(300) not null,
	category_id int not null,
	created_at timestamp default current_timestamp,
	foreign key (category_id) references category(category_id)
);

create table cart(
	cart_id int auto_increment primary key,
    user_id int not null,
	created_at timestamp default current_timestamp,
	foreign key (user_id) references user(user_id)
);

create table cart_item(
	cart_item_id int auto_increment primary key,
    quantity int not null check (quantity > 0),
    product_id int not null,
    cart_id int not null,
    created_at timestamp default current_timestamp,
    foreign key (product_id) references product(product_id),
    foreign key (cart_id) references cart(cart_id)
);

create table purchase(
	purchase_id int auto_increment primary key,
    city varchar(30) not null,
    country varchar(30) not null,
    zipcode varchar(10) not null,
    state varchar(30) not null,
    street_name varchar(30) not null,
    street_number varchar(30) not null,
    user_id int not null,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references user(user_id)
);

create table purchase_item(
	purchase_item_id int auto_increment primary key,
    quantity int not null check (quantity > 0),
    product_id int not null,
    purchase_id int not null,
    created_at timestamp default current_timestamp,
    foreign key (product_id) references product(product_id),
    foreign key (purchase_id) references purchase(purchase_id)
);

create table review(
	review_id int auto_increment primary key,
    review_rating decimal(3,1) not null check (review_rating  >= 1 AND review_rating  <= 5),
    review_comment varchar(300) not null,
    user_id int not null,
    product_id int not null,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references user(user_id),
    foreign key (product_id) references product(product_id)
);

create table favorite(
	favorite_id int auto_increment primary key,
    product_id int not null,
    user_id int not null,
	created_at timestamp default current_timestamp,
	foreign key (product_id) references product(product_id),
    foreign key (user_id) references user(user_id)
);



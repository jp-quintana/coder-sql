use mysql;

create user if not exists 'user_readonly'@'localhost' identified by 'abc123' ;
create user if not exists 'user_readinsertupdate'@'localhost' identified by 'abc123' ;
flush privileges; -- refrescar los permisos de mysql

grant select on ecommerce.* to 'user_readonly'@'localhost';
grant select, insert, update on  ecommerce.* to 'user_readinsertupdate'@'localhost';

show grants for 'user_readonly'@'localhost';
show grants for 'user_readinsertupdate'@'localhost';
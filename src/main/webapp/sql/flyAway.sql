create database flyAway;
use flyAway;
create table login(id int primary key auto_increment, username varchar(50), name varchar(50), password varchar(50));
drop table loing;
insert into login(username, name, password) values('kiran123', 'Kiran', '123');
select * from login;

create table sources(id int primary key auto_increment, sourceName varchar(100));
insert into sources(sourceName) values('Kaikaram');
delete from sources where id=1;
select * from airLines;
delete from airLines where id=9;
show tables;
select * from bookinginformation; 
select * from passenger;
delete from passenger where id=17;
delete from bookinginformation where id=24;
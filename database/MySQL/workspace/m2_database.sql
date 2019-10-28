CREATE DATABASE db01;
use db02;
show databases;
show collation like '%big5%';						   
show character set;									   
alter database db02									   -- change db02 language
character set big5
collate big5_bin;
select @@character_set_database, @@collation_database; -- show which language
drop database db02;                                    -- delete database
create database db02;

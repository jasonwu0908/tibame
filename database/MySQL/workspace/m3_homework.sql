CREATE TABLE food(
	id				CHAR(5)			PRIMARY KEY,
    name			VARCHAR(30) 	NOT NULL,
	expiredate		DATE			NOT NULL,
    placeid			CHAR(2)			NOT NULL,
	price			int unsigned	NOT NULL,
    catalog			VARCHAR(20)		NOT NULL
);


    
DESC food;

ALTER TABLE food
CHANGE expiredate expiredate DATE;
   
ALTER TABLE food
CHANGE ename name VARCHAR(30);

create table place(
	id		char(2)			primary KEY,
    name	varchar(20)		not null	
);
desc place;

create table food1 like food;

alter table food1 add chili char(10) FIRST;

desc food1;

alter table food1 modify chili int after id;

alter table food1 change chili `hot dog` char;   -- CAN'T SPACE --

alter table food1 drop hotdog ;

select * from food2;

alter table food1 rename food2;

drop table food2;
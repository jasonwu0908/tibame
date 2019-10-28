CREATE TABLE employee(
	empno		decimal(4)		PRIMARY KEY,
    ename		varchar(30)		NOT NULL,
    hiredate	date			NOT NULL,
    salary		int				NOT NULL,
    deptno		decimal(3)		NOT NULL,
    title		varchar(20)		NOT NULL
);

CREATE TABLE `db01`.`department` (
  `deptno` DECIMAL(3) NOT NULL,
  `dname` VARCHAR(30) NOT NULL,
  `mgrno` DECIMAL(4) NULL,
  PRIMARY KEY (`deptno`));
  
  SHOW TABLE STATUS IN db01;
  SHOW TABLES;
  DESC employee;
  
  
  DESC t;
  CREATE TABLE t (a int, b char(10), c float);               -- 建立表格t --
  
  ALTER TABLE t 											-- 增加欄位d 到表格最後(預設) --
	ADD d varchar(30);
    
  ALTER TABLE t 											-- 增加欄位d 到表格第一排 --
	ADD q varchar(30) FIRST;
    
  ALTER TABLE t 											-- 增加欄位d 到表格b後面 --
	ADD j varchar(30) AFTER b;
    
  alter TABLE t												-- 修改欄位d 的資料型態 --
	modify d varchar(50);
    
  alter TABLE t												-- 修改欄位d 的資料型態並放到第一排 --
	modify d varchar(50) FIRST;    
  
  alter TABLE t
	modify d varchar(50) AFTER c;  

   DESC t1;													-- 顯示表格t1 --
   
   ALTER TABLE t 											-- 更改欄位d名稱為e 並改資料型態 --
	CHANGE d e decimal(10,2);
    
   ALTER TABLE t											-- 刪除欄位q --
	DROP q;
    
   ALTER TABLE t											-- 更改表格名稱t為t1 (不建議使用) --
	RENAME t1;
    
DROP TABLE t1;												-- 刪除表格t1 --
    
    
CREATE TABLE food(
	id				CHAR(5)			PRIMARY KEY,
    ename			VARCHAR(30) 	NOT NULL,
	expiredate		DATE		NOT NULL,
    placeid			CHAR(2)			NOT NULL,
	price			int unsigned	NOT NULL,
    catalog			VARCHAR(20)		NOT NULL
);
    
DESC food;
   
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














  
  
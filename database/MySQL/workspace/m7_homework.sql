select * from food;
select * from place;

-- 1.	以不列舉欄位的方式新增一筆食物資料
insert into food 
values 			 ('JS002', '老乾媽', '2021-08-25', 'TL', 400, '調味料');

-- 2.	以列舉欄位的方式新增一筆食物資料
insert into food (id, name, expiredate, placeid, price, catalog)
values 			 ('JS001', '熔岩蛋糕', '2019-12-25', 'TW', 600, '點心');


update food
set		catalog = '調味品'
where	id = 'JS002';


-- 3.	以不列舉欄位的方式新增多產地資料
insert into place
values 		('CH','中國');


-- 4.	修改一筆食物資料的價格
update food
set		price = 1000
where	id = 'JS002';

-- 5.	按價格分250以下、251~500和501以上
-- 		三種分別增加8%,5%和3%且價格無條件捨去成整數
update food1
set price = case
				when price <= 250 then floor(price * 1.08)
				when price >= 501 then floor(price * 1.03)
				else floor(price * 1.05)
			end ;

update food
set price = case
				when price <= 250 then floor(price * 1.08)
				when price >= 501 then floor(price * 1.03)
				else floor(price * 1.05)
			end ;
            
-- set sql_safe_updates=0;
-- set sql_safe_updates=1;
-- 需解鎖

       
-- 6.	刪除一筆食物資料
delete from food
where id = 'JS002';








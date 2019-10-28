-- 1.	使用food和place資料表的食物編號、食物名稱、到期日、
-- 產地名稱和價格來建立一個View名為food_vw；並使用food_vw來查詢所有資料
create view food_vw (食物編號, 食物名稱, 到期日, 產地名稱, 價格)
as select f.id, f.name, f.expiredate, p.name, f.price
from food f join place p
on f.placeid = p.id;

select * from food_vw;


-- 2.	新建一個View名為place_vw，
-- 	欄位為每個產地最低價格、最高價格和平均價格
create view place_vw (最低價格, 最高價格, 平均價格)
as select min(price), max(price), avg(price)
from food;


select * from place_vw;



-- 3.	新建一個View名為food_dessert_vw，
-- 		有food資料表所有欄位，包含種類為'點心'的資料
create view food_dessert_vw 
as select *
from food
where catalog like '點心';

select * from food_dessert_vw;



-- 4.	使用food_dessert_vw去修改'太陽餅'的價格
update food_dessert_vw
set price = 2000
where name like '太陽餅';

set sql_safe_updates = 0;
set sql_safe_updates = 1;



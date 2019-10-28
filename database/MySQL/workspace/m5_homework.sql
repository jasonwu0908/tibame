-- 1.	查詢所有食物名稱、產地編號、產地名稱和價格
select f.name, f.placeid, p.name, f.price									-- Q.1
from food f join place p
on f.placeid = p.id;


-- 2.	查詢所有食物名稱和產地名稱，並串接成一個字串，中間以空白隔開，
-- 		並將表頭重新命為'Food name & place'
select concat(f.name, " ", p.name) 'Food name & place'						-- Q.2
from food f join place p
on f.placeid = p.id;


-- 3.	查詢所有'台灣'生產的食物名稱和價格
select p.name, f.name, f.price												-- Q.3
from food f join place p
on f.placeid = p.id
where p.name like '台灣';


-- 4.	查詢所有'台灣'和'日本'生產的食物名稱和價格，並以價格做降冪排序
select p.name, f.name, f.price												-- Q.4
from food f join place p
on f.placeid = p.id
where p.name like '台灣' or p.name like '日本'
order by f.price desc;


-- 5.	查詢前三個價格最高且'台灣'生產的食物名稱、到期日和價格，並以價格做降冪排序
select p.name, f.name, f.expiredate, f.price								-- Q.5
from food f join place p
on f.placeid = p.id
where p.name like '台灣'
order by f.price desc
limit 0, 3;


-- 6.	查詢每個產地(顯示產地名稱)最高、最低、加總和平均價格，
-- 		表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
select p.name '產地', 														-- Q.6			
max(f.price) 'Max', min(f.price) 'Min', 
sum(f.price) 'Sum', round(avg(f.price)) 'Avg'
from food f join place p 
on f.placeid = p.id
group by p.name;


-- 7.	查詢不同產地(顯示產地名稱)和每個種類的食物數量
select p.name '產地', f.catalog '種類', count(f.catalog)					-- Q.7
from food f join place p
on p.id = f.placeid
group by f.catalog, p.name 
order by p.name;




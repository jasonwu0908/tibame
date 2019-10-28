INSERT INTO food VALUES ('CK001', '曲奇餅乾', '2020/01/10', 'TL', 250, '點心');
INSERT INTO food VALUES ('CK002', '蘇打餅乾', '2021/10/12', 'TW', 80, '點心');
INSERT INTO food VALUES ('DK001', '高山茶', '2018/05/23', 'TW', 780, '飲料');
INSERT INTO food VALUES ('DK002', '綠茶', '2018/06/11', 'JP', 530, '飲料');
INSERT INTO food VALUES ('OL001', '苦茶油', '2029/03/16', 'TW', 360, '調味品');
INSERT INTO food VALUES ('OL002', '橄欖油', '2019/07/25', 'TL', 420, '調味品');
INSERT INTO food VALUES ('CK003', '仙貝', '2018/11/01', 'JP', 270, '點心');
INSERT INTO food VALUES ('SG001', '醬油', '2020/05/05', 'JP', 260, '調味品');
INSERT INTO food VALUES ('OL003', '葡萄子油', '2020/05/05', 'JP', 550, '調味品');
INSERT INTO food VALUES ('CK004', '鳳梨酥', '2018/10/12', 'TW', 340, '點心');
INSERT INTO food VALUES ('CK005', '太陽餅', '2018/08/27', 'TW', 150, '點心');
INSERT INTO food VALUES ('DK003', '紅茶', '2022/11/12', 'TL', 260, '飲料');
INSERT INTO food VALUES ('SG002', '醋', '2030/09/18', 'TW', 60, '調味品');

INSERT INTO place VALUES ('TW', '台灣');
INSERT INTO place VALUES ('JP', '日本');
INSERT INTO place VALUES ('TL', '泰國');
INSERT INTO place VALUES ('US', '美國');

select * from food;

select name '名稱', expiredate '到期日', price '價格' from food;							-- Q.3


-- 4.	查詢所有食物的種類有哪些？(重覆的資料只顯示一次)
select distinct catalog  from food;															-- Q.4


-- 5.	查詢所有食物名稱和種類，並串接成一個字串，中間以空白隔開，
-- 		並將表頭重新命為'Food name & catalog'
select concat(name,' ', catalog) 'Food name & catalog' from food ; 							-- Q.5  重要!!!


-- 6.	查詢所有食物價格超過400的食物名稱和價格
select name, price from food where price > 400;     										-- Q.6


-- 7.	查詢所有食物價格介於250~530之間的食物名稱和價格
select name, price from food where price between 250 and 530; 								-- Q.7


-- 8.	查詢所有食物價格不介於250~530之間的食物名稱和價格
select name, price from food where price NOT between 250 and 530; 							-- Q.8   	


-- 9.	查詢所有食物種類為'點心'的食物名稱和價格
select name, price from food where catalog like '點心'; 									-- Q.9 


-- 10.	查詢所有食物種類為'點心'和'飲料'的食物名稱、價格和種類
select name, price, catalog from food where catalog like '點心' or catalog like '飲料'; 	-- Q.10 


-- 11.	查詢所有食物產地為'TW'和'JP'的食物名稱和價格
select name, price, placeid from food where placeid like 'TW' OR placeid like 'JP'; 		-- Q.11


-- 12.	查詢所有食物名稱有'油'字的食物名稱、到期日和價格
select name, expiredate, price from food where name like '%油%'; 							-- Q.12


-- 13.	查詢所有食物到期日在今年底以前到期的食物名稱和價格
select name, price, expiredate from food where year(expiredate) <= year(sysdate());			-- Q.13


-- 14.	查詢所有食物到期日在明年6月底以前到期的食物名稱和價格
select name, price, expiredate from food where year(expiredate) <= (year(sysdate() + interval 1 year))
												and month(expiredate) < 7;					-- Q.14


-- 15.	查詢所有食物6個月內到期的食物名稱和價格
select name, price, expiredate from food where (expiredate - sysdate()) < 7;				-- Q.15



				--  ORDER BY子句 --


-- 16.	查詢所有食物名稱、到期日和價格，並以價格做降冪排序
select name, expiredate, price from food order by price desc;								-- Q.16


-- 17.	查詢前三個價格最高的食物名稱、到期日和價格，並以價格做降冪排序
select name, expiredate, price from food order by price desc limit 3;						-- Q.17


-- 18.	查詢種類為'點心'且價格低於等於250的食物名稱和價格，並以價格做升冪排序
select name, price, catalog from food 														-- Q.18
	where catalog LIKE '點心' AND price <= 250
    order by price;


-- 19.	顯示所有食物名稱、價格和增加5%且四捨五入為整數後的價格，
-- 		新價格並將表頭命名為'New Price'
select name, price, round(price * 1.05) 'New Price' from food;								-- Q.19


-- 20.	接續上題，再增加一個表頭命名為'Increase'，顯示New price減去price的值
select name, price, round(price * 1.05) 'New Price', (round(price * 1.05) - price) 'Increase'
from food; 																					-- Q.20


-- 21.	顯示所有食物名稱、價格和整數後的價格，新價格並將表頭命名為'New Price'；
-- 		按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
select name, price,																			-- Q.21       
	case 
		when price <= 250 then floor(price * 1.08) 
		when price between 251 and 500 then floor(price * 1.05)
		when price > 501 then floor(price * 1.03)
	end 'New Price'
    from food;
    

-- 22.	查詢所有食物名稱、種類、距離今天尚有幾天到期(正數表示)或已過期幾天(負數表示)和
-- 		註記(有'已過期'或'未過期'兩種)，
-- 		並將後兩者表頭分別命名為'Days of expired'和'expired or not'   
select name, catalog, datediff(expiredate, now() ) 'Days of expired',						-- Q.22
    case
		when expiredate <= sysdate() then '已過期'
		when expiredate >= sysdate() then '未過期'
	end 'expired or not'
    from food;
 
 
 -- 23.	接續上題，並以過期天數做升冪排序
select name, catalog, datediff(expiredate, now()) 'Days of expired',						-- Q.23
    case
		when expiredate <= sysdate() then '已過期'
		when expiredate >= sysdate() then '未過期'
	end 'expired or not'
    from food
    order by datediff(expiredate, now());
    


					--  GROUP BY & HAVING子句 --

-- 24.	查詢所有食物最高、最低、加總和平均價格，
-- 表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
select sum(price) 'Sum', round(avg(price)) 'Avg', 											-- Q.24
max(price) 'Max', min(price) 'Min'
from food;


-- 25.	接續上題，查詢每個種類
select catalog, sum(price) 'Sum', round(avg(price)) 'Avg', 									-- Q.25
max(price) 'Max', min(price) 'Min'
from food
group by catalog;
    
    
-- 26.	接續上題，查詢每個種類且平均價格超過300，並以平均價格做降冪排序 
select catalog, sum(price) 'Sum', round(avg(price)) 'Avg', 									-- Q.26
max(price) 'Max', min(price) 'Min'
from food
group by catalog
having round(avg(price)) > 300
order by round(avg(price)) desc;


-- 27.	顯示查詢每個種類的食物數量
select catalog '種類', count(catalog) '數 量'												-- Q.27
from food
group by catalog;


-- 28.	查詢不同產地和每個種類的食物數量
select placeid '產地', count(catalog) '種類', count(catalog) '數 量'						-- Q.28	
from food
group by placeid;
        
        
        
        
        
        
        
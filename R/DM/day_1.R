setwd("./workspace")
getwd()
source("tryCatch1.R", echo = T)
source("tryCatch2.R", echo = T)


data <- c(1, 2, 3, 6, 3)
scale(data, center=T,scale=T)


tmp <- c(2,3,8,NA,4,NA,9,12,NA,0/0,1/0)
is.na(tmp)
any(is.na(tmp))
sum(is.na(tmp))
is.nan(0/0)
is.nan(tmp)

summary(tmp)

#===========================
install.packages("mice")
library(mice)
install.packages("missForest")
library(missForest)

data <- prodNA(iris, noNA = 0.05)
complete.cases(data)
summary(data)


install.packages("VIM") #安裝圖形檢視遺漏值套件
library(VIM) #載入圖形檢視遺漏值套件
aggr_plot <- aggr(data, col = c('navyblue', 'red'), numbers=TRUE, sortVars=TRUE,
                    labels=names(data), cex.axis=.7, gap=4,
                    ylab=c("Histogram of missing data", "Pattern"))




str(data)
new_data <- data[complete.cases(data), ]
complete.cases(new_data)
dim(new_data)
str(new_data)
summary(new_data)


new_data1 <- data

# 算出各欄的平均數
new_data1.mean_col_1 <- mean(new_data1[, 1], na.rm = T)
new_data1.mean_col_2 <- mean(new_data1[, 2], na.rm = T)
new_data1.mean_col_3 <- mean(new_data1[, 3], na.rm = T)
new_data1.mean_col_4 <- mean(new_data1[, 4], na.rm = T)

# 取出各欄位中有遺漏值的“列位置”
na.rows1 <- is.na(new_data1[, 1])
na.rows2 <- is.na(new_data1[, 2])
na.rows3 <- is.na(new_data1[, 3])
na.rows4 <- is.na(new_data1[, 4])

#用平均數取代遺漏值
new_data1[na.rows1,1] <- new_data1.mean_col_1
new_data1[na.rows2,2] <- new_data1.mean_col_2
new_data1[na.rows3,3] <- new_data1.mean_col_3
new_data1[na.rows4,4] <- new_data1.mean_col_4
summary(new_data1)

#================================

mice.data <- mice(data,
                  m = 3, # 產生三個遺漏值被填補好的資料表
                  maxit = 30, # 最大疊代數max iteration
                  method = "cart", # 使用CART決策樹，進行遺漏值預測
                  seed = 188) # 令抽樣每次都一樣

new_data1 <- complete(mice.data, 1) #第一個結果
new_data2 <- complete(mice.data, 2) #第二個結果
new_data3 <- complete(mice.data, 3) #第三個結果

summary(data)
summary(new_data1)
summary(new_data2)
summary(new_data3)

Training_data_set <- new_data2 #選用第二個結果來當成模型訓練資料集
kmeans(Training_data_set[-5] , nstart=20, centers=5) #跑分群演算法
mice.data <- mice(data,
                  m = 3, # 產生三個遺漏值被填補好的資料表
                  maxit = 30, # 最大疊代數max iteration
                  method = "rf", # 使用隨機森林，進行遺漏值預測
                  seed = 188) # 令抽樣每次都一樣



#====================================

# 使用隨機森林，進行遺漏值預測
mice.data <- mice(data,
                    m = 1,
                    maxit = 30,
                    method = "rf",
                    seed = 188)
new_data1 <- complete(mice.data, 1)

summary(data)
summary(new_data1 )

kmeans(new_data1 [-5] , nstart=20, centers=5) 



#=======================
data(cars)
str(cars)
summary(cars)


# 將速度分成3類,
# 第一類 speed<12 ; 第二類 speed <15 ; 第三類 speed >= 15
cars$speed
x1 = cars$speed
new_cars_band = 1*(x1<12) + 2*(x1>=12 & x1<15) + 3*(x1>=15)
new_cars_band

# 將數字標籤轉成文字
label = c('慢','中','快')
new_cars_band = label[new_cars_band]
new_cars_band

# 再將速度標籤轉碼，變成車種標籤
# '慢' , '中' 轉成 '一般轎車' ; '快' 轉成'跑車'
# 使用 %in%
car_categ = c('一般轎車','跑車')
new_cars_band_1 = 1*(new_cars_band %in% c('慢','中')) + 2*(new_cars_band %in% c('快'))
new_cars_band_1 = car_categ[new_cars_band_1]

new_cars_band_1 



# 再將車種標籤轉碼
# '一般轎車'轉成 1 ; '跑車'轉成 0
new_cars_band_2 = 1*(new_cars_band_1 %in% c('一般轎車')) + 0*(new_cars_band_1 %in% c('跑車'))
# 也可使用 ifelse (條件式, 真, 假)，效果一樣
new_cars_band_2 = ifelse(new_cars_band_1 =='一般轎車', 1,0)

new_cars_band_3 = ifelse(new_cars_band %in% c('慢','中') ,'一般轎車', '跑車')

new_cars_band_2
new_cars_band_3




# within就像是SQL語法中的Case When
# 將速度分成3類, 慢: speed<12 ; 中: speed <15 ; 快 speed >= 15
new_cars <- cars
new_cars <- within(new_cars,
                     {
                       speed_level <- NA #一定要指定一個值
                       speed_level[cars$speed<12] <- "慢"
                       speed_level[cars$speed>=12 & cars$speed<15] <- "中"
                       speed_level[cars$speed>=15] <- "快"
                     }
)
head(new_cars,5)




# 產生新欄位
new_cars <- cars
new_cars <- transform(new_cars,
                      new_var1 = new_cars$speed * new_cars$dist ,
                      new_var2 = new_cars$dist * 100
                      )
head(new_cars,10)



# sort
data(cars)
cars$speed
sort(cars$speed, dec=T) #降冪排序 dec=T



# 傳回各元素的排名
math_score <- c(100,99,47,76,92)
math_score

rank(math_score) #預設是由小排到大

# 由大排到小的程式寫法技巧
abs(rank(math_score) -5) +1
(max(rank(math_score))+1) - rank(math_score)


# c、union、cbind 與 Rbind
x1 = c(1,2,3)
x2 = c(4,5,6)
x3 = c(7,8,9)
TTL = c(x1,x2,x3)
TTL


# c、union、cbind 與 Rbind
rbind(x1,x2,x3)
cbind(x1,x2,x3)



# merge()，如同SQL語法中的 join
# 先建立資料
a <- data.frame(T_name=c('Tony','Orozco','Justin'), Age=c(25,24,26))
a
aa = as.matrix(a)
class(aa)
aa
aaa = aa[,1]
aaa
class(aaa)
class(c(1,'a',3,4))
str(aaa)
#============================================
test <- data.frame(x = c(26, 21, 20), y = c(34, 29, 28))
class(test)
test


b <- data.frame(T_name=c('Tony','Orozco','Justin','Carol'),
                Salary=c(20000,25000,30000,18000) )
b
b$T_name[2]

c <- c(20000,25000,30000)

d = cbind(a, c)
d
colnames(d)[3] = 'salary'
class(d)

# merge()，如同SQL語法中的 join
#預設是 inner join
merge(a, b, by.x="T_name", by.y="T_name")


# all.x=TRUE就是 left join
merge(b, a, by.x="T_name"
        , by.y="T_name"
        , all.x=TRUE)

merge(a, b, by.x="T_name"
      , by.y="T_name"
      , all.x=TRUE)



install.packages("sqldf")
library(sqldf)
sqldf("SELECT * FROM iris")
sqldf("SELECT Species,count('Sepal.Length')as cnt FROM iris group by Species")

class( sqldf("SELECT Species,count(*)as cnt FROM iris group by
Species") )




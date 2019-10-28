chickwts
splt1 = split(chickwts$weight, chickwts$feed)
splt1
data()

#搭配sample函式隨機切割資料
chickwts[ sample(1:nrow(chickwts) ,10, replace= F), ] #隨機取5筆資料



#製作兒童健檢資料
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:25,8,replace = TRUE)
Gender <- c("男", "女", "男", "男", "男", "女", "女", "女")


High <- sample(120:150,10000,replace = TRUE)
str(High)
View(High)
Weight <- sample(20:25,10000,replace = TRUE)
Gender <- c("男", "女", "男", "男", "男", "女", "女", "女")
Gender1 = sample(Gender,10000,replace = TRUE)
str(Gender1)

#邏輯值
High > 130

High[High > 130] #想知道身高130以上的身高分布

Gender[High >130] #想知道身高130以上的性別分布

report <- data.frame(High, Weight, Gender)
boy.pass <- report[Gender == "男" & High>130 , ] #挑選身高大於130的男童
boy.pass

#==================================================

#使用 rownames做為切割條件
iris
rownames(iris)
#切割rownames是7的倍數的觀察值
iris[ as.integer(rownames(iris))%% 7 == 0, ]

# subset( 欲切割的物件, 切割條件, 欄位挑選)
iris
subset(iris, iris$Sepal.Length>7)
subset(iris, iris$Sepal.Length>7, select = c(Sepal.Length, Species))


#=====================================================


install.packages("dplyr")
library(dplyr)




# 哪些是類別變數? 哪些是數值變數?
install.packages('C50')
library(C50)
?(churn)
data(churn)
str(churnTrain)


#某商店上周七天的營業額
x <- c(85,34,55,62,63,68,76)
mean(x) #平均數

range(x) #組距範圍
median(x)#中位數
sd(x)#標準差
var(x) #變異數
sd(x)^2 #標準差的平方
max(x) #最大值
min(x)#最小值
quantile(x)#分位數, 50%的位置是63

cd = sd(x)/mean(x)
cd


#製作兒童健檢資料
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:28,8)
cor(High,Weight) #相關係數


# 使用空氣品質資料 airquality
data(airquality)
head(airquality,6)
cor(airquality[,1:4], use = "pairwise") #產出兩兩相關的相關係數矩陣
pairs(airquality[,1:4]) #繪圖


#==========================================


#交叉分析表 ftable
z <- data.frame(Main= c('豚','牛','牛','牛','豚','牛','豚'), sub=c('有','沒有','沒有','有','有','有','沒有') , drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z
ftable(z, row.vars = 1:2, col.vars = "drink")
ftable(z, row.vars = "Main", col.vars = "drink")



install.packages("plyr")
library(plyr)


# 產生40筆隨機資料
df <- data.frame(
  group = c(rep('個人戶', 20), rep('企業戶', 20)),
  sex = sample(c("M", "F"), size = 40, replace = TRUE),
  age = floor(runif(n = 40, min = 25, max = 40)),#均勻分配
  bill = floor(runif(n = 40, min = 199, max = 2600))
)

df

# 利用group, sex進行分組，並計算年齡的平均數、標準差以及bill總和與平均
ddply(df, .(group, sex), summarize,
        mean_age = round(mean(age), 2),
        sd_age = round(sd(age), 2),
        sum_bill = sum(bill),
        mean_bill = round(mean(bill), 2)
)


#計算資料筆數count
df1 = ddply(df, c('group','sex'), nrow)
colnames(df1)[ncol(df1)] = 'count'
df1
ddply(df, c('group','sex','age'), nrow) #是不是很像樞紐分析表的原始資料




install.packages("vcd")
library(vcd)
# bill的百分比??????
df
prop.table(df$bill)
data.frame(df$bill,prop.table(df$bill))

table(df$age)
#轉成百分比
prop.table( table(df$age) )


#二維列聯表轉成百分比
df
table(df$group, df$age)
prop.table(table(df$group, df$age) ) # 表格內全部加總 = 1



#散佈圖
data(iris)
attach(iris)
plot(Petal.Length~Petal.Width, col=Species) #散佈圖指令

lmTrain <- lm(formula = Petal.Length ~ Petal.Width, data = iris) #簡單迴歸
abline(reg = lmTrain$coefficients, col = "blue", lwd = 1) #函數繪製輔助線



# 長條圖
data(mtcars)
attach(mtcars)
table(cyl) #利用汽缸數產生次數分配
mtcars

T_cyl = table(cyl)
barplot(T_cyl , main="cyl 汽缸數次數分配表"
         , xlab="汽缸數"
         , col=c("red", "blue","green")
         , names.arg=c("4 汽缸", "6 汽缸", "8 汽缸")
         , border = "cyan")
# col 指派直條圖顏色
#文字 "black" "red" "green3" "blue" "cyan" "magenta" "yellow" "gray"
#
#數字  col=1黑, col=2紅, col=3綠, col=4深藍, col=5天藍, col=6玫瑰紅, col=7黃
# names.arg指派X軸標籤


barplot(T_cyl ,
        main="cyl 汽缸數次數分配表",
        xlab="汽缸數",
        col=c("red", "blue", "green"),
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), border = "cyan",
        horiz=TRUE)
# horiz=TRUE 畫橫式直條圖

prop.table( table(cyl) )
T_cyl1 = prop.table( table(cyl) )

barplot(T_cyl1 , 
        main="cyl 汽缸數次數分配表", 
        xlab="汽缸數", 
        col=c("red","blue", "green"), 
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), 
        border = "cyan",
        horiz=TRUE)
        
        

# 分組長條圖
T_cyl2 = table(am,cyl) #建立 變速器與汽缸數交叉表
T_cyl2

barplot(T_cyl2 ,
        main="cyl 汽缸數次數分配表",
        xlab="汽缸數",
        col=c("red", "blue"),
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"),
        border = "cyan",
        horiz=FALSE,
        legend = rownames(T_cyl2), beside=TRUE)

barplot(T_cyl2 ,
        main="cyl 汽缸數次數分配表",
        xlab="汽缸數",
        col=c("red", "blue"),
        names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"),
        border = "cyan",
        horiz=FALSE,
        legend = rownames(T_cyl2), beside=F)
# legend 是圖例
# beside是分組圖還是堆疊圖


# 長條圖(百分比堆疊圖)
prop.table( table(am,cyl) ,2)

T_cyl3 = prop.table( table(am,cyl) ,2)
par(las=1) #標籤=1，表示標籤文字為水平。 標籤=2，表示標籤文字為垂直。
barplot(T_cyl3 , main="cyl 汽缸數次數百分比堆疊圖", xlab="汽缸數", col=c("red", "blue"),
          names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), border = "cyan",
          horiz=FALSE, legend = c('自動','手動'), beside=FALSE, cex.names=2)
#cex.names=2 表示標籤文字大小為原來的兩倍



# 長條圖(百分比堆疊圖)
barplot(T_cyl3 , main="cyl 汽缸數次數百分比堆疊圖", xlab="汽缸數",
          col=c("red", "blue"), names.arg=c("4 汽缸", "6 汽缸", "8 汽缸"), border = "cyan",
          horiz=FALSE, legend = c('自動','手動'), beside=FALSE, cex.names=2, space=2)
#space=2 表示直條間的距離



#使用電信業客戶流失資料
library(C50)
data(churn)
View(churnTrain)
attach(churnTrain)
par(mfrow=c(2,2)) #圖片區配置 2*2 的圖，共4個圖
#設定分組組數
hist(total_day_minutes, xlab=" 白天通話分鐘數", main="breaks =11",
       ylab="門號數", col="red" ) # 參數breaks預設為11
hist(total_day_minutes, xlab=" 白天通話分鐘數", main="breaks =2",
       ylab="門號數", col="red", breaks=2 ) # 參數breaks設為2
hist(total_day_minutes, xlab=" 白天通話分鐘數", main="breaks =20",
       ylab="門號數", col="red", breaks=20 ) # 參數breaks設為20
hist(total_day_minutes, xlab=" 白天通話分鐘數", main="breaks =7",
       ylab="門號數", col="red", breaks=7 ) # 參數breaks設為7



# 利用churnTrain資料集

par(mfrow=c(1,1)) #圖片區配置 2*2 的圖，共4個圖
boxplot(total_day_minutes,
        horizontal=TRUE,
        xlab="白天通話分鐘數", col="pink")


# 顯示白天、晚上與半夜的通話分鐘數
dt <- data.frame(total_eve_minutes, total_night_minutes,
                   total_day_minutes)
boxplot(dt, horizontal=TRUE, xlab="通話分鐘數", col="pink")


# 顯示白天、晚上與半夜的通話分鐘數
boxplot(dt, horizontal=FALSE, xlab="通話分鐘數", col=terrain.colors(3))
legend("topright", title="撥打分鐘數", c('eve','night','day'),
         fill=terrain.colors(3), horiz=F, ncol = 1, cex = 0.6)
# col=terrain.colors(3)選擇地球色3個
# 圖例的nocl為顯示欄位數；cex為文字的大小



# 分組的盒鬚圖，檢視在不同地區流失客戶與未流失客戶於晚上通話時間的分布
boxplot(total_eve_minutes~area_code*churn,horizontal=FALSE,
        xlab="夜晚通話分鐘數",col=terrain.colors(3))

summary(area_code*churn)
summary(area_code)
summary(churn)



# 簡單圓餅圖
pieces <- c(8,8,2,4,2)
pie(pieces , labels = c('工作','睡覺','念書','打電動','聊天'), main="生活時
間分配圖") 




# 簡單圓餅圖 加上百分比
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # 計算各個類別百分比
lbls <- paste(c('工作','睡覺','念書','打電動','聊天'),pct,'%', sep='')
pie(pieces , labels = lbls, main="生活時間分配圖") 


# 簡單圓餅圖 加上百分比
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # 計算各個類別百分比
lbls <- paste(c('工作','睡覺','念書','打電動','聊天'),pct,'%', sep='')
pie(pieces , labels = lbls, main="生活時間分配圖") 


# 簡單圓餅圖 加上百分比
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # 計算各個類別百分比
lbls <- paste(c('工作','睡覺','念書','打電動','聊天'),'\n',pct,'%', sep='')
pie(pieces , labels = lbls, main="生活時間分配圖", cex=1.5, cex.main=2)
#cex=1.5標籤字放大1.5倍；cex.main=2標題放大兩倍



# 利用線圖看趨勢
years <- sort(round(runif(10,2000,2010),0))
newbornbaby <- sort(round(runif(10,200,1000),0))
dt <- data.frame(newbornbaby,years)

par(mfrow=c(3,2)) #在一張畫布上輸出3*2個圖型
plot(newbornbaby ~ years , data=dt, type='l', col=1) #只畫線
plot(newbornbaby ~ years , data=dt, type='b', col=2) #畫線與點
plot(newbornbaby ~ years , data=dt, type='c', col=3) #把'b'的圖去點
plot(newbornbaby ~ years , data=dt, type='h', col=4) #垂直線
plot(newbornbaby ~ years , data=dt, type='s', col=5) #階梯圖



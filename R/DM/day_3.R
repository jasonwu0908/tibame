install.packages('treemap')
library(treemap)
y=data.frame(C_ID =c('群集1','群集2','群集3','群集4','群集5','群集6','群集7'),
               C_RTO=c(0.22,0.3,0.16,0.04,0.19,0.03,0.06)
)
treemap(y,index=c('C_ID'),vSize='C_RTO',vColor='C_RTO')


x <- read.table(file.choose(),header=T, sep=",", fileEncoding='big5') #選擇TaiwanGov.csv
treemap(x,index=c('縣市'),vSize='面積',vColor='面積')
x


treemap(x,index=c('縣市','行政區名稱'),vSize='人口數',vColor='面積', title='吳俊陞')









# 使用rnorm函數產生常態分佈的亂數，還可以指定平均數與標準差
set.seed(123)
x<- rnorm(100000, mean=20, sd=5)
hist(x)
summary(x)



# 使用runif函數產生均勻分佈(Uniform Distribution)的亂數，
# 可以指定最小值與最大值
set.seed(123)
x<- runif(60000, 1, 6)
hist(x)
summary(x)
x = 100


# H0: 該分布為常態, H1:該分布不是常態
data(iris)
shapiro.test(iris$Petal.Width)
hist(iris$Petal.Width, prob=T)

# 以Petal.Length的平均數與標準差透過dnorm產出常態分佈機率值
curve(dnorm(x, mean(iris$Petal.Width), sd(iris$Petal.Width)), col="red",add=T)

# dnorm 常態分佈的機率密度函數
# add=T表示覆蓋原圖


# H0: 該分布為常態, H1:該分布不是常態
shapiro.test(iris$Sepal.Width)
hist(iris$Sepal.Width,prob=T)
curve(dnorm(x,mean(iris$Sepal.Width),sd(iris$Sepal.Width)),
        col="red",add=T)



#==============================


library(C50)
data(churn)
str(churnTrain)

# 白天通話通數平均為160通
# H0:白天通話通數平均數 = 160通
# H1:白天通話通數平均數 != 160通
# 顯著水準 alpha = 0.05
# 檢定統計量(t)

data(churn)
t.test(churnTrain$total_day_calls, mu=102, alternative="two.sided")



# 想知道area_code_408與area_code_415白天通話平均通數是否顯著相同
# H0: 變異數total_day_calls_408/變異數total_day_calls_415 = 1
# H1: 變異數total_day_calls_408/變異數total_day_calls_415 != 1
# 顯著水準 alpha = 0.05
# 檢定統計量(F)
library(C50)
data(churn)
var.test( churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ],
          churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ])


# 想知道area_code_408與area_code_415白天通話平均通數是否顯著相同
# H0: 平均數total_day_calls_408 – 平均數total_day_calls_415 = 0
# H1: 平均數total_day_calls_408 – 平均數total_day_calls_415 != 0
# 顯著水準 alpha = 0.05
# 檢定統計量(t)
t.test( churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ],
        churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ], var.equal=T)




# 想知道CA區與VT區夜間通話平均通數是否顯著相同
# 先進行變異數檢定
# H0: 變異數total_night_calls_CA/變異數total_night_calls_VT = 1
# H1: 變異數total_night_calls_CA/變異數total_night_calls_VT != 1
# 顯著水準 alpha = 0.05
# 檢定統計量(F)
var.test(churnTrain$total_night_calls[churnTrain$state=='CA' ],
           churnTrain$total_night_calls[churnTrain$state=='VT'])



# 想知道CA區與VT區夜間通話平均通數是否顯著相同
# H0: 平均數total_night_calls_CA – 平均數total_night_calls_VT = 0
# H1: 平均數total_night_calls_CA – 平均數total_night_calls_VT != 0
# 顯著水準 alpha = 0.05
# 檢定統計量(t)
t.test(churnTrain$total_night_calls[churnTrain$state=='CA' ],
         churnTrain$total_night_calls[churnTrain$state=='VT' ], mu=0, var.equal=F)




# 想知道新的促銷對刷卡金額是否有影響
# H0: 平均數刷卡金額_促銷之前 – 平均數刷卡金額_促銷之後 = 0
# H1: 平均數刷卡金額_促銷之前 – 平均數刷卡金額_促銷之後 != 0
# 顯著水準 alpha = 0.05
# 檢定統計量(t)
Crd_amt_before <- rnorm(10000,mean=4032,sd=570)
Crd_amt_after <- rnorm(10000,mean=5661,sd=690)
t.test(Crd_amt_before, Crd_amt_after, mu=0, paired=T, var.equal=F)




# 想知道性別與客戶流失是否相關
# 兩組樣本必須是類別資料
# H0: 兩因素無關係
# H1: 兩因素有關係
# 顯著水準 alpha = 0.05
# 檢定統計量(chisq)
dt <- matrix(c(38,45,100,77),ncol=2)
chisq.test(dt)




# 想知道客戶夜間通話次數與日間通話次數的相關程度
# 兩組樣本必須是數值資料
# H0: 兩因素相關係數 = 0
# H1: 兩因素相關係數 != 0
# 顯著水準 alpha = 0.05
# 檢定統計量(corr)
cor(churnTrain$total_night_calls, churnTrain$total_day_calls)
cor.test(churnTrain$total_night_calls, churnTrain$total_day_calls)



# 想知道不同教育程度與每日平均上網時數是否有差異
# H0: uGo to Internet_高中 = uGo to Internet_大學 = uGo to Internet_研究所
# H1: 至少有兩組平均上網時數有差異
# 顯著水準 alpha = 0.05
# 檢定統計量(chisq)
df <- data.frame( group = c(rep(1, 20), rep(2, 20), rep(3,20) ), #1:高中, 2:大學, 3:研究所
                  GoInternet = floor(runif(n = 60, min = 1, max = 10))
                )
df
lm_df <- lm(GoInternet~group, data=df)
anova(lm_df)


# 多重比較
boxplot(GoInternet~group, data=df)



# 多重比較 TukeyHSD()
fit <- aov(GoInternet~factor(group), data=df)
TukeyHSD(fit)


# 多重比較
plot(TukeyHSD(fit))



# 自行產生藥劑量與感冒痊癒天數資料
x <- c(3,3,4,3,6,8,8,9,15,10) #藥劑量
y <- c(22,25,18,20,16,9,12,5,2,4) #感冒痊癒天數

New_x <- data.frame(x=10) #預測當x=5時的痊癒天數
# 建立一個線性迴歸模型
Train <- data.frame(x = x, y = y)
lmTrain <- lm(formula = y ~ x, data = Train)
predicted <- predict(lmTrain , newdata = New_x)
predicted
#預測當x=5時的痊癒天數
# 模型摘要
summary(lmTrain )
# 作圖
plot(y~x , main = "依藥劑量預測痊癒天數", xlab = "藥劑量", ylab = "感冒痊癒天數", family = "STHeiti")
points(x = New_x, y = predicted, col="green", cex = 2, pch = 16)
abline(reg = lmTrain$coefficients, col = "red", lwd = 1) #函數繪製輔助線

boxplot(cdc$weight ~ cdc$gender)

# 自行產生藥劑量、平均每日睡眠時間與感冒痊癒天數資料
x1 <- c(3,3,4,3,6,8,8,9) #藥劑量
x2 <- c(3,1,6,4,9,10,8,11) #平均每日睡眠時數
y <- c(22,25,18,20,16,9,12,5) #感冒痊癒天數
#新患者資料
New_x1 <- 5 #預測當x=5時的痊癒天數
New_x2 <- 7 #每日睡眠時數
New_data <- data.frame(x1 = 5, x2=7)
# 建立一個線性迴歸模型
Train <- data.frame(x1 = x1, x2=x2, y = y)
lmTrain <- lm(formula = y ~., data = Train)
#預測新患者感冒痊癒天數
predicted <- predict(lmTrain , newdata = New_data)
predicted
class(predicted)
# 模型摘要
summary(lmTrain )

par(mfrow=c(1,1))

#=============================================
#=============================================
#=============================================
#=============================================



# 資料源--初生嬰兒與母親的資料
#http://netstat.stat.tku.edu.tw/show_samples.php


getwd()
#讀入CSV檔
babyData=read.table("babies.csv",header=T,sep = ",")
#排除有遺漏值的資料列
babyData=na.exclude(babyData)
#訓練樣本70%與測試樣本30%
n=0.3*nrow(babyData)
test.index=sample(1:nrow(babyData),n)
Train=babyData [-test.index,]
Test=babyData[test.index,]
#確認訓練樣本與測試樣本分不一致
par(mfrow=c(1,3))
#讓R的繪圖視窗切割成 1 X 2 的方塊
hist(Train$bwt)
hist(Test$bwt)
hist(babyData$bwt)
#建模
install.packages("rpart")
library(rpart)
baby.tree=rpart(bwt~gestation+smoke+height ,data=Train) # 使用CART分類回歸樹演算法
baby.tree
plot(baby.tree)
text(baby.tree , cex=.8)


#variable importance
baby.tree$variable.importance
# 數值變數預測效果評估: MAPE(Mean Absolute Percentage Error)
# 絕對百分比誤差MAPE的公式為:
# 各個樣本的(實際值-預測值)/實際值取絕對值後的平均
# 預測效果為 GOOD: MAPE <10%
# 預測效果為 OK : 10% <= MAPE <20%
# 預測效果為 BAD : MAPE >=20%
# MAPE of train and test group
y=babyData$bwt[-test.index]
y_hat=predict(baby.tree,newdata = Train, type="vector")
train.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(train)=",train.MAPE*100,"%\n")

y=babyData$bwt[test.index]
y_hat=predict(baby.tree,newdata=Test, type="vector")
test.MAPE=mean(abs(y-y_hat)/y)
cat("MAPE(test)=",test.MAPE*100,"%\n")


#=====================================

library(C50)
data(churn)
View(churnTrain)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Traindt <- princomp( data , cor=T) # cor=T 單位不同
summary(pca_Traindt)
str(pca_Traindt)


screeplot(pca_Traindt, type = 'lines')


print(pca_Traindt$loadings, digits = 8, cutoff=0)

p = predict(pca_Traindt)
head(p[,c(1:7)], 5)




install.packages("class")
library(class)
data(iris)
#(1)設定亂數種子
set.seed(123)
#(2)取得資料筆數
n <- nrow(iris)
#(3)取得訓練樣本數的index，70%建模，30%驗證
train_idx <- sample(seq_len(n), size = round(0.7 * n))
#(4)產出訓練資料與測試資料
traindata <- iris[train_idx,]
testdata <- iris[ - train_idx,]
train_y <- traindata[,5]
test_y <- testdata[,5]
#(5)設定K，K通常可以設定為資料筆數的平方根
k_set <- as.integer(sqrt(n))
#(6)建立模型
pred <- knn(train = traindata[,-5], test = testdata[-5], cl = train_y, k = k_set+1)
#(7) 混淆矩陣計算準確度
message("準確度：",sum(diag(table(test_y,pred))) / sum(table(test_y,pred)) *100,"%")


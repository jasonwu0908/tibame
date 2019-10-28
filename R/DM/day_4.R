# 一次安裝所有packages
packages <- c("C50","tree", "rpart","randomForest")
for (i in packages){ install.packages(i) }

#一次載入packages
sapply(packages, FUN = library, character.only = TRUE)


search()

iris.C50 = C5.0(Species~ . ,data=iris)

iris.CART = tree(Species~ . ,data=iris)

iris.RF = randomForest(Species~ . ,data=iris)


#================================

#訓練樣本70%, 測試樣本30%
install.packages("caret")
library(caret)
sample_Index <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)
# sample_Index <- sample(nrow(iris))
# sample_Index <- sample_Index[1:(nrow(iris)*0.7)]
iris.train=iris[sample_Index,]
iris.test=iris[-sample_Index,]

#確認訓練樣本與測試樣本分不一致
par(mfrow=c(1,2))

#讓R的繪圖視窗切割成 1 X 2 的方塊
plot(iris.train$Species)
plot(iris.test$Species)

#模型訓練
iris.C50tree=C5.0(Species~ . ,data=iris.train)
summary(iris.C50tree)
plot(iris.C50tree)


#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[sample_Index]
y_hat = predict(iris.C50tree, iris.train, type='class')
table.train = table(y,y_hat)
cat("Total records(train)=", nrow(iris.train), "\n")
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=",
    sum(diag(table.train))/sum(table.train)*100,"%\n")
#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[-sample_Index]
y_hat= predict(iris.C50tree,iris.test,type='class')
table.test=table(y,y_hat)
cat("Total records(test)=",nrow(iris.test),"\n")
cat("Correct Classification Ratio(test)=",
    sum(diag(table.test))/sum(table.test)*100,"%\n")



#沿用C50的訓練樣本70%與測試樣本30%
#模型訓練
iris.RFtree = randomForest(Species ~ ., data=iris.train, importane=T, proximity =TRUE, ntree=300)

print(iris.RFtree )



#變數重要性
(round(importance(iris.RFtree ),2))
#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
table.rf=iris.RFtree$confusion
cat("CORRECTION RATIO(train)=", sum(diag(table.rf)/sum(table.rf))*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = iris$Species[-sample_Index]
y_hat = predict(iris.RFtree ,newdata=iris.test)
table.test=table(y,y_hat)
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")

#分群模型
(iris.clutRF=randomForest(iris[,-5]))
#繪圖 Multi-Dimension plot
MDSplot(iris.clutRF,iris$Species)



#載入C50 churn資料集
data(churn) #載入C50 churn資料集

#模型訓練
data_train = churnTrain[,-3] # 排除 "area_code"欄位
churn.tree=rpart(churn~.,data=data_train)
churn.tree


# 繪製CART決策樹
plot(churn.tree)
text(churn.tree,cex = .8)
#cex表示字體大小

# 變數重要性
churn.tree$variable.importance


churn.tree=rpart(churn~total_day_minutes+
                   total_day_charge+
                   number_customer_service_calls+
                   total_intl_charge+
                   total_intl_minutes+
                   state+
                   total_eve_charge+
                   total_eve_minutes+
                   international_plan+
                   total_intl_calls+
                   number_vmail_messages+
                   voice_mail_plan
                   ,data=data_train)

churn.tree=rpart(churn~total_day_calls+
                   total_night_calls+
                   total_intl_calls+
                   number_customer_service_calls+
                   state+
                   international_plan+
                   voice_mail_plan+
                   total_night_minutes+
                   total_night_charge+
                   total_intl_charge+
                   total_intl_minutes
                 ,data=data_train)
cor(data_train[-c(1,3,4,19)])

data_train[1:5, c(1,3,4)]
churn.tree

VIF(names(data_train[-c(1,3,4,19)]),data_train[-c(1,3,4,19)], "data_train")

#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
y = churnTrain$churn
y_hat=predict(churn.tree,newdata=churnTrain,type="class")
table.train=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = churnTest$churn
y_hat=predict(churn.tree,newdata=churnTest,type="class")
table.test=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")


#繪製 Gain Chart & Lift Chart
setwd("e:/DM/")
source('Gain_lift_Chart.r', encoding = 'Big5') #老師寫的UDF
y = ifelse(churnTest$churn=='yes',1,0) #記得要把正例轉成1，負例轉成0
y_hat=predict(churn.tree,newdata=churnTest,type="class")
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #預測流失機率
#呼叫老師寫的UDF
DT =Gain_Lift_Chart(y,y_hat, y_prob)
par(mfrow = c(1, 2))
# Gain Chart
plot(DT$row_index, DT$target_rto, xlab = "全體人數累積百分比", ylab = "正例人數累積百分比" ,type = "l", main = "Gain
Chart")
#Lift Chart
plot(DT$row_index, DT$lift, xlab = "全體人數累積百分比", ylab = "Lift",type = "l", main = "Lift Chart")




# 測試樣本評分
y_prob = predict(churn.tree,newdata=churnTest,type="prob")[,1] #取正例預測機率
# ROC Curve
install.packages("ROCR")
library(ROCR)
pred <- prediction(y_prob, labels = churnTest$churn)
# tpr: True Positive Ratio 正確預測正例;
# fpr: False Positive Ration誤判為正例
perf <- performance(pred, "tpr", "fpr")
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2) #畫虛線
#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] )

( Gini = (AUC-0.5) *2 )*100



# Iift chart
perf <- performance(pred, "lift" , "rpp")
plot(perf)



# 載入 UDF: Gain_lift_Chart
source('Lorenz_Curve.r', encoding = 'Big5') #老師寫的UDF
# 測試樣本評分
y_p = ifelse(churnTest$churn=='yes',1,0)
y_n = ifelse(churnTest$churn=='yes',0,1)
y_prob = predict(churn.tree,newdata=churnTest,type="prob") #預測流失機率
# 繪製圖型
DT_l =Lorenz_Curve(y_p,y_n,y_prob)
par(mfrow=c(1,1))
# 繪製 Lorenz Curve
plot(DT_l$target_rto,DT_l$nontarget_rto , xlab = "反例人數累積百分比", ylab = "正例人數累積百分比" ,type = "l", main = "Lorenz Curve ")
points(c(0,1),c(0,1),type="l",lty=2) #畫虛線



#載入C50 churn資料集
data(churn) #載入C50 churn資料集
data_train = churnTrain[,-3] # 排除 "area_code"欄位
data_train = churnTrain[,-1] # 排除 “state"欄位

data_train$churn = ifelse(data_train$churn=='yes',1,0) # 羅吉斯回歸預設對 y=1 建模產出推估機率

#模型訓練
logitM=glm(formula=churn~., data= data_train, family=binomial(link="logit"), na.action=na.exclude)

summary(logitM)


logitM=glm(formula=churn~international_plan+
             voice_mail_plan+
             total_intl_calls+
             number_customer_service_calls, data= data_train, family=binomial(link="logit"), na.action=na.exclude)

names(data_train)



#訓練樣本的混淆矩陣(confusion matrix)與預測正確率
install.packages("InformationValue") # for optimalCutoff
library(InformationValue)
y = data_train$churn
y_hat=predict(logitM,newdata=churnTrain,type="response")
#optimalCutoff(y, y_hat)[1] 提供了找到最佳截止值，減少錯誤分類錯誤
table.train=table(y, y_hat > optimalCutoff(y, y_hat)[1] )
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = ifelse(churnTest$churn=='yes',1,0)
y_hat=predict(logitM,newdata=churnTest,type="response")

table.test=table(y, y_hat > optimalCutoff(y, y_hat)[1] )
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")






# ROC Curve
library(ROCR)
y_prob <- predict(logitM,newdata=churnTest,type="response")
y_prob <- exp(y_prob)/(1+exp(y_prob)) #odds轉機率
pred <- prediction(y_prob, labels = churnTest$churn)
# tpr: True Positive Ratio 正確預測正例;
# fpr: False Positive Ration誤判為正例
perf <- performance(pred, "tpr", "fpr")
plot(perf)
points(c(0,1),c(0,1),type="l",lty=2) #畫虛線
#AUC
perf <- performance(pred, "auc")
( AUC = perf@y.values[[1]] )
#Gini
( Gini = (AUC-0.5) *2 )*100



#===================================

install.packages("neuralnet") #多層神經網路:倒傳遞類神經網路
install.packages("nnet") #單層神經網路
library(nnet)
library(neuralnet)
data(iris)
# One-hot Encoding
head(class.ind(iris$Species))
data <- cbind(iris, class.ind(iris$Species))
# 產生建模與測試樣本 7:3
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]
# 建模
formula.bpn <- setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
BNP = neuralnet(formula = formula.bpn,
                  hidden=c(12,8,6,5,3), # 兩層隱藏層，第一層有3個神經元，第二層有2個神經元
                  data=Train,
                  learningrate = 0.01, # learning rate
                  threshold = 0.01,
                  stepmax = 5e5 # 最大的ieration數 = 500000(5*10^5)
)



# 繪製網路圖
plot(BNP)
# 預測
cf=compute(BNP,Test[,1:4])
Ypred = as.data.frame( round(cf$net.result) ) #預測結果
# 建立一個新欄位，叫做Species
Ypred$Species <- ""
# 把預測結果轉回Species的型態
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "Species"] <- "setosa"}
  if(Ypred[i, 2]==1){ Ypred[i, "Species"] <- "versicolor"}
  if(Ypred[i, 3]==1){ Ypred[i, "Species"] <- "virginica"}
}
Ypred
table(Test$Species,Ypred$Species)
# 混淆矩陣 (預測率有95.56%)
message("準確度：",sum(diag(table(Test$Species,Ypred$Species))) /
            sum(table(Test$Species,Ypred$Species)) *100,"%")






#====================

iris_new <- iris[, -5]
set.seed(123)
Cluster_km <- kmeans(iris_new, nstart=15,centers=3) # center就是設定群數
# nstart 是指重新隨意放 k 個中心點的次數, 一般建議 nstart >= 10
table(Cluster_km$cluster, iris[, 5]) #觀察分群結果與實際類別的差別


plot(iris_new $Petal.Width, iris_new $Petal.Length, col=Cluster_km$cluster)

Cluster_km

WSS_ratio <- rep(NA, times = 10)
for (k in 1:length(WSS_ratio))
{
  Cluster_km <- kmeans(iris_new, nstart=15,centers=k)
  WSS_ratio[k] <- Cluster_km$tot.withinss
}
#畫陡坡圖
plot(WSS_ratio, type="b", main = "陡坡圖")





#====================================

library(nnet)
library(neuralnet)
data(churn)
# One-hot Encoding
head(class.ind(churnTrain$churn))
data <- cbind(churnTrain[,c(8,14,17,19,20)], class.ind(churnTrain$churn))
churnTest <- cbind(churnTest[,c(8,14,17,19,20)], class.ind(churnTest$churn))
names(data)

str(data)
# 建模
formula.bpn <- yes + no~ total_day_calls + total_night_calls + total_intl_calls + number_customer_service_calls


BNP = neuralnet(formula = formula.bpn,
                hidden=c(4,3), # 兩層隱藏層，第一層有3個神經元，第二層有2個神經元
                data=data,
                learningrate = 0.01, # learning rate
                threshold = 0.01,
                stepmax = 5e5 # 最大的ieration數 = 500000(5*10^5)
)

VIF(names(churnTrain[,c(8,14,17,19)]), churnTrain[,c(8,14,17,19)], 'churnTrain')

# 繪製網路圖
plot(BNP)
# 預測
cf=compute(BNP,churnTest[,c(1:4)])
Ypred = as.data.frame( round(cf$net.result) ) #預測結果
# 建立一個新欄位，叫做Species
Ypred$churn <- ""
# 把預測結果轉回Species的型態
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "churn"] <- "yes"}
  if(Ypred[i, 2]==1){ Ypred[i, "churn"] <- "no"}
}
Ypred
table(churnTest$churn,Ypred$churn)
# 混淆矩陣 (預測率有95.56%)
message("準確度：",sum(diag(table(churnTest$churn,Ypred$churn))) /
          sum(table(Test$Species,Ypred$Species)) *100,"%")







#======================================================

data(iris)
# One-hot Encoding
head(class.ind(iris$Species))
data <- cbind(iris, class.ind(iris$Species))
# 產生建模與測試樣本 7:3
n=0.3*nrow(data)
test.index=sample(1:nrow(data),n)
Train=data[-test.index,]
Test=data[test.index,]


# 建模
formula.bpn <- setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
BNP = neuralnet(formula = formula.bpn,
                hidden=c(12,8,6,5,3), # 兩層隱藏層，第一層有3個神經元，第二層有2個神經元
                data=Train,
                learningrate = 0.01, # learning rate
                threshold = 0.01,
                stepmax = 5e5 # 最大的ieration數 = 500000(5*10^5)
)

VIF(names(iris[,-5]), iris[,-5], 'iris')

# 繪製網路圖
plot(BNP)
# 預測
cf=compute(BNP,Test[,1:4])
Ypred = as.data.frame( round(cf$net.result) ) #預測結果
# 建立一個新欄位，叫做Species
Ypred$Species <- ""
# 把預測結果轉回Species的型態
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "Species"] <- "setosa"}
  if(Ypred[i, 2]==1){ Ypred[i, "Species"] <- "versicolor"}
  if(Ypred[i, 3]==1){ Ypred[i, "Species"] <- "virginica"}
}
Ypred
table(Test$Species,Ypred$Species)
# 混淆矩陣 (預測率有95.56%)
message("準確度：",sum(diag(table(Test$Species,Ypred$Species))) 
          sum(table(Test$Species,Ypred$Species)) *100,"%")














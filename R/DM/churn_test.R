library(C50)
data(churn)
View(churnTrain)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Traindt <- princomp( data , cor=T) # cor=T 單位不同
data1 <- churnTest[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Testdt <- princomp( data1 , cor=T) # cor=T 單位不同

head(data)
summary(pca_Traindt)
str(pca_Traindt)


screeplot(pca_Traindt, type = 'lines')


print(pca_Traindt$loadings, digits = 8, cutoff=0)




p = as.data.frame(predict(pca_Traindt))
p_data = p[,1:5]
p_data$churn = churnTrain$churn

p1 = as.data.frame(predict(pca_Testdt))
p1_data = p1[,1:5]
p1_data$churn = churnTest$churn



library(rpart)

churn_tree = rpart(churn~ . ,
                   data = p_data)

churn_tree
plot(churn_tree)
text(churn_tree,cex = .8)

# 變數重要性
churn_tree$variable.importance


y = churnTrain$churn
y_hat=predict(churn_tree,newdata=p_data,type="class")
table.train=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#測試樣本的混淆矩陣(confusion matrix)與預測正確率
y = churnTest$churn



y_hat=predict(churn_tree, newdata=p1_data, type="class")
table.test=table(y,y_hat)
#預測正確率 = 矩陣對角對角總和 / 矩陣總和
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")


#=====================================

library(nnet)
library(neuralnet)


data(churn)

data <- churnTrain[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Traindt <- princomp( data , cor=T) # cor=T 單位不同
data1 <- churnTest[,c(-1,-3,-4,-5,-20)] # 不要第1, 3, 4, 5, 20欄
pca_Testdt <- princomp( data1 , cor=T) # cor=T 單位不同



screeplot(pca_Traindt, type = 'lines')


print(pca_Traindt$loadings, digits = 8, cutoff=0)


p = as.data.frame(predict(pca_Traindt))
p_data = p[,1:5]
p_data$churn = churnTrain$churn
p_data = cbind(p_data, class.ind(p_data$churn))


p1 = as.data.frame(predict(pca_Testdt))
p1_data = p1[,1:5]
p1_data$churn = churnTest$churn
p1_data = cbind(p1_data, class.ind(p1_data$churn))


# 建模
formula.bpn <- yes + no ~ Comp.1 + Comp.2 + Comp.3 + Comp.4 + Comp.5 
BNP = neuralnet(formula = formula.bpn,
                hidden=c(3,2), # 兩層隱藏層，第一層有3個神經元，第二層有2個神經元
                data=p_data,
                learningrate = 0.01, # learning rate
                threshold = 0.01,
                stepmax = 5e5 # 最大的ieration數 = 500000(5*10^5)
)


# 繪製網路圖
plot(BNP)
# 預測
cf=compute(BNP, p1_data[,1:5])
Ypred = as.data.frame( round(cf$net.result) ) #預測結果
# 建立一個新欄位，叫做Species
Ypred$churn <- ""
# 把預測結果轉回Species的型態
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "churn"] <- "yes"}
  if(Ypred[i, 2]==1){ Ypred[i, "churn"] <- "no"}
}
Ypred


table(as.character(p1_data$churn), Ypred$churn)
table(p1_data$churn,Ypred$churn)
# 混淆矩陣 (預測率有95.56%)
message("準確度：",sum(diag(table(as.character(p1_data$churn), Ypred$churn))) /
          sum(table(as.character(p1_data$churn), Ypred$churn)) *100,"%")







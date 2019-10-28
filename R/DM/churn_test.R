library(C50)
data(churn)
View(churnTrain)
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��
pca_Traindt <- princomp( data , cor=T) # cor=T ��줣�P
data1 <- churnTest[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��
pca_Testdt <- princomp( data1 , cor=T) # cor=T ��줣�P

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

# �ܼƭ��n��
churn_tree$variable.importance


y = churnTrain$churn
y_hat=predict(churn_tree,newdata=p_data,type="class")
table.train=table(y,y_hat)
#�w�����T�v = �x�}�﨤�﨤�`�M / �x�}�`�M
cat("Correct Classification Ratio(train)=", sum(diag(table.train))/sum(table.train)*100,"%\n")

#���ռ˥����V�c�x�}(confusion matrix)�P�w�����T�v
y = churnTest$churn



y_hat=predict(churn_tree, newdata=p1_data, type="class")
table.test=table(y,y_hat)
#�w�����T�v = �x�}�﨤�﨤�`�M / �x�}�`�M
cat("Correct Classification Ratio(test)=", sum(diag(table.test))/sum(table.test)*100,"%\n")


#=====================================

library(nnet)
library(neuralnet)


data(churn)

data <- churnTrain[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��
pca_Traindt <- princomp( data , cor=T) # cor=T ��줣�P
data1 <- churnTest[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��
pca_Testdt <- princomp( data1 , cor=T) # cor=T ��줣�P



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


# �ؼ�
formula.bpn <- yes + no ~ Comp.1 + Comp.2 + Comp.3 + Comp.4 + Comp.5 
BNP = neuralnet(formula = formula.bpn,
                hidden=c(3,2), # ��h���üh�A�Ĥ@�h��3�ӯ��g���A�ĤG�h��2�ӯ��g��
                data=p_data,
                learningrate = 0.01, # learning rate
                threshold = 0.01,
                stepmax = 5e5 # �̤j��ieration�� = 500000(5*10^5)
)


# ø�s������
plot(BNP)
# �w��
cf=compute(BNP, p1_data[,1:5])
Ypred = as.data.frame( round(cf$net.result) ) #�w�����G
# �إߤ@�ӷs���A�s��Species
Ypred$churn <- ""
# ��w�����G��^Species�����A
for(i in 1:nrow(Ypred)){
  if(Ypred[i, 1]==1){ Ypred[i, "churn"] <- "yes"}
  if(Ypred[i, 2]==1){ Ypred[i, "churn"] <- "no"}
}
Ypred


table(as.character(p1_data$churn), Ypred$churn)
table(p1_data$churn,Ypred$churn)
# �V�c�x�} (�w���v��95.56%)
message("�ǽT�סG",sum(diag(table(as.character(p1_data$churn), Ypred$churn))) /
          sum(table(as.character(p1_data$churn), Ypred$churn)) *100,"%")






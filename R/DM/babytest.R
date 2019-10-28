getwd()
setwd('e:/DM/')
library(C50)
data(babies)


babyData=read.table("babies.csv",header=T,sep = ",")
clean_babydata = na.exclude(babyData)

View(clean_babydata)

# pca_traindt = princomp(clean_babydata, cor = T)
# x <- summary(pca_traindt)

# screeplot(pca_traindt, type = "lines")


clean_babydata



#========================================================


VIF <- function(variable,data,data_name)
{
  var.nums <- length(variable) #或去變數數量
  vif.table <- matrix(,nrow=var.nums,ncol=2) #用於儲存計算結果
  for(i in 1:var.nums) #循環計算機各個變數的VIF
  {
    text=""
    for(ii in variable[-i])
    {
      text=paste(text,ii,sep="+")
    }
    text=paste(text, ",data=",sep="")
    text=paste(text,data_name,sep="")
    text=paste(variable[i],substr(text, 2, nchar(text)),sep="~")
    text=paste("temp.lm <- lm(",text,sep="")
    text=paste(text,")",sep="")
    eval(parse(text=text)) #執行lm()
    temp.d <- summary(temp.lm) #取得r2
    vif.table[i,1] <- variable[i] #標註變量
    vif.table[i,2] <- round(1/(1-temp.d$r.squared),2) #計算VIF，顯示兩位小數
  }
  colnames(vif.table) <- c("Var.", "VIF") #給Header
  vif.table <- as.data.frame(vif.table) #轉化為數據框
  return(vif.table) #返回值
}


baby_vif <- clean_babydata[-1]
VIF(names(baby_vif),baby_vif, "baby_vif")
str(baby_vif)



#===========================================================


clean_babydata = clean_babydata[clean_babydata$bwt<170 ,]
clean_babydata = clean_babydata[clean_babydata$bwt>70 ,]



n = 0.3*nrow(clean_babydata)
test.index = sample(1:nrow(clean_babydata), n)
Train = clean_babydata[-test.index, -4]
Test = clean_babydata[test.index, -4]

Train = Train[, -5]
Test = Test[, -5]


Train1 = scale(Train, center = T, scale = T)
as.data.frame(Train1)

summary(Train1)

Test1 = scale(Test, center = T, scale = T)
as.data.frame(Test1)


lmTrain<- lm(formula = bwt ~., data = as.data.frame(Train))
summary(lmTrain)


y=clean_babydata$bwt[test.index]
y_hat = predict(lmTrain, newdata= Test, type="response")
test.MAPE = mean( abs(y-y_hat) / y)
cat("MAPE(test)=", test.MAPE*100,"%\n")


plot(clean_babydata$bwt, clean_babydata$gestation)
boxplot(clean_babydata$bwt~clean_babydata$parity)
plot(clean_babydata$bwt, clean_babydata$age)
plot(clean_babydata$bwt, clean_babydata$height)
plot(clean_babydata$bwt, clean_babydata$weight)
boxplot(clean_babydata$bwt~clean_babydata$smoke)

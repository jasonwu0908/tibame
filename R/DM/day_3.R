install.packages('treemap')
library(treemap)
y=data.frame(C_ID =c('�s��1','�s��2','�s��3','�s��4','�s��5','�s��6','�s��7'),
               C_RTO=c(0.22,0.3,0.16,0.04,0.19,0.03,0.06)
)
treemap(y,index=c('C_ID'),vSize='C_RTO',vColor='C_RTO')


x <- read.table(file.choose(),header=T, sep=",", fileEncoding='big5') #���TaiwanGov.csv
treemap(x,index=c('����'),vSize='���n',vColor='���n')
x


treemap(x,index=c('����','��F�ϦW��'),vSize='�H�f��',vColor='���n', title='�d�T��')









# �ϥ�rnorm��Ʋ��ͱ`�A���G���üơA�٥i�H���w�����ƻP�зǮt
set.seed(123)
x<- rnorm(100000, mean=20, sd=5)
hist(x)
summary(x)



# �ϥ�runif��Ʋ��ͧ��ä��G(Uniform Distribution)���üơA
# �i�H���w�̤p�ȻP�̤j��
set.seed(123)
x<- runif(60000, 1, 6)
hist(x)
summary(x)
x = 100


# H0: �Ӥ������`�A, H1:�Ӥ������O�`�A
data(iris)
shapiro.test(iris$Petal.Width)
hist(iris$Petal.Width, prob=T)

# �HPetal.Length�������ƻP�зǮt�z�Ldnorm���X�`�A���G���v��
curve(dnorm(x, mean(iris$Petal.Width), sd(iris$Petal.Width)), col="red",add=T)

# dnorm �`�A���G�����v�K�ר��
# add=T�����л\���


# H0: �Ӥ������`�A, H1:�Ӥ������O�`�A
shapiro.test(iris$Sepal.Width)
hist(iris$Sepal.Width,prob=T)
curve(dnorm(x,mean(iris$Sepal.Width),sd(iris$Sepal.Width)),
        col="red",add=T)



#==============================


library(C50)
data(churn)
str(churnTrain)

# �դѳq�ܳq�ƥ�����160�q
# H0:�դѳq�ܳq�ƥ����� = 160�q
# H1:�դѳq�ܳq�ƥ����� != 160�q
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(t)

data(churn)
t.test(churnTrain$total_day_calls, mu=102, alternative="two.sided")



# �Q���Darea_code_408�Parea_code_415�դѳq�ܥ����q�ƬO�_��۬ۦP
# H0: �ܲ���total_day_calls_408/�ܲ���total_day_calls_415 = 1
# H1: �ܲ���total_day_calls_408/�ܲ���total_day_calls_415 != 1
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(F)
library(C50)
data(churn)
var.test( churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ],
          churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ])


# �Q���Darea_code_408�Parea_code_415�դѳq�ܥ����q�ƬO�_��۬ۦP
# H0: ������total_day_calls_408 �V ������total_day_calls_415 = 0
# H1: ������total_day_calls_408 �V ������total_day_calls_415 != 0
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(t)
t.test( churnTrain$total_day_calls[churnTrain$area_code=='area_code_408' ],
        churnTrain$total_day_calls[churnTrain$area_code=='area_code_415' ], var.equal=T)




# �Q���DCA�ϻPVT�ϩ]���q�ܥ����q�ƬO�_��۬ۦP
# ���i���ܲ����˩w
# H0: �ܲ���total_night_calls_CA/�ܲ���total_night_calls_VT = 1
# H1: �ܲ���total_night_calls_CA/�ܲ���total_night_calls_VT != 1
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(F)
var.test(churnTrain$total_night_calls[churnTrain$state=='CA' ],
           churnTrain$total_night_calls[churnTrain$state=='VT'])



# �Q���DCA�ϻPVT�ϩ]���q�ܥ����q�ƬO�_��۬ۦP
# H0: ������total_night_calls_CA �V ������total_night_calls_VT = 0
# H1: ������total_night_calls_CA �V ������total_night_calls_VT != 0
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(t)
t.test(churnTrain$total_night_calls[churnTrain$state=='CA' ],
         churnTrain$total_night_calls[churnTrain$state=='VT' ], mu=0, var.equal=F)




# �Q���D�s���P�P���d���B�O�_���v�T
# H0: �����ƨ�d���B_�P�P���e �V �����ƨ�d���B_�P�P���� = 0
# H1: �����ƨ�d���B_�P�P���e �V �����ƨ�d���B_�P�P���� != 0
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(t)
Crd_amt_before <- rnorm(10000,mean=4032,sd=570)
Crd_amt_after <- rnorm(10000,mean=5661,sd=690)
t.test(Crd_amt_before, Crd_amt_after, mu=0, paired=T, var.equal=F)




# �Q���D�ʧO�P�Ȥ�y���O�_����
# ��ռ˥������O���O���
# H0: ��]���L���Y
# H1: ��]�������Y
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(chisq)
dt <- matrix(c(38,45,100,77),ncol=2)
chisq.test(dt)




# �Q���D�Ȥ�]���q�ܦ��ƻP�鶡�q�ܦ��ƪ������{��
# ��ռ˥������O�ƭȸ��
# H0: ��]�������Y�� = 0
# H1: ��]�������Y�� != 0
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(corr)
cor(churnTrain$total_night_calls, churnTrain$total_day_calls)
cor.test(churnTrain$total_night_calls, churnTrain$total_day_calls)



# �Q���D���P�Ш|�{�׻P�C�饭���W���ɼƬO�_���t��
# H0: uGo to Internet_���� = uGo to Internet_�j�� = uGo to Internet_��s��
# H1: �ܤ֦���ե����W���ɼƦ��t��
# ��ۤ��� alpha = 0.05
# �˩w�έp�q(chisq)
df <- data.frame( group = c(rep(1, 20), rep(2, 20), rep(3,20) ), #1:����, 2:�j��, 3:��s��
                  GoInternet = floor(runif(n = 60, min = 1, max = 10))
                )
df
lm_df <- lm(GoInternet~group, data=df)
anova(lm_df)


# �h�����
boxplot(GoInternet~group, data=df)



# �h����� TukeyHSD()
fit <- aov(GoInternet~factor(group), data=df)
TukeyHSD(fit)


# �h�����
plot(TukeyHSD(fit))



# �ۦ沣���ľ��q�P�P�_��¡�ѼƸ��
x <- c(3,3,4,3,6,8,8,9,15,10) #�ľ��q
y <- c(22,25,18,20,16,9,12,5,2,4) #�P�_��¡�Ѽ�

New_x <- data.frame(x=10) #�w����x=5�ɪ���¡�Ѽ�
# �إߤ@�ӽu�ʰj�k�ҫ�
Train <- data.frame(x = x, y = y)
lmTrain <- lm(formula = y ~ x, data = Train)
predicted <- predict(lmTrain , newdata = New_x)
predicted
#�w����x=5�ɪ���¡�Ѽ�
# �ҫ��K�n
summary(lmTrain )
# �@��
plot(y~x , main = "���ľ��q�w����¡�Ѽ�", xlab = "�ľ��q", ylab = "�P�_��¡�Ѽ�", family = "STHeiti")
points(x = New_x, y = predicted, col="green", cex = 2, pch = 16)
abline(reg = lmTrain$coefficients, col = "red", lwd = 1) #���ø�s���U�u

boxplot(cdc$weight ~ cdc$gender)

# �ۦ沣���ľ��q�B�����C��ίv�ɶ��P�P�_��¡�ѼƸ��
x1 <- c(3,3,4,3,6,8,8,9) #�ľ��q
x2 <- c(3,1,6,4,9,10,8,11) #�����C��ίv�ɼ�
y <- c(22,25,18,20,16,9,12,5) #�P�_��¡�Ѽ�
#�s�w�̸��
New_x1 <- 5 #�w����x=5�ɪ���¡�Ѽ�
New_x2 <- 7 #�C��ίv�ɼ�
New_data <- data.frame(x1 = 5, x2=7)
# �إߤ@�ӽu�ʰj�k�ҫ�
Train <- data.frame(x1 = x1, x2=x2, y = y)
lmTrain <- lm(formula = y ~., data = Train)
#�w���s�w�̷P�_��¡�Ѽ�
predicted <- predict(lmTrain , newdata = New_data)
predicted
class(predicted)
# �ҫ��K�n
summary(lmTrain )

par(mfrow=c(1,1))

#=============================================
#=============================================
#=============================================
#=============================================



# ��Ʒ�--�������P���˪����
#http://netstat.stat.tku.edu.tw/show_samples.php


getwd()
#Ū�JCSV��
babyData=read.table("babies.csv",header=T,sep = ",")
#�ư�����|�Ȫ���ƦC
babyData=na.exclude(babyData)
#�V�m�˥�70%�P���ռ˥�30%
n=0.3*nrow(babyData)
test.index=sample(1:nrow(babyData),n)
Train=babyData [-test.index,]
Test=babyData[test.index,]
#�T�{�V�m�˥��P���ռ˥������@�P
par(mfrow=c(1,3))
#��R��ø�ϵ������Φ� 1 X 2 �����
hist(Train$bwt)
hist(Test$bwt)
hist(babyData$bwt)
#�ؼ�
install.packages("rpart")
library(rpart)
baby.tree=rpart(bwt~gestation+smoke+height ,data=Train) # �ϥ�CART�����^�k��t��k
baby.tree
plot(baby.tree)
text(baby.tree , cex=.8)


#variable importance
baby.tree$variable.importance
# �ƭ��ܼƹw���ĪG����: MAPE(Mean Absolute Percentage Error)
# ����ʤ���~�tMAPE��������:
# �U�Ӽ˥���(��ڭ�-�w����)/��ڭȨ�����ȫ᪺����
# �w���ĪG�� GOOD: MAPE <10%
# �w���ĪG�� OK : 10% <= MAPE <20%
# �w���ĪG�� BAD : MAPE >=20%
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
data <- churnTrain[,c(-1,-3,-4,-5,-20)] # ���n��1, 3, 4, 5, 20��
pca_Traindt <- princomp( data , cor=T) # cor=T ��줣�P
summary(pca_Traindt)
str(pca_Traindt)


screeplot(pca_Traindt, type = 'lines')


print(pca_Traindt$loadings, digits = 8, cutoff=0)

p = predict(pca_Traindt)
head(p[,c(1:7)], 5)




install.packages("class")
library(class)
data(iris)
#(1)�]�w�üƺؤl
set.seed(123)
#(2)���o��Ƶ���
n <- nrow(iris)
#(3)���o�V�m�˥��ƪ�index�A70%�ؼҡA30%����
train_idx <- sample(seq_len(n), size = round(0.7 * n))
#(4)���X�V�m��ƻP���ո��
traindata <- iris[train_idx,]
testdata <- iris[ - train_idx,]
train_y <- traindata[,5]
test_y <- testdata[,5]
#(5)�]�wK�AK�q�`�i�H�]�w����Ƶ��ƪ������
k_set <- as.integer(sqrt(n))
#(6)�إ߼ҫ�
pred <- knn(train = traindata[,-5], test = testdata[-5], cl = train_y, k = k_set+1)
#(7) �V�c�x�}�p��ǽT��
message("�ǽT�סG",sum(diag(table(test_y,pred))) / sum(table(test_y,pred)) *100,"%")

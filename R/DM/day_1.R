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


install.packages("VIM") #�w�˹ϧ��˵���|�ȮM��
library(VIM) #���J�ϧ��˵���|�ȮM��
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

# ��X�U�檺������
new_data1.mean_col_1 <- mean(new_data1[, 1], na.rm = T)
new_data1.mean_col_2 <- mean(new_data1[, 2], na.rm = T)
new_data1.mean_col_3 <- mean(new_data1[, 3], na.rm = T)
new_data1.mean_col_4 <- mean(new_data1[, 4], na.rm = T)

# ���X�U��줤����|�Ȫ����C��m��
na.rows1 <- is.na(new_data1[, 1])
na.rows2 <- is.na(new_data1[, 2])
na.rows3 <- is.na(new_data1[, 3])
na.rows4 <- is.na(new_data1[, 4])

#�Υ����ƨ��N��|��
new_data1[na.rows1,1] <- new_data1.mean_col_1
new_data1[na.rows2,2] <- new_data1.mean_col_2
new_data1[na.rows3,3] <- new_data1.mean_col_3
new_data1[na.rows4,4] <- new_data1.mean_col_4
summary(new_data1)

#================================

mice.data <- mice(data,
                  m = 3, # ���ͤT�ӿ�|�ȳQ��ɦn����ƪ�
                  maxit = 30, # �̤j�|�N��max iteration
                  method = "cart", # �ϥ�CART�M����A�i���|�ȹw��
                  seed = 188) # �O��˨C�����@��

new_data1 <- complete(mice.data, 1) #�Ĥ@�ӵ��G
new_data2 <- complete(mice.data, 2) #�ĤG�ӵ��G
new_data3 <- complete(mice.data, 3) #�ĤT�ӵ��G

summary(data)
summary(new_data1)
summary(new_data2)
summary(new_data3)

Training_data_set <- new_data2 #��βĤG�ӵ��G�ӷ����ҫ��V�m��ƶ�
kmeans(Training_data_set[-5] , nstart=20, centers=5) #�]���s�t��k
mice.data <- mice(data,
                  m = 3, # ���ͤT�ӿ�|�ȳQ��ɦn����ƪ�
                  maxit = 30, # �̤j�|�N��max iteration
                  method = "rf", # �ϥ��H���˪L�A�i���|�ȹw��
                  seed = 188) # �O��˨C�����@��



#====================================

# �ϥ��H���˪L�A�i���|�ȹw��
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


# �N�t�פ���3��,
# �Ĥ@�� speed<12 ; �ĤG�� speed <15 ; �ĤT�� speed >= 15
cars$speed
x1 = cars$speed
new_cars_band = 1*(x1<12) + 2*(x1>=12 & x1<15) + 3*(x1>=15)
new_cars_band

# �N�Ʀr�����ন��r
label = c('�C','��','��')
new_cars_band = label[new_cars_band]
new_cars_band

# �A�N�t�׼�����X�A�ܦ����ؼ���
# '�C' , '��' �ন '�@���⨮' ; '��' �ন'�]��'
# �ϥ� %in%
car_categ = c('�@���⨮','�]��')
new_cars_band_1 = 1*(new_cars_band %in% c('�C','��')) + 2*(new_cars_band %in% c('��'))
new_cars_band_1 = car_categ[new_cars_band_1]

new_cars_band_1 



# �A�N���ؼ�����X
# '�@���⨮'�ন 1 ; '�]��'�ন 0
new_cars_band_2 = 1*(new_cars_band_1 %in% c('�@���⨮')) + 0*(new_cars_band_1 %in% c('�]��'))
# �]�i�ϥ� ifelse (����, �u, ��)�A�ĪG�@��
new_cars_band_2 = ifelse(new_cars_band_1 =='�@���⨮', 1,0)

new_cars_band_3 = ifelse(new_cars_band %in% c('�C','��') ,'�@���⨮', '�]��')

new_cars_band_2
new_cars_band_3




# within�N���OSQL�y�k����Case When
# �N�t�פ���3��, �C: speed<12 ; ��: speed <15 ; �� speed >= 15
new_cars <- cars
new_cars <- within(new_cars,
                     {
                       speed_level <- NA #�@�w�n���w�@�ӭ�
                       speed_level[cars$speed<12] <- "�C"
                       speed_level[cars$speed>=12 & cars$speed<15] <- "��"
                       speed_level[cars$speed>=15] <- "��"
                     }
)
head(new_cars,5)




# ���ͷs���
new_cars <- cars
new_cars <- transform(new_cars,
                      new_var1 = new_cars$speed * new_cars$dist ,
                      new_var2 = new_cars$dist * 100
                      )
head(new_cars,10)



# sort
data(cars)
cars$speed
sort(cars$speed, dec=T) #�����Ƨ� dec=T



# �Ǧ^�U�������ƦW
math_score <- c(100,99,47,76,92)
math_score

rank(math_score) #�w�]�O�Ѥp�ƨ�j

# �Ѥj�ƨ�p���{���g�k�ޥ�
abs(rank(math_score) -5) +1
(max(rank(math_score))+1) - rank(math_score)


# c�Bunion�Bcbind �P Rbind
x1 = c(1,2,3)
x2 = c(4,5,6)
x3 = c(7,8,9)
TTL = c(x1,x2,x3)
TTL


# c�Bunion�Bcbind �P Rbind
rbind(x1,x2,x3)
cbind(x1,x2,x3)



# merge()�A�p�PSQL�y�k���� join
# ���إ߸��
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

# merge()�A�p�PSQL�y�k���� join
#�w�]�O inner join
merge(a, b, by.x="T_name", by.y="T_name")


# all.x=TRUE�N�O left join
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



chickwts
splt1 = split(chickwts$weight, chickwts$feed)
splt1
data()

#�f�tsample�禡�H�����θ��
chickwts[ sample(1:nrow(chickwts) ,10, replace= F), ] #�H����5�����



#�s�@�ൣ���˸��
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:25,8,replace = TRUE)
Gender <- c("�k", "�k", "�k", "�k", "�k", "�k", "�k", "�k")


High <- sample(120:150,10000,replace = TRUE)
str(High)
View(High)
Weight <- sample(20:25,10000,replace = TRUE)
Gender <- c("�k", "�k", "�k", "�k", "�k", "�k", "�k", "�k")
Gender1 = sample(Gender,10000,replace = TRUE)
str(Gender1)

#�޿��
High > 130

High[High > 130] #�Q���D����130�H�W����������

Gender[High >130] #�Q���D����130�H�W���ʧO����

report <- data.frame(High, Weight, Gender)
boy.pass <- report[Gender == "�k" & High>130 , ] #�D�鶴���j��130���k��
boy.pass

#==================================================

#�ϥ� rownames�������α���
iris
rownames(iris)
#����rownames�O7�����ƪ��[���
iris[ as.integer(rownames(iris))%% 7 == 0, ]

# subset( �����Ϊ�����, ���α���, ���D��)
iris
subset(iris, iris$Sepal.Length>7)
subset(iris, iris$Sepal.Length>7, select = c(Sepal.Length, Species))


#=====================================================


install.packages("dplyr")
library(dplyr)




# ���ǬO���O�ܼ�? ���ǬO�ƭ��ܼ�?
install.packages('C50')
library(C50)
?(churn)
data(churn)
str(churnTrain)


#�Y�ө��W�P�C�Ѫ���~�B
x <- c(85,34,55,62,63,68,76)
mean(x) #������

range(x) #�նZ�d��
median(x)#�����
sd(x)#�зǮt
var(x) #�ܲ���
sd(x)^2 #�зǮt������
max(x) #�̤j��
min(x)#�̤p��
quantile(x)#�����, 50%����m�O63

cd = sd(x)/mean(x)
cd


#�s�@�ൣ���˸��
High <- c( 120, 134, 110, 158, 100, 101, 140, 105)
Weight <- sample(20:28,8)
cor(High,Weight) #�����Y��


# �ϥΪŮ�~���� airquality
data(airquality)
head(airquality,6)
cor(airquality[,1:4], use = "pairwise") #���X�������������Y�Ưx�}
pairs(airquality[,1:4]) #ø��


#==========================================


#��e���R�� ftable
z <- data.frame(Main= c('�b','��','��','��','�b','��','�b'), sub=c('��','�S��','�S��','��','��','��','�S��') , drink=c('tea','coffee','coffee','tea','coffee','tea','coffee'))
z
ftable(z, row.vars = 1:2, col.vars = "drink")
ftable(z, row.vars = "Main", col.vars = "drink")



install.packages("plyr")
library(plyr)


# ����40���H�����
df <- data.frame(
  group = c(rep('�ӤH��', 20), rep('���~��', 20)),
  sex = sample(c("M", "F"), size = 40, replace = TRUE),
  age = floor(runif(n = 40, min = 25, max = 40)),#���ä��t
  bill = floor(runif(n = 40, min = 199, max = 2600))
)

df

# �Q��group, sex�i����աA�íp��~�֪������ơB�зǮt�H��bill�`�M�P����
ddply(df, .(group, sex), summarize,
        mean_age = round(mean(age), 2),
        sd_age = round(sd(age), 2),
        sum_bill = sum(bill),
        mean_bill = round(mean(bill), 2)
)


#�p���Ƶ���count
df1 = ddply(df, c('group','sex'), nrow)
colnames(df1)[ncol(df1)] = 'count'
df1
ddply(df, c('group','sex','age'), nrow) #�O���O�ܹ��ϯä��R������l���




install.packages("vcd")
library(vcd)
# bill���ʤ���??????
df
prop.table(df$bill)
data.frame(df$bill,prop.table(df$bill))

table(df$age)
#�ন�ʤ���
prop.table( table(df$age) )


#�G���C�p���ন�ʤ���
df
table(df$group, df$age)
prop.table(table(df$group, df$age) ) # ���椺�����[�` = 1



#���G��
data(iris)
attach(iris)
plot(Petal.Length~Petal.Width, col=Species) #���G�ϫ��O

lmTrain <- lm(formula = Petal.Length ~ Petal.Width, data = iris) #²��j�k
abline(reg = lmTrain$coefficients, col = "blue", lwd = 1) #���ø�s���U�u



# ������
data(mtcars)
attach(mtcars)
table(cyl) #�Q�ΨT���Ʋ��ͦ��Ƥ��t
mtcars

T_cyl = table(cyl)
barplot(T_cyl , main="cyl �T���Ʀ��Ƥ��t��"
         , xlab="�T����"
         , col=c("red", "blue","green")
         , names.arg=c("4 �T��", "6 �T��", "8 �T��")
         , border = "cyan")
# col �����������C��
#��r "black" "red" "green3" "blue" "cyan" "magenta" "yellow" "gray"
#
#�Ʀr  col=1��, col=2��, col=3��, col=4�`��, col=5����, col=6������, col=7��
# names.arg����X�b����


barplot(T_cyl ,
        main="cyl �T���Ʀ��Ƥ��t��",
        xlab="�T����",
        col=c("red", "blue", "green"),
        names.arg=c("4 �T��", "6 �T��", "8 �T��"), border = "cyan",
        horiz=TRUE)
# horiz=TRUE �e�������

prop.table( table(cyl) )
T_cyl1 = prop.table( table(cyl) )

barplot(T_cyl1 , 
        main="cyl �T���Ʀ��Ƥ��t��", 
        xlab="�T����", 
        col=c("red","blue", "green"), 
        names.arg=c("4 �T��", "6 �T��", "8 �T��"), 
        border = "cyan",
        horiz=TRUE)
        
        

# ���ժ�����
T_cyl2 = table(am,cyl) #�إ� �ܳt���P�T���ƥ�e��
T_cyl2

barplot(T_cyl2 ,
        main="cyl �T���Ʀ��Ƥ��t��",
        xlab="�T����",
        col=c("red", "blue"),
        names.arg=c("4 �T��", "6 �T��", "8 �T��"),
        border = "cyan",
        horiz=FALSE,
        legend = rownames(T_cyl2), beside=TRUE)

barplot(T_cyl2 ,
        main="cyl �T���Ʀ��Ƥ��t��",
        xlab="�T����",
        col=c("red", "blue"),
        names.arg=c("4 �T��", "6 �T��", "8 �T��"),
        border = "cyan",
        horiz=FALSE,
        legend = rownames(T_cyl2), beside=F)
# legend �O�Ϩ�
# beside�O���չ��٬O���|��


# ������(�ʤ�����|��)
prop.table( table(am,cyl) ,2)

T_cyl3 = prop.table( table(am,cyl) ,2)
par(las=1) #����=1�A���ܼ��Ҥ�r�������C ����=2�A���ܼ��Ҥ�r�������C
barplot(T_cyl3 , main="cyl �T���Ʀ��Ʀʤ�����|��", xlab="�T����", col=c("red", "blue"),
          names.arg=c("4 �T��", "6 �T��", "8 �T��"), border = "cyan",
          horiz=FALSE, legend = c('�۰�','���'), beside=FALSE, cex.names=2)
#cex.names=2 ���ܼ��Ҥ�r�j�p����Ӫ��⭿



# ������(�ʤ�����|��)
barplot(T_cyl3 , main="cyl �T���Ʀ��Ʀʤ�����|��", xlab="�T����",
          col=c("red", "blue"), names.arg=c("4 �T��", "6 �T��", "8 �T��"), border = "cyan",
          horiz=FALSE, legend = c('�۰�','���'), beside=FALSE, cex.names=2, space=2)
#space=2 ���ܪ��������Z��



#�ϥιq�H�~�Ȥ�y�����
library(C50)
data(churn)
View(churnTrain)
attach(churnTrain)
par(mfrow=c(2,2)) #�Ϥ��ϰt�m 2*2 ���ϡA�@4�ӹ�
#�]�w���ղռ�
hist(total_day_minutes, xlab=" �դѳq�ܤ�����", main="breaks =11",
       ylab="������", col="red" ) # �Ѽ�breaks�w�]��11
hist(total_day_minutes, xlab=" �դѳq�ܤ�����", main="breaks =2",
       ylab="������", col="red", breaks=2 ) # �Ѽ�breaks�]��2
hist(total_day_minutes, xlab=" �դѳq�ܤ�����", main="breaks =20",
       ylab="������", col="red", breaks=20 ) # �Ѽ�breaks�]��20
hist(total_day_minutes, xlab=" �դѳq�ܤ�����", main="breaks =7",
       ylab="������", col="red", breaks=7 ) # �Ѽ�breaks�]��7



# �Q��churnTrain��ƶ�

par(mfrow=c(1,1)) #�Ϥ��ϰt�m 2*2 ���ϡA�@4�ӹ�
boxplot(total_day_minutes,
        horizontal=TRUE,
        xlab="�դѳq�ܤ�����", col="pink")


# ��ܥդѡB�ߤW�P�b�]���q�ܤ�����
dt <- data.frame(total_eve_minutes, total_night_minutes,
                   total_day_minutes)
boxplot(dt, horizontal=TRUE, xlab="�q�ܤ�����", col="pink")


# ��ܥդѡB�ߤW�P�b�]���q�ܤ�����
boxplot(dt, horizontal=FALSE, xlab="�q�ܤ�����", col=terrain.colors(3))
legend("topright", title="����������", c('eve','night','day'),
         fill=terrain.colors(3), horiz=F, ncol = 1, cex = 0.6)
# col=terrain.colors(3)��ܦa�y��3��
# �ϨҪ�nocl��������ơFcex����r���j�p



# ���ժ���Ž�ϡA�˵��b���P�a�Ϭy���Ȥ�P���y���Ȥ��ߤW�q�ܮɶ�������
boxplot(total_eve_minutes~area_code*churn,horizontal=FALSE,
        xlab="�]�߳q�ܤ�����",col=terrain.colors(3))

summary(area_code*churn)
summary(area_code)
summary(churn)



# ²�����
pieces <- c(8,8,2,4,2)
pie(pieces , labels = c('�u�@','��ı','����','���q��','���'), main="�ͬ���
�����t��") 




# ²����� �[�W�ʤ���
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # �p��U�����O�ʤ���
lbls <- paste(c('�u�@','��ı','����','���q��','���'),pct,'%', sep='')
pie(pieces , labels = lbls, main="�ͬ��ɶ����t��") 


# ²����� �[�W�ʤ���
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # �p��U�����O�ʤ���
lbls <- paste(c('�u�@','��ı','����','���q��','���'),pct,'%', sep='')
pie(pieces , labels = lbls, main="�ͬ��ɶ����t��") 


# ²����� �[�W�ʤ���
pieces <- c(8,8,2,4,2)
pct <- round(pieces/sum(pieces)*100) # �p��U�����O�ʤ���
lbls <- paste(c('�u�@','��ı','����','���q��','���'),'\n',pct,'%', sep='')
pie(pieces , labels = lbls, main="�ͬ��ɶ����t��", cex=1.5, cex.main=2)
#cex=1.5���Ҧr��j1.5���Fcex.main=2���D��j�⭿



# �Q�νu�Ϭ��Ͷ�
years <- sort(round(runif(10,2000,2010),0))
newbornbaby <- sort(round(runif(10,200,1000),0))
dt <- data.frame(newbornbaby,years)

par(mfrow=c(3,2)) #�b�@�i�e���W��X3*2�ӹϫ�
plot(newbornbaby ~ years , data=dt, type='l', col=1) #�u�e�u
plot(newbornbaby ~ years , data=dt, type='b', col=2) #�e�u�P�I
plot(newbornbaby ~ years , data=dt, type='c', col=3) #��'b'���ϥh�I
plot(newbornbaby ~ years , data=dt, type='h', col=4) #�����u
plot(newbornbaby ~ years , data=dt, type='s', col=5) #�����


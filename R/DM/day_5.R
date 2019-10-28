#Dbscan�t��k�Цw�� fpc �u�@�]
install.packages("ggplot2")
install.packages("fpc")
library(ggplot2)
library(fpc) 
#���X���s��� 
x1 <- seq(0,pi,length.out=500) 
y1 <- sin(x1) + 0.2*rnorm(500) 
x2 <- 2 + seq(0,pi,length.out=500) 
y2 <- cos(x2) + 0.2*rnorm(500) 
data <- data.frame(c(x1,x2),c(y1,y2)) 
names(data) <- c('x','y') 
qplot(data$x, data$y)



p <- ggplot(data,aes(x,y))

#�ظmDbscan�ҫ�
DbscanModel <- dbscan(data,eps=0.15,MinPts=4)
p + geom_point(size=2.5, aes(colour=factor(DbscanModel $cluster)))+theme(legend.position='top') #ø��
#�ظmK-means�ҫ��A�ݬݮĪG
KmeansModel <- kmeans(data,centers=2,nstart=10)
p + geom_point(size=2.5,aes(colour=factor(KmeansModel $cluster)))+theme(legend.position='top') #ø��



install.packages("arules")
library(arules)
# (1)�ظm�W�������ơA7��������
transaction_data <- data.frame(Bread = c(T,T,F,T,T,F,F),
                                 Milk = c(T,F,T,T,T,T,F),
                                 Diaper = c(F,T,T,T,T,F,T),
                                 Beer = c(F,T,T,T,F,F,T),
                                 Coke = c(F,F,T,F,T,T,T)
)
# (2)�ظm���p�W�h�ҫ�
rule = apriori(transaction_data,parameter=list(supp=0.1,conf=0.8,maxlen=4))
# (3)�d��rule
inspect(rule)
summary(rule)
inspect(head(sort(rule,by="support"),20)) #�̷�support�Ƨ�
inspect(head(sort(rule,by="confidence"),20)) #�̷�confidence�Ƨ�
inspect(head(sort(rule,by="lift"),20)) #�̷�lift�Ƨ�


#ø��
install.packages("arulesViz")
library(arulesViz)

plot(rule)
plot(rule, method="graph", control=list(type="items"))


setwd("e:/DM/") #�]�w�u�@�ؿ�
x=read.table("�T��Z�N��ƶ�.csv", header=T, sep=",") #Ū���Z�N��ƶ�
model_data <- data.frame(x$�Z�N, x$�βv, x$�Z�O, x$���O, x$�F�v) #Ū�������ܼ�
set.seed(123) #�]�w�H���ؤl
WSS_ratio <- rep(NA, times = 10) #�]�w�դ��Z������M�ܼ�
for (k in 1:length(WSS_ratio)) #�ظm
{
  Cluster_km <- kmeans(model_data[-1], nstart=15,centers=k)
  WSS_ratio[k] <- Cluster_km$tot.withinss
}
#�e�~�Y��
plot(WSS_ratio, type="b", main = "�~�Y��")



Cluster_km <- kmeans(model_data[-1], nstart=15,centers=3) #�ؼҡA�s�� K = 3
final_data <- data.frame(x,cluster=as.character(Cluster_km$cluster)) #�N��l��ƶ��P�ҫ����G�i����
#�w�˸�ƲM�z�u�@�] dplyr
install.packages("dplyr")
library(dplyr)
with_model_data <- tbl_df( final_data ) #�নdplyr�榡
result <-
  with_model_data %>%
  dplyr::group_by(cluster) %>%
  summarise(
    count = n(),
    median_�βv = median(�βv, na.rm = TRUE),
    median_�Z�O = median(�Z�O, na.rm = TRUE),
    median_���O = median(���O, na.rm = TRUE),
    median_�F�v = median(�F�v, na.rm = TRUE)
  ) #���R�U�s�����ܼ�
write.table(result , file='result.csv', col.names=T, row.names=F, sep=",", quote = F) #���G�g�X��csv��

subset(final_data, final_data$cluster==1)[,1:5] #�d�ݸs�@�Z�N
subset(final_data, final_data$cluster==3)[,1:5] #�d�ݸs�T�Z�N


# �w�� VCD�u�@�]
install.packages("vcd")
library(vcd)
table(final_data$cluster,final_data$�j)
100*prop.table( table(final_data$cluster,final_data$�j) ,1) # �Ѽ�2���ܦU��[�` = 1

100*prop.table( table(final_data$cluster,final_data$�M) ,1)

100*prop.table( table(final_data$cluster,final_data$�}) ,1)

100*prop.table( table(final_data$cluster,final_data$�ݰs�{��) ,2)


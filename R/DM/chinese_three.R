setwd("e:/DM/") #設定工作目錄
x=read.table("三國武將資料集.csv", header=T, sep=",") #讀取武將資料集
model_data <- data.frame(x$武將, x$統率, x$武力, x$智力, x$政治) #讀取切割變數
set.seed(123) #設定隨機種子
WSS_ratio <- rep(NA, times = 10) #設定組內距離平方和變數
for (k in 1:length(WSS_ratio)) #建置
{
  Cluster_km <- kmeans(model_data[-1], nstart=15,centers=k)
  WSS_ratio[k] <- Cluster_km$tot.withinss
}
#畫陡坡圖
plot(WSS_ratio, type="b", main = "陡坡圖")



Cluster_km <- kmeans(model_data[-1], nstart=15,centers=3) #建模，群數 K = 3
final_data <- data.frame(x,cluster=as.character(Cluster_km$cluster)) #將原始資料集與模型結果進行比對
#安裝資料清理工作包 dplyr
install.packages("dplyr")
library(dplyr)
with_model_data <- tbl_df( final_data ) #轉成dplyr格式
result <-
  with_model_data %>%
  dplyr::group_by(cluster) %>%
  summarise(
    count = n(),
    median_統率 = median(統率, na.rm = TRUE),
    median_武力 = median(武力, na.rm = TRUE),
    median_智力 = median(智力, na.rm = TRUE),
    median_政治 = median(政治, na.rm = TRUE)
  ) #分析各群切割變數
write.table(result , file='result.csv', col.names=T, row.names=F, sep=",", quote = F) #結果寫出成csv檔

subset(final_data, final_data$cluster==1)[,1:5] #查看群一武將
subset(final_data, final_data$cluster==3)[,1:5] #查看群三武將


# 安裝 VCD工作包
install.packages("vcd")
library(vcd)
table(final_data$cluster,final_data$槍)
100*prop.table( table(final_data$cluster,final_data$槍) ,1) # 參數2表示各行加總 = 1

100*prop.table( table(final_data$cluster,final_data$騎) ,1)

100*prop.table( table(final_data$cluster,final_data$弓) ,1)

100*prop.table( table(final_data$cluster,final_data$嗜酒程度) ,2)



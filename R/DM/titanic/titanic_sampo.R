getwd()
setwd("e:/DM/titanic/")
library('ggplot2') # 可視化 
library('ggthemes') # 可視化 
library('scales') # 可視化 
library('dplyr') # 數據處理 
library('mice') # 缺失值填補 
library('randomForest') # 建模



titanic_train = read.csv("train.csv", header = T, sep = ',')

str(titanic_train)
View(titanic_train)

titanic_test = read.csv('test.csv', header = T, sep = ',')


#======================================


#可以看到，除了Survived欄位不同外，其他欄位均相同。合併訓練集與測試集，為下一步數據清洗做準備 
train = read.csv("train.csv", header = T, sep = ',')

str(titanic_train)
View(titanic_train)

test = read.csv('test.csv', header = T, sep = ',')


full <- bind_rows(train, test) 
str(full) 
summary(full)
View(full)


# 從乘客名字中提取頭銜 
full$Title <- gsub('(.*, )|(\\..*)', '', full$Name) 
# 查看按照性別劃分的頭銜數量? 
table(full$Sex, full$Title)


# 對於那些出現頻率較低的頭銜合併為一類 
rare_title <- c('Dona', 'Lady', 'the Countess','Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer') 
# 對於一些稱呼進行重新指定（按含義） 如mlle, ms指小姐, mme 指女士 
full$Title[full$Title =='Mlle']<- 'Miss' 
full$Title[full$Title =='Ms'] <- 'Miss' 
full$Title[full$Title =='Mme']<- 'Mrs' 
full$Title[full$Title %in% rare_title] <- 'Rare Title' 
# 重新查看替換後的情況 
table(full$Sex, full$Title)

# 最後從乘客姓名中，提取姓氏 
full$Surname <- sapply(full$Name, function(x) strsplit(x, split = '[,.]')[[1]][1])


# 生成家庭人數變量，包括自己在內 
full$Fsize <- full$SibSp + full$Parch + 1 
# 生成一個家庭變量：以姓_家庭人數 格式 
full$Family <- paste(full$Surname, full$Fsize, sep='_') 
# 使用 ggplot2 繪製家庭人數與生存情況之間的關係 
ggplot(full[1:891,], aes(x = Fsize, fill = factor(Survived))) + 
  geom_bar(stat='count', position='dodge') + 
  scale_x_continuous(breaks=c(1:11)) + labs(x = 'Family Size')



#因此我們可以將家庭人數變量進行分段合併，
#明顯的可以分為3段：個人，小家庭，大家庭，由此生成新變量。

# 離散化
full$FsizeD[full$Fsize == 1] <- 'singleton'
full$FsizeD[full$Fsize < 5 & full$Fsize > 1]<- 'small'
full$FsizeD[full$Fsize > 4] <- 'large'
# 通過馬賽克圖（mosaic plot）查看家庭規模與生存情況之間關係
mosaicplot(table(full$FsizeD,full$Survived), main='Family Size by Survival', shade=TRUE)
#====================================

par(mfrow=c(1,2))
titanic <- apply(Titanic, c(1,2,4), sum)
mosaicplot(titanic, sort=c(2, 1, 3), dir=c('v', 'h', 'h'), color=T, off=3)
independent <- outer(outer(apply(titanic, 1, sum), apply(titanic,2, sum)), apply(titanic, 3, sum))/sum(titanic)^2
dimnames(independent) <- dimnames(titanic)
mosaicplot(independent, sort=c(2, 1, 3), dir=c('v', 'h', 'h'), color=T, off=3)

#===================================

testsurvive = prop.table(table(full$Survived,full$FsizeD), 2)
txt = barplot(testsurvive, col = c('red', 'blue'), legend.text = c('死亡', '存活'))



ggplot(full, aes(x=factor(FsizeD), fill=factor(Survived)))+
  geom_bar()+
  geom_text(aes(label=..count..), stat="count", position = position_stack(vjust = 0.5))





# 第一個字母即為客艙層數.如: 
strsplit(full$Cabin[2], NULL)[[1]] 
## [1] "C" "8" "5" 
# 建立一個層數變量（Deck）變化取值從 A - F: 
full$Deck <- factor(sapply(full$Cabin, function(x) 
  strsplit(x, NULL)[[1]][1])) 
summary(full$Deck)



# 乘客 62 and 830 缺少登船港口信息。 
full[c(62, 830), 'Embarked']

# 去除缺失值乘客的ID 
embark_fare <- full %>% filter(PassengerId != 62 & PassengerId != 830)

# 用 ggplot2 繪製embarkment, passenger class, & median fare 三者關係圖 
ggplot( embark_fare,
        aes(x = Embarked, y = Fare, fill = factor(Pclass))) + 
        geom_boxplot() + geom_hline(aes(yintercept=80), 
        colour='red', linetype='dashed', lwd=2) + 
        scale_y_continuous(labels=dollar_format()) 
      


# 因為他們票價為80且處於頭等艙,因而他們很有可能都是從港口C登船的。 
full$Embarked[c(62, 830)] <- 'C'


# 提取1044行數據 
full[1044, ]


# 這是從港口Southampton ('S')出發的三等艙乘客。從相同港口出發且處於相同艙位的乘客數目為 (n = 494)。

ggplot(full[full$Pclass == '3' & full$Embarked == 'S', ],
       aes(x = Fare)) +
  geom_density(fill = '#99d6ff', alpha=0.4) + 
  geom_vline(aes(xintercept=median(Fare, na.rm=T)),
             colour='red', linetype='dashed', lwd=1) +
  scale_x_continuous(labels=dollar_format())




# 基於出發港口和客艙等級，替換票價缺失值 
full$Fare[1044] <- median(full[full$Pclass == '3' & full$Embarked == 'S', ]$Fare, na.rm = TRUE)


# S統計缺失數量 
sum(is.na(full$Age))



# 使因子變量因子化 
factor_vars <- c('PassengerId','Pclass','Sex','Embarked', 'Title','Surname','Family','FsizeD') 
full[factor_vars] <- lapply(full[factor_vars],function(x) as.factor(x)) 
# 設置隨機種子 
set.seed(129) 
# 執行多重插補法，剔除一些沒什麼用的變量: 
mice_mod <- mice(full[, !names(full) %in% c('PassengerId','Name','Ticket','Cabin','Family','Surname','Survived')], method='rf') 
# 保存完整輸出 
mice_output <- complete(mice_mod)


# 繪製年齡分布圖 
par(mfrow=c(1,2)) 
hist(full$Age, freq=F, main='Age: Original Data', col='darkgreen', ylim=c(0,0.04)) 
hist(mice_output$Age, freq=F, main='Age: MICE Output', col='lightgreen', ylim=c(0,0.04))


# MICE模型結果替換年齡變量. 
full$Age <- mice_output$Age 
# 檢查缺失值是否被完全替換了 
sum(is.na(full$Age))



# 首先我們來看年齡與生存情況之間的關係 
# 分性別來看，因為前面我們知道 性別對於生存情況有重要影響 
ggplot(full[1:891,], aes(Age, fill = factor(Survived))) + 
  geom_histogram() + 
  facet_grid(.~Sex)


# 生成兒童（child）變量, 並且基於此劃分兒童child與成人adult 
full$Child[full$Age < 18] <- 'Child' 
full$Child[full$Age >= 18] <- 'Adult' 
# 展示對應人數 
table(full$Child, full$Survived)

# 生成母親變量 
full$Mother <- 'NotMother' 
full$Mother[full$Sex =='female' & full$Parch > 0 &
              full$Age > 18 & full$Title != 'Miss'] <- 'Mother' 
# 統計對於數量 
table(full$Mother, full$Survived)

# 對新生成的兩個變量完成因子化。 
full$Child <- factor(full$Child) 
full$Mother <- factor(full$Mother)

#這個起到什麼作用? 
md.pattern(full)


# 將數據拆分為訓練集與測試集 
train <- full[1:891,] 
test <- full[892:1309,]


# 設置隨機種子 
set.seed(754) 
# 建立模型l (注意: 不是所有可用變量全部加入) 
rf_model <- randomForest(factor(Survived) ~ Pclass + Sex + Age + SibSp + Sex*Parch + Fare + Embarked + Title + FsizeD + Child + Mother, data = train) 
# 顯示模型誤差 
plot(rf_model, ylim=c(0,0.36)) legend('topright', colnames(rf_model$err.rate), col=1:3, fill=1:3)



# 獲取重要性係數 
importance <- importance(rf_model) 
varImportance <- data.frame(Variables = row.names(importance), Importance = round(importance[ ,'MeanDecreaseGini'],2)) 
# 基於重要性係數排列變量 
rankImportance <- varImportance %>% mutate(Rank = paste0('#',dense_rank(desc(importance)))) 
#通過 ggplot2 繪製相關重要性變量圖 
ggplot(rankImportance, aes(x = reorder(Variables, Importance), 
                           y = Importance, fill = Importance)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(x = Variables, y = 0.5, 
                label = Rank), hjust=0, vjust=0.55, size = 4, colour= 'red') + 
  labs(x = 'Variables') + coord_flip()



# 基於測試集進行預測 
prediction <- predict(rf_model, test) 
# 將結果保存為數據框，按照Kaggle提交文檔的格式要求。[兩列：PassengerId and Survived (prediction)] 
solution <- data.frame(PassengerID = test$PassengerId, Survived = prediction) 
# 將結果寫入文件 
write.csv(solution, file = 'rf_mod_Solution1.csv', row.names = F)






full[ 1:10, c(1,3,5,6,7,10,11,12,15)]
str(full[, c(1,3,5,6,7,10,11,12,15)])
factor_vars <- c('Age','SibSp','Ticket','Fare', 'Cabin','Fsize') 
full[factor_vars] <- lapply(full[10, factor_vars],function(x) as.factor(x)) 
# 設置隨機種子 





baby_vif <- clean_babydata[-1]
VIF(names(train[, c(1,3,5,6,7,10,11,12,15)]), train[, c(1,3,5,6,7,10,11,12,15)], "train")











#==============================================
titanic_train$Cabin[titanic_train$Cabin==''] = NA
titanic_test$Cabin[titanic_test$Cabin==''] = NA


titanic_train$Embarked[titanic_train$Embarked==''] = NA
titanic_test$Embarked[titanic_test$Embarked==''] = NA

sapply(titanic_train, function(x) sum(is.na(x)))
sapply(titanic_train, function(x) length(unique(x)))


install.packages("Amelia")
library(Amelia)
missmap(titanic_train)
missmap(titanic_test)

# 篩選有用的變數
titanic_train <- subset(titanic_train, select = c(Sex, Age, Pclass, SibSp, Parch, Fare, Embarked, Survived))
titanic_test <- subset(titanic_test, select = c(Sex, Age, Pclass, SibSp, Parch, Fare, Embarked))


# 使用平均年齡取代年齡的 NA
avg.age = mean(c(titanic_train$Age, titanic_test$Age), na.rm = T)
titanic_train$Age[is.na(titanic_train$Age)] = avg.age
titanic_test$Age[is.na(titanic_test$Age)] = avg.age
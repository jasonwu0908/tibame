getwd()
setwd("e:/DM/titanic/")
library('ggplot2') # �i���� 
library('ggthemes') # �i���� 
library('scales') # �i���� 
library('dplyr') # �ƾڳB�z 
library('mice') # �ʥ��ȶ�� 
library('randomForest') # �ؼ�



titanic_train = read.csv("train.csv", header = T, sep = ',')

str(titanic_train)
View(titanic_train)

titanic_test = read.csv('test.csv', header = T, sep = ',')


#======================================


#�i�H�ݨ�A���FSurvived��줣�P�~�A��L��짡�ۦP�C�X�ְV�m���P���ն��A���U�@�B�ƾڲM�~���ǳ� 
train = read.csv("train.csv", header = T, sep = ',')

str(titanic_train)
View(titanic_train)

test = read.csv('test.csv', header = T, sep = ',')


full <- bind_rows(train, test) 
str(full) 
summary(full)
View(full)


# �q���ȦW�r�������Y�� 
full$Title <- gsub('(.*, )|(\\..*)', '', full$Name) 
# �d�ݫ��өʧO�������Y�μƶq? 
table(full$Sex, full$Title)


# ��󨺨ǥX�{�W�v���C���Y�ΦX�֬��@�� 
rare_title <- c('Dona', 'Lady', 'the Countess','Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer') 
# ���@�Ǻ٩I�i�歫�s���w�]���t�q�^ �pmlle, ms���p�j, mme ���k�h 
full$Title[full$Title =='Mlle']<- 'Miss' 
full$Title[full$Title =='Ms'] <- 'Miss' 
full$Title[full$Title =='Mme']<- 'Mrs' 
full$Title[full$Title %in% rare_title] <- 'Rare Title' 
# ���s�d�ݴ����᪺���p 
table(full$Sex, full$Title)

# �̫�q���ȩm�W���A�����m�� 
full$Surname <- sapply(full$Name, function(x) strsplit(x, split = '[,.]')[[1]][1])


# �ͦ��a�x�H���ܶq�A�]�A�ۤv�b�� 
full$Fsize <- full$SibSp + full$Parch + 1 
# �ͦ��@�Ӯa�x�ܶq�G�H�m_�a�x�H�� �榡 
full$Family <- paste(full$Surname, full$Fsize, sep='_') 
# �ϥ� ggplot2 ø�s�a�x�H�ƻP�ͦs���p���������Y 
ggplot(full[1:891,], aes(x = Fsize, fill = factor(Survived))) + 
  geom_bar(stat='count', position='dodge') + 
  scale_x_continuous(breaks=c(1:11)) + labs(x = 'Family Size')



#�]���ڭ̥i�H�N�a�x�H���ܶq�i����q�X�֡A
#���㪺�i�H����3�q�G�ӤH�A�p�a�x�A�j�a�x�A�Ѧ��ͦ��s�ܶq�C

# ������
full$FsizeD[full$Fsize == 1] <- 'singleton'
full$FsizeD[full$Fsize < 5 & full$Fsize > 1]<- 'small'
full$FsizeD[full$Fsize > 4] <- 'large'
# �q�L���ɧJ�ϡ]mosaic plot�^�d�ݮa�x�W�һP�ͦs���p�������Y
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
txt = barplot(testsurvive, col = c('red', 'blue'), legend.text = c('���`', '�s��'))



ggplot(full, aes(x=factor(FsizeD), fill=factor(Survived)))+
  geom_bar()+
  geom_text(aes(label=..count..), stat="count", position = position_stack(vjust = 0.5))





# �Ĥ@�Ӧr���Y���ȿ��h��.�p: 
strsplit(full$Cabin[2], NULL)[[1]] 
## [1] "C" "8" "5" 
# �إߤ@�Ӽh���ܶq�]Deck�^�ܤƨ��ȱq A - F: 
full$Deck <- factor(sapply(full$Cabin, function(x) 
  strsplit(x, NULL)[[1]][1])) 
summary(full$Deck)



# ���� 62 and 830 �ʤֵn���f�H���C 
full[c(62, 830), 'Embarked']

# �h���ʥ��ȭ��Ȫ�ID 
embark_fare <- full %>% filter(PassengerId != 62 & PassengerId != 830)

# �� ggplot2 ø�sembarkment, passenger class, & median fare �T�����Y�� 
ggplot( embark_fare,
        aes(x = Embarked, y = Fare, fill = factor(Pclass))) + 
        geom_boxplot() + geom_hline(aes(yintercept=80), 
        colour='red', linetype='dashed', lwd=2) + 
        scale_y_continuous(labels=dollar_format()) 
      


# �]���L�̲�����80�B�B���Y����,�]�ӥL�̫ܦ��i�ೣ�O�q��fC�n��C 
full$Embarked[c(62, 830)] <- 'C'


# ����1044��ƾ� 
full[1044, ]


# �o�O�q��fSouthampton ('S')�X�o���T�������ȡC�q�ۦP��f�X�o�B�B��ۦP���쪺���ȼƥج� (n = 494)�C

ggplot(full[full$Pclass == '3' & full$Embarked == 'S', ],
       aes(x = Fare)) +
  geom_density(fill = '#99d6ff', alpha=0.4) + 
  geom_vline(aes(xintercept=median(Fare, na.rm=T)),
             colour='red', linetype='dashed', lwd=1) +
  scale_x_continuous(labels=dollar_format())




# ���X�o��f�M�ȿ����šA���������ʥ��� 
full$Fare[1044] <- median(full[full$Pclass == '3' & full$Embarked == 'S', ]$Fare, na.rm = TRUE)


# S�έp�ʥ��ƶq 
sum(is.na(full$Age))



# �Ϧ]�l�ܶq�]�l�� 
factor_vars <- c('PassengerId','Pclass','Sex','Embarked', 'Title','Surname','Family','FsizeD') 
full[factor_vars] <- lapply(full[factor_vars],function(x) as.factor(x)) 
# �]�m�H���ؤl 
set.seed(129) 
# ����h�����ɪk�A�簣�@�ǨS����Ϊ��ܶq: 
mice_mod <- mice(full[, !names(full) %in% c('PassengerId','Name','Ticket','Cabin','Family','Surname','Survived')], method='rf') 
# �O�s�����X 
mice_output <- complete(mice_mod)


# ø�s�~�֤����� 
par(mfrow=c(1,2)) 
hist(full$Age, freq=F, main='Age: Original Data', col='darkgreen', ylim=c(0,0.04)) 
hist(mice_output$Age, freq=F, main='Age: MICE Output', col='lightgreen', ylim=c(0,0.04))


# MICE�ҫ����G�����~���ܶq. 
full$Age <- mice_output$Age 
# �ˬd�ʥ��ȬO�_�Q���������F 
sum(is.na(full$Age))



# �����ڭ̨Ӭݦ~�ֻP�ͦs���p���������Y 
# ���ʧO�ӬݡA�]���e���ڭ̪��D �ʧO���ͦs���p�����n�v�T 
ggplot(full[1:891,], aes(Age, fill = factor(Survived))) + 
  geom_histogram() + 
  facet_grid(.~Sex)


# �ͦ��ൣ�]child�^�ܶq, �åB��󦹹����ൣchild�P���Hadult 
full$Child[full$Age < 18] <- 'Child' 
full$Child[full$Age >= 18] <- 'Adult' 
# �i�ܹ����H�� 
table(full$Child, full$Survived)

# �ͦ������ܶq 
full$Mother <- 'NotMother' 
full$Mother[full$Sex =='female' & full$Parch > 0 &
              full$Age > 18 & full$Title != 'Miss'] <- 'Mother' 
# �έp���ƶq 
table(full$Mother, full$Survived)

# ��s�ͦ�������ܶq�����]�l�ơC 
full$Child <- factor(full$Child) 
full$Mother <- factor(full$Mother)

#�o�Ӱ_�줰��@��? 
md.pattern(full)


# �N�ƾک�����V�m���P���ն� 
train <- full[1:891,] 
test <- full[892:1309,]


# �]�m�H���ؤl 
set.seed(754) 
# �إ߼ҫ�l (�`�N: ���O�Ҧ��i���ܶq�����[�J) 
rf_model <- randomForest(factor(Survived) ~ Pclass + Sex + Age + SibSp + Sex*Parch + Fare + Embarked + Title + FsizeD + Child + Mother, data = train) 
# ��ܼҫ��~�t 
plot(rf_model, ylim=c(0,0.36)) legend('topright', colnames(rf_model$err.rate), col=1:3, fill=1:3)



# ������n�ʫY�� 
importance <- importance(rf_model) 
varImportance <- data.frame(Variables = row.names(importance), Importance = round(importance[ ,'MeanDecreaseGini'],2)) 
# ��󭫭n�ʫY�ƱƦC�ܶq 
rankImportance <- varImportance %>% mutate(Rank = paste0('#',dense_rank(desc(importance)))) 
#�q�L ggplot2 ø�s�������n���ܶq�� 
ggplot(rankImportance, aes(x = reorder(Variables, Importance), 
                           y = Importance, fill = Importance)) + 
  geom_bar(stat='identity') + 
  geom_text(aes(x = Variables, y = 0.5, 
                label = Rank), hjust=0, vjust=0.55, size = 4, colour= 'red') + 
  labs(x = 'Variables') + coord_flip()



# �����ն��i��w�� 
prediction <- predict(rf_model, test) 
# �N���G�O�s���ƾڮءA����Kaggle������ɪ��榡�n�D�C[��C�GPassengerId and Survived (prediction)] 
solution <- data.frame(PassengerID = test$PassengerId, Survived = prediction) 
# �N���G�g�J��� 
write.csv(solution, file = 'rf_mod_Solution1.csv', row.names = F)






full[ 1:10, c(1,3,5,6,7,10,11,12,15)]
str(full[, c(1,3,5,6,7,10,11,12,15)])
factor_vars <- c('Age','SibSp','Ticket','Fare', 'Cabin','Fsize') 
full[factor_vars] <- lapply(full[10, factor_vars],function(x) as.factor(x)) 
# �]�m�H���ؤl 





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

# �z�靈�Ϊ��ܼ�
titanic_train <- subset(titanic_train, select = c(Sex, Age, Pclass, SibSp, Parch, Fare, Embarked, Survived))
titanic_test <- subset(titanic_test, select = c(Sex, Age, Pclass, SibSp, Parch, Fare, Embarked))


# �ϥΥ����~�֨��N�~�֪� NA
avg.age = mean(c(titanic_train$Age, titanic_test$Age), na.rm = T)
titanic_train$Age[is.na(titanic_train$Age)] = avg.age
titanic_test$Age[is.na(titanic_test$Age)] = avg.age
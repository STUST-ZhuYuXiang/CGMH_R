library(dplyr)
library(mlbench) 
data(Sonar)
Sonar %>% View()

library(caret)
trainIndex<-createDataPartition(Sonar$Class,p=.75)
TrainSonar<-Sonar[trainIndex,]
TestSonar<-Sonar[-trainIndex,]

fit<-train(Class~.,method="rpart",TrainSonar)
predResult<-predict(fit,TestSonar)


library(readr)
DiagSum <- read_csv("DiagSumS.csv")
BasicS <- read_csv("BasicS.csv")

## subset
library(dplyr)
ResultSubset<-DiagSum %>% filter(歸戶代號 %in% BasicS$歸戶代號)

## join
Result1<-inner_join(DiagSum,BasicS,by="歸戶代號")
BasicS %>% group_by(歸戶代號) %>% 
  summarise(Count=n()) %>% arrange(desc(Count))
BasicS %>% 
  filter(歸戶代號=="60E506763DFB1EAC5F959EDC08E02AEFA343CAD2")

Result1_correct<-
  inner_join(DiagSum,BasicS,by=c("歸戶代號","院區"))
### error
Result2<-semi_join(DiagSum,BasicS,by="歸戶代號")

## 
SelectResult<-DiagSum %>% 
  filter(grepl("^174|^175",診斷類別1))

SelectMultiResult<-DiagSum %>% 
  filter_at(vars(num_range("診斷類別",1:6)),
            any_vars(. %in% c("1740","1741")))
SelectMultiResult1<-DiagSum %>% 
  filter_at(vars(num_range("診斷類別",1)),
            any_vars(. %in% c("1740","1741")))

library(lubridate)
DiagSum$AdmDate<-ymd(DiagSum$住院日期)

Ori174<-DiagSum %>% 
  filter(grepl("^174",診斷類別1))
FirstRecord<-DiagSum %>% 
  filter(grepl("^174",診斷類別1)) %>% 
  group_by(歸戶代號) %>%
  arrange(AdmDate) %>% slice(1)

DiagCount<-DiagSum %>% 
  group_by(歸戶代號,診斷類別1) %>% summarise(Count=n())



DiagSum %>% 
  group_by(歸戶代號,診斷類別1) %>% 
  arrange(歸戶代號,診斷類別1,AdmDate)%>%
  mutate(Gap=(lead(AdmDate)-AdmDate),isFit=Gap<365) %>% 
  select(歸戶代號,診斷類別1,AdmDate,Gap,isFit) %>%
  filter(歸戶代號=="43CCF41959798888F18EAED638A141F37A2B15C8") %>%
  head() %>% View()

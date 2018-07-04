iris[1:10,"Species"]
iris[c(T,F),]
iris[c(F,T),
     (ncol(iris)-1):ncol(iris)]
iris[c(F,T),4:5]
iris$Species

library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入

EM25000<-
  EMDiagS[EMDiagS$疾病碼=="25000",]
EM250<-
  EMDiagS[grepl("^250",EMDiagS$疾病碼),]


OptDiagS <- 
  read_csv("OptDiagS.csv") 
OptOrderS <- 
  read_csv("OptOrderS.csv") 
library(dplyr)
joined<-inner_join(OptDiagS,
           OptOrderS,
           by=c("歸戶代號","門診號"))

DiagSumS <- 
  read_csv("DiagSumS.csv") 
filter1<-
  filter(DiagSumS,
         性別=="M"&居住地=="高雄市")
select1<-
  select(filter1,
         性別,
         starts_with("診斷類別"),
         住院天數,住院日期)

filter1<-
  filter(DiagSumS,住院天數>30)

summarise(filter1,
          nE=sum(來源別=="E"),
          nTu=sum(grepl("腫瘤",診斷類別名稱1)))





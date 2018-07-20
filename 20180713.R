library(readr)
EMDiagS <- read_csv("EMDiagS.csv")
View(EMDiagS)
class(EMDiagS$輸入日期)

library(lubridate)

EMDiagS$輸入日期<-
  ymd(EMDiagS$輸入日期)
EMDiagS$輸入日期Date<-
  ymd(EMDiagS$輸入日期)

class(EMDiagS$輸入日期Date)

View(iris)
iris$Time<-1

grep("A|a|o",c("Alex","Tom","Amy","Joy","Emma"))




grep("250",EMDiagS$疾病碼)

EMDiagS$疾病碼[1574]

grepl("250",EMDiagS$疾病碼)

iris[1:10,"Species"]

iris[seq(1,nrow(iris),2),]
iris[c(T,F),]
iris[c(F,T),c("Petal.Width","Species")]
iris[c(F,T),c(ncol(iris)-1,ncol(iris))]


colnames(iris)



EMDiagS[EMDiagS$疾病碼=="25000",]
EMDiagS[grep("^250",EMDiagS$疾病碼),]

NameID<-data.frame(Name=c("Tom","Amy","John"),ID=c(1,2,3))
Score<-data.frame(ID=c(1,3),Score=c(90,100))

library(dplyr)
install.packages("purrr")

inner_join(NameID,Score)
full_join(NameID,Score)
semi_join(NameID,Score)

OptDiagS <- read_csv("OptDiagS.csv")
OptOrderS <- read_csv("OptOrderS.csv")

OptDiagOrder<-inner_join(OptDiagS,OptOrderS,
           by=c("歸戶代號","門診號"))

table(EMDiagS$掛號科別)

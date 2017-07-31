1+1
2+2

install.packages("")
library(ggplot2)

?seq

#GGGG測試

TRUE
t

break

a<-1:10
a<-c(1,2,3,4,5,6,7,8,9,10)
a<-seq(1,10,1)
b<-seq(2,20,2)

a[4]
b[c(5,6,7)]

a<-1:10
b<-seq(2,10,2)
a+b

a<-c(1,2,3)
b<-c(1,2)
a+b



library(readr)
BasicS <- read_csv("BasicS.csv")

library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入
str(EMDiagS)
class(EMDiagS$資料年月)

EMDiagS$資料年月<-
  as.character(EMDiagS$資料年月)

#install.packages("lumbirdate")
library(lubridate)
EMDiagS$輸入日期
class(EMDiagS$輸入日期)
EMDiagS$輸入日期<-ymd(EMDiagS$輸入日期)
class(EMDiagS$輸入日期)
weekdays(EMDiagS$輸入日期)

grep("250",EMDiagS$疾病碼)
grep("^250",EMDiagS$疾病碼,value=T)
grepl("250",EMDiagS$疾病碼)

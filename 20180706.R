Ans1<-1+1
1+1
Ans2<-1*2
3+3+3

install.packages("ggplot2")
library(ggplot2)

Sys.Date()

######
#date
######
dateText<-"2012/2/20"
library(lubridate)
d1<-ymd("2012/2/20")
d2<-mdy("2/10/2012")
d1-d2
ymd_hms("2012/2/20 10:5:5")


a<-1:10

b<-seq(2,20,2)
a[4]
b[c(5,6,7)]

a<-c(1,2,3,4,5,6,7,8,9,10)
b<-2
a+b


iris$Sepal.Length
iris$Time<-1

iris
View(iris)



install.packages("readr")
library(readr)
EMDiagS <- read_csv("EMDiagS.csv") #自行載入

EMDiagS$資料年月 <- 
  as.character(EMDiagS$資料年月)


library(mlbench)
data(BostonHousing)
View(BostonHousing)
model<-glm(medv~crim+tax+dis,
           data=BostonHousing)
summary(model)


data(PimaIndiansDiabetes2)
PimaIndiansDiabetes2<-
  PimaIndiansDiabetes2[complete.cases(PimaIndiansDiabetes2),]


mylogit<-glm(diabetes~.,
    data=PimaIndiansDiabetes2,
    family = "binomial")

mylogit$coefficients

mylogitsum<-summary(mylogit)

mylogitsum$family

write.csv(mylogitsum$coefficients,"text.csv")

library(rpart)
DT<-rpart(diabetes~.,
          data=PimaIndiansDiabetes2)
DT 
library(rpart.plot)
prp(DT)
?prp


class(PimaIndiansDiabetes2$diabetes)
PimaIndiansDiabetes2$diabetes

PD2<-
  PimaIndiansDiabetes2[complete.cases(PimaIndiansDiabetes2),]
nrow(PD2)

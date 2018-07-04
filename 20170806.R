library(readr)
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
DiagSumS <- read_csv("DiagSumS.csv")
#install.packages("tableone")
library(tableone)
t1<-CreateTableOne(data=DiagSumS,
                   strata = "性別",
                   vars = c("年齡","來源別","住院天數"))
print(t1, quote = TRUE, noSpaces = TRUE)

library(ggplot2)
ggplot(iris,
  aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()+facet_grid(.~Species)

ggplot(iris,
       aes(x=Species,y=Sepal.Width))+
  geom_boxplot()

library(ggmap)
twmap <- get_map(
  location = 'Taoyuan', 
  zoom = 11,
  language = "zh-TW")
ggmap(twmap)+
  geom_point(aes(x=121.389539,
                 y=25.035225),
             color="red")

library(dplyr)
DiagSumS <- read_csv("DiagSumS.csv")
DiagSumS$Year<-substr(DiagSumS$住院日期,1,4)
head(
  DiagSumS[,c("住院科別","住院日期","住院天數","Year")])
DiagSumHM <- DiagSumS %>% rename(Dept=住院科別) %>%
  group_by(Dept,Year) %>%
  summarise(HosStay=mean(住院天數),N=n())
DeptList<-DiagSumHM[DiagSumHM$N>10,]$Dept
DiagSumHM<-DiagSumHM %>% 
  filter(Dept %in% DeptList)
head(DiagSumHM)


ggplot(DiagSumHM, aes(Year, Dept)) + 
  geom_tile(aes(fill = HosStay))


### Answer
library(readr)
POLIO_Incidence <- 
  read_csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/104/POLIO_Incidence.csv")

library(tidyr)
POLIO_Incidence.l<-gather(POLIO_Incidence,key = State,Incidence=Incidence,-YEAR,-WEEK)
POLIO_Incidence.l$Incidence<-gsub("-",NA,POLIO_Incidence.l$Incidence)
POLIO_Incidence.l$Incidence<-as.numeric(POLIO_Incidence.l$Incidence)


library(dplyr)
POLIO_Incidence.l.y<-
  POLIO_Incidence.l %>% group_by(YEAR,State) %>% 
  summarize(IncidenceSum=sum(Incidence,na.rm = T))

library(ggplot2)
polioPlot<-ggplot(POLIO_Incidence.l.y, aes(YEAR, State)) + 
  geom_tile(aes(fill = IncidenceSum),
            colour = "white")+ 
  scale_fill_gradient(
    low = "white",high = "steelblue") +
  theme_minimal()
polioPlot

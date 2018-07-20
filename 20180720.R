mean(c(20,30,40,50,60))
mean(iris$Sepal.Length)

iris[iris$Species=="setosa",]


mean(iris[iris$Species=="setosa",]$Sepal.Length)
mean(iris[iris$Species=="versicolor",]$Sepal.Length)


library(readr)
# 讀入疾病統計檔資料，請將檔案放在專案路徑下
DiagSumS <- read_csv("DiagSumS.csv") 

select1<-
  select(DiagSumS,年齡,starts_with("診斷類別"),
         ends_with("日期"))
head(select1)

DiagSumSMK<-
  filter(DiagSumS,
         性別=="M"&居住地=="高雄市")
DiagSumSMKSmall<-
  select(DiagSumSMK,性別,
         starts_with("診斷類別"),
       住院天數,住院日期 )


filter1<-
  filter(DiagSumS,住院天數 > 30)

summarise(filter1,
          Count=n(),
          nE=sum(來源別=="E"),
          nT=sum(grepl("腫瘤",診斷類別名稱1)))


Ana1<-DiagSumS %>% 
  filter(年齡>60&性別=="F") %>%
  group_by(院區) %>%
  summarise(Count=n(),
            nE=sum(來源別=="E"),
            nT=sum(grepl("腫瘤",診斷類別名稱1))) %>%
  arrange(desc(Count))

write_csv(Ana1,"Ana1.csv")




DiagSumS$AgeGroup<-
  cut(DiagSumS$年齡,
      breaks = c(0,50,65,100),
      labels = c("<=50","50-65",">65"))




DiagSumS$ResGroup<-""
DiagSumS$ResGroup[
  grepl("台北|基隆|苗栗|桃園|新北市|新竹",
        DiagSumS$居住地)] <- "北"
DiagSumS$ResGroup[
  grepl("台中|雲林|彰化",
        DiagSumS$居住地)] <- "中"
DiagSumS$ResGroup[
  grepl("高雄|嘉義|屏東|台南",
        DiagSumS$居住地)] <- "南"
DiagSumS$ResGroup[
  grepl("臺東|宜蘭",DiagSumS$居住地)] <- "東"


library(icd)


AHRQ<-
  icd10_comorbid_ahrq(
    DiagSumS %>% filter(住院日期>20160101) %>% 
      rename(visit_name=住院號,icd_name=診斷類別1))


library(tableone)
table1<-CreateTableOne(data=DiagSumS,
               strata = "性別",
               vars = c("年齡","來源別","住院天數"))
print(table1, quote = TRUE, noSpaces = TRUE)

install.packages("ggplot2")
library(ggplot2)

ggplot(iris, 
       aes(x = Sepal.Width, 
           y = Sepal.Length,
           color=Species)) + 
  geom_point()


library(ggplot2)
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()+facet_grid(.~Species)

ggplot(iris,aes(x=Species,y=Sepal.Width))+
  geom_boxplot()

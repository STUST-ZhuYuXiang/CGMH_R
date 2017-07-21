Basic <- read_csv("Basic.csv")
DiagSum <- read_csv("DiagSum.csv")
EMDiag <- read_csv("EMDiag.csv")
OutDiag <- read_csv("OutDiag.csv")
Lab <- read_csv("Lab.csv")
OptOrder <- read_csv("OptOrder.csv")

IDList<-sample(Basic$歸戶代號,500)

library(dplyr)
Basic %>%  filter(歸戶代號 %in% IDList) %>% write.csv("BasicS.csv",row.names = F,fileEncoding = "UTF8")
DiagSum %>% filter(歸戶代號 %in% IDList) %>% write.csv("DiagSumS.csv",row.names = F,fileEncoding = "UTF8")
EMDiag %>% filter(歸戶代號 %in% IDList)  %>% write.csv("EMDiagS.csv",row.names = F,fileEncoding = "UTF8")
OutDiag %>% filter(歸戶代號 %in% IDList)  %>% write.csv("OptDiagS.csv",row.names = F,fileEncoding = "UTF8")
Lab %>% filter(歸戶代號 %in% IDList)  %>% write.csv("LabS.csv",row.names = F,fileEncoding = "UTF8")
OptOrder %>% filter(歸戶代號 %in% IDList)  %>% write.csv("OptOrderS.csv",row.names = F,fileEncoding = "UTF8")

BasicS <- read_csv("BasicS.csv")
DiagSumS <- read_csv("DiagSumS.csv")
EMDiagS <- read_csv("EMDiagS.csv")
OptDiagS <- read_csv("OptDiagS.csv")
LabS <- read_csv("LabS.csv")

OptOrder <- read_csv("OptOrder.csv")

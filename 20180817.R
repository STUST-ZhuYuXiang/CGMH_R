#devtools::install_github("DHLab-CGU/emr")
#library(emr)


library(metafor)

model_ishak2007<-
  rma(yi = y1i,vi=v1i,data=dat.ishak2007)

summary(model_ishak2007)

forest(model_ishak2007)


gibson_model <- 
  rma(m1i=m1i, sd1i=sd1i, n1i=n1i, 
      m2i=m2i, sd2i=sd2i, n2i=n2i, 
      data=dat.gibson2002,measure="SMD")

gibson_model_1 <- 
  rma(m1i=m1i, sd1i=sd1i, n1i=n1i, 
      m2i=m2i, sd2i=sd2i, n2i=n2i, 
      data=dat.gibson2002,measure="SMD",
      subset=(type=="1"))

summary(gibson_model)
summary(gibson_model_1)

forest(gibson_model)
forest(gibson_model_1)

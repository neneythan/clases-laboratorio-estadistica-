# semana 5 distribuciones y teoremas #    

help("dexp")

install.packages("ade4")
library(ade4)
data("carniherbi49")
library(sampling)
data(iris)
library(sampling)

sim<- sample(1:5000,100)
sim
m<-table(sim)
seqq<-seq(24,5000,50)
length(seqq)
View(m)

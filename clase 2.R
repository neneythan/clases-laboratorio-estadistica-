
#SEGUNDA CLASE#

install.packages("Rcpp")
install.packages("ape")
install.packages("permute")

install.packages("vegan")
install.packages("ade4")
library(ape)
library(permute)
library(vegan)
library(ade4)
data("carnivora")
data("jackal")
data("tortues")
data("atlas")
class(tortues)
class(atlas)
structure(atlas)
class(carnivora)
install.packages("sp")
data(atlas)
load(file = atlas)
data("carniherbi49")

set.seed(1)
sex <- c('F', 'M')
pop1 <- sample(x = sex, size = 50,replace = T,prob = c(0.5,0.5))
pop1
M<-length(which(pop1 == 'M'))
F<-length(which(pop1 == 'F'))
paste(F,'/',M,sep = '')

length(which(tortues$sexe == 'M'))

length(which(tortues$sexe == 'F'))

Ancho<-rnorm(n = 32,mean = 10,sd = 1)
Largo <- rnorm(n = 32,mean = 15,sd = 1)

medidas<-cbind(Ancho, Largo)

Tabla_medidas <- as.data.frame(cbind(paste('spp',1:32,sep = '_'),medidas))
colnames(Tabla_medidas) <- c('Individuos', 'Ancho','Largo')
data("mite.env")
data("corvus")
freq<-table(corvus$habitat)
freq2<-table(tortues$sexe)
freq
prop.table(freq)
prop.table(freq2)
pie(freq)
help("corvus")

freg<-table(corvus$phylog)
prop.table(freg)


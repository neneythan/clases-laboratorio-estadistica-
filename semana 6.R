#####semana 6 ######

taman.muestra <-5

Nmuestras <- 3

pob1 <- rexp(taman.muestra,10)
pob1
mean(pob1)

hist(pob1)
pob2 <- rexp(taman.muestra)
pob2
mean(pob2)
hist(pob2)
Matriz.Muestras.pob2.sinMean <- matrix(NA, nrow = Nmuestras, ncol = taman.muestra)
for (i in 1:Nmuestras){
  muestra <- rexp(taman.muestra,10)
  Matriz.Muestras.pob2.sinMean [i,]=muestra
}
Matriz.Muestras.pob2.sinMean
meansX <- apply(Matriz.Muestras.pob2.sinMean, 2, mean)

meansX
Matriz.Muestras.pob2.conMean <- cbind(Matriz.Muestras.pob2.sinMean,meansX)
Matriz.Muestras.pob2.conMean

par(mfrow=c(2,2))
hist(Matriz.Muestras.pob2.sinMean[1,], main = 'muestra 1')
hist(Matriz.Muestras.pob2.sinMean[2,], main = 'muestra 2')
hist(Matriz.Muestras.pob2.sinMean[3,], main = 'muestra 3')
hist(Matriz.Muestras.pob2.conMean[,taman.muestra+1], main = 'medias')

simula<-abs(rnorm(10000,10,2))
head(simula)

Xpob <- mean(simula)

Xpob
muestreo <- c(3,5,10,15,20,25,30,50,60,100,200,700,1000,3000,6000)

means<-NULL
for(i in 1:length(muestreo)){
  muestra<-sample(simula,muestreo[i],replace = F)
  means<-c(means,mean(muestra))
}

plot(cbind(muestreo,means),type = "l")
abline(h = Xpob,col="red")
###ejercicio##

simul<-abs(rnorm(1000,10,10))
head(simul)
spob<-mean(simul)









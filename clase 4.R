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

#Ejer: ¿Cúal es la probabilidad de que 3 sean de fenotipo blanco?
#probabilidad de exito de 8 

dbinom (3, tamaño = 8, prob = 0.25)

#Ejer: ¿Cúal es la probabilidad de encontrar 6 semillas por bloque? 
#si el terreno es más pequeño (2x2m) y el promedio de semillas por bloque es de 10 Gráfico todos los eventos de 0 a 50

dpois (x = 6, lambda = 10)
plot (dpois (x = 0: 20, lambda = 10), ylab = "Probabilidad", xlab = "Eventos")

#Ejer: A partir de las torturas del paquete ade4, calcule el promedio y la desviación estándar de las alturas de caparazones de las tortugas.
#Haga el análisis por sexo y grafíquelo.

biblioteca (ade4)
datos ("torturas")
Ver (torturas)

promedio <- mean (tortues $ haut)
sdtortues <-sd (tortues $ haut)
promedio
sdtortues

tortues_altura <- tortues $ haut [which (tortues $ sexe == "M")]
tortues_altura2 <- tortues $ haut [which (tortues $ sexe == "F")]


hist (tortues_altura2, col = "lightsteelblue",
     border = "black", xlim = c (30, 70), ylim = c (0.0, 0.10), prob = "TRUE", main = "Altura de caparazón tortugas hembra", xlab = "altura")
líneas (densidad (tortues_altura2),
      lwd = 2, col = "mediumorchid4")

abline (v = mean (tortues_altura2),
       col = "azul medianoche",
       lwd = 2)

abline (v = mediana (tortues_altura2),
       col = "lightpink4",
       lwd = 2)

leyenda (x = "hacia arriba",
       c ("Gráfico de densidad", "Media", "Mediana"),
       col = c ("mediumorchid4", "azul medianoche", "lightpink4"),
       lwd = c (2, 2, 2))


hist (tortues_altura, col = "sandybrown",
     border = "black", xlim = c (30, 70), ylim = c (0.0, 0.15), prob = "TRUE", main = "Altura de caparazón tortugas macho", xlab = "altura")
líneas (densidad (tortues_altura),
      lwd = 2, col = "royalblue")

abline (v = mean (tortues_altura),
       col = "verde marino",
       lwd = 2)

abline (v = mediana (tortues_altura),
       col = "red4",
       lwd = 2)

leyenda (x = "hacia arriba",
       c ("Gráfico de densidad", "Media", "Mediana"),
       col = c ("royalblue", "mediumpurple1", "red4"),
       lwd = c (2, 2, 2))

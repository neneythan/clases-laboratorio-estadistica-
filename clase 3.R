
data(iris)
iris
pl.Setosa <- sum(iris$Petal.Length[which(iris$Species=='setosa')])
pl.Setosa
length(which(iris$Species=='setosa'))

#  ¿Cuál es la longitud de la muestra?

dim(iris)
## [1] 150   5
length(iris)
## [1] 5
nrow(iris)
## [1] 150
length(iris$Petal.Length)
## [1] 150
length(iris$Petal.Length[which(iris$Species=='setosa')])
## [1] 50
# n de nuestra pregunta
n<-length(iris$Petal.Length[which(iris$Species=='setosa')])

n
## [1] 50
# média aritmética 
promedio<- pl.Setosa/n

promedio
## [1] 1.462

## Este proceso se puede convertir en una función que, computacionalmente hablando, va hacer que el proceso sea un poco más rápido.

mi.promedio <- function(x) {
  
  mi.suma<- sum(x)
  mi.n<-length(x)
  mi.prom <- mi.suma/mi.n
  return(mi.prom)
}

mi.promedio(x= iris$Petal.Length[which(iris$Species=='setosa')])
mi.promedio()
install.packages("psych")

setosa <- iris$Petal.Length[which(iris$Species=='setosa')]
sort(setosa)

length(setosa)
median(setosa)
mode(setosa)
#mode como funcion nos muetra la clase mas no la moda#
freq <- table(setosa)
freq
freq[which.max(setosa)]
summary(freq)
max(freq)
density(setosa)
# Cuantíl

quantile(setosa)
##    0%   25%   50%   75%  100% 
## 1.000 1.400 1.500 1.575 1.900
# Longitudes menores o iguales al 80%
quantile(setosa,probs = 0.8)
## 80% 
## 1.6
Un cuartíl estaría determinado en términos de cuartos, un percentíl estaría expresado en términos de 0 a 100.

# Cuartíl
quantile(setosa,probs = c(seq(0, 1, 0.25)))
##    0%   25%   50%   75%  100% 
## 1.000 1.400 1.500 1.575 1.900
Ejer: Genere los cuantiles en intervalos de 0.5 Existen otras funciones que nos permiten generar cuartiles, incluyendo información de tendencias centrales. Es decir, density() pero más resumido.

# summary
summary(setosa)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   1.000   1.400   1.500   1.462   1.575   1.900
# Lo interesante no es summary, es cómo estraer información de acá y poderlo graficar

str(summary(setosa))
##  'summaryDefault' Named num [1:6] 1 1.4 1.5 1.46 1.58 ...
##  - attr(*, "names")= chr [1:6] "Min." "1st Qu." "Median" "Mean" ...
x <- summary(setosa)
class(x)
## [1] "summaryDefault" "table"
x[1]


# distribución de frecuencias de setosa
hist(setosa, # histogram
     col = "grey80", # column color
     border = "black", 
     prob = TRUE, # show densities instead of frequencies
     xlim = c(0.5,2.5),
     xlab = "Longitud de pétalo",
     main = "Frecuencias de longitud de pétalo de setosa")
lines(density(setosa),
      lwd = 2, # thickness of line
      col = "chocolate3") # Generar la distribución continua distribución de masa a partir de los datos observados

# Graficar la media

abline(v = x[2],col = "red1",lwd = 2)

abline(v = x[3],col = "red4",lwd = 2)

abline(v = x[4],col = "blue",lwd = 2)

abline(v = x[5],col = "red1",lwd = 2)

legend(x = "topright", # location of legend within plot area
       c("Density plot","1st Qu", "Mean", "Median","3st Qu" ),
       col = c("chocolate3", "royalblue", "red"),
       lwd = c(2, 2, 2))

#####NOTA####
#La función aggregate () nor permite asignar una operación sobre los niveles de
#una variable. Así, podríamos obtener,po rjemplo, la media de cada variable por
#cada nivel (en este caso el nivel sería las especies).

aggregate(iris[,1:4], list(Especies = iris$Species), mean)

pop1 <-abs(rnorm(200,mean = 6,sd = 1))

pop2 <-abs(rnorm(200,mean = 6,sd = 5))

pops<-cbind(pop1,pop2)
pops
##Varianza y Desviación
#la varianza mide el grado de dispersión de las observaciones alrededor de
#la media aritmética y la desviación estándar es simplemente la raíz cuadrada de
#la varianza

# Varianza
apply(pops,2,var)
##       pop1       pop2 
##  0.9210544 19.9175848
# SD

apply(pops,2,sd)
##      pop1      pop2 
## 0.9597158 4.4629121
plot(density(pops[,1]))
plot(density(pops[,2]))
#Para las dos columnas qué representan poblaciones
describe(pops)
#Medidas de forma
#Imaginemos que los datos de iris son de una sola especies, si graficáramos esos datos
#en n solo conjunto veríamos algo así:
# Podemos ver lo msmo para niveles internos

for (i in 1:4){
  
  plot(density(iris[,i]), main = colnames(iris)[i])
}
##### asimetria####
#a asimetría se puede encontrar como el tercer momento estándar (1: media, 2: mediana). 
#Nos muestra el signo de las desviaciones con respecto a la media.
#Para ello se puede calcular el coheficiente de asimetría de Fisher (Y).
#Si y = 0 la distribución es simétrica, si Y es > 0 la distribución es positiva  o a la derecha y si Y es < 0 la distribución es negativa  o a la izquierda.
# Cálculo
library(EnvStats)

##Attaching package: 'EnvStats'
## The following objects are masked from 'package:stats':
##     predict, predict.lm
## The following object is masked from 'package:base':
##     print.default
skewness(pops[,1], na.rm = FALSE, method = "fisher")
## [1] -0.09532692
plot(density(pops[,1]), main= 'Pop1')
abline(v= mean(pops[,1]))



#Medidas de Apuntamiento
#Curtosis
#Es una medida de cuan apretados estas los datos al rededor de la media; se podría decir que es una característica de forma. No está relacionada directamente con la varianza.
#Se puede clasificar en 3:
# leptocúrtica: cuando el índice es positivo,  implica que la distribución tiene 'colas gordas'
#platicúrtica: Cuando el índice es negativo, implica que la distribución tiene 'colas delgadas'
#mesocúrtica: Cuando el índice dice que es 0, implica que tiene colas estándar como la distribución normal
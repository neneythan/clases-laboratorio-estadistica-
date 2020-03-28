####proyecto estadistica####
library(readxl)
#libreria paara traer los datos desde un archivo de excel .xlsx. ####
datos_proyecto_estadistica <- read_excel("R/proyecto/datos proyecto estadistica.xlsx")
View(datos_proyecto_estadistica)

library(stats)

#libreria para prueba de normalidad shapiro test#

attach(datos_proyecto_estadistica)


shapiro.test(Peso)
shapiro.test(`Longitud Antebrazo`)
shapiro.test(LT)
shapiro.test(Pie)
shapiro.test(Tibia)
shapiro.test(Enveradura)

#tibia,pie y antebrazo no son normales####
###visualizar los datos no normales####
library(ggplot2)
ggplot(datos_proyecto_estadistica,aes(sample=Tibia))+
  stat_qq() +
  stat_qq_line()

ggplot(datos_proyecto_estadistica,aes(sample=Pie))+
  stat_qq() +
  stat_qq_line()

ggplot(datos_proyecto_estadistica,aes(sample=`Longitud Antebrazo`))+
  stat_qq() +
  stat_qq_line()

#####

#######para  transformar los datos a normales su usa la siguiente pruba y se requiere esa libreria######

library(rcompanion)

t.tuk1<-transformTukey(Tibia)

t.tuk2<-transformTukey(Pie)

t.tuk3<-transformTukey(`Longitud Antebrazo`)

## se tranformaros y dan normales ···###
### se visualiza la tranformacion se observa menos sesgados los datos

ggplot(datos_proyecto_estadistica,aes(sample=t.tuk1))+
  stat_qq() +
  stat_qq_line()

ggplot(datos_proyecto_estadistica,aes(sample=t.tuk2))+
  stat_qq() +
  stat_qq_line()

ggplot(datos_proyecto_estadistica,aes(sample=t.tuk3))+
  stat_qq() +
  stat_qq_line()


#libreria para levetest prueba de homogenidad 
library(car)

leveneTest(datos_proyecto_estadistica$Peso,datos_proyecto_estadistica$Sexo)
leveneTest(`Longitud Antebrazo`~Sexo)
leveneTest(LT~Sexo)
leveneTest(Pie~Sexo)
leveneTest(Tibia~Sexo)
leveneTest(Enveradura~Sexo)

##saber si las tranformada cumplen homogenidad####
#t.tuk sonlas transformadas a normales
leveneTest(t.tuk1~Sexo)
leveneTest(t.tuk2~Sexo)
leveneTest(t.tuk3~Sexo)
####todos lo datos cumplen homogenidad ###

### diagrama de cajas de las varibles analizadas con respecto al sexo macho y hembra#####


boxplot(Peso~Sexo)
boxplot(`Longitud Antebrazo`~Sexo)
boxplot(LT~Sexo)
boxplot(Pie~Sexo)
boxplot(Tibia~Sexo)
boxplot(Enveradura~Sexo)

macho<-datos_proyecto_estadistica[which(datos_proyecto_estadistica$Sexo=="Macho"),]
hembra<-datos_proyecto_estadistica[which(datos_proyecto_estadistica$Sexo=="Hembra"),]

summary(macho$Peso)
summary(hembra$Peso)
sd(macho$Peso)
sd(hembra$Peso)

summary(macho$LT)
summary(hembra$LT)
sd(macho$LT)
sd(hembra$LT)

summary(macho$`Longitud Antebrazo`)
summary(hembra$`Longitud Antebrazo`)
sd(macho$`Longitud Antebrazo`)
sd(hembra$`Longitud Antebrazo`)

summary(macho$Pie)
summary(hembra$Pie)
sd(macho$Pie)
sd(hembra$Pie)

summary(macho$Tibia)
summary(hembra$Tibia)
sd(macho$Tibia)
sd(hembra$Tibia)

summary(macho$Enveradura)
summary(hembra$Enveradura)
sd(macho$Enveradura)
sd(hembra$Enveradura)



## prueba anova univariada :
####prueba de anova util en este caso analizar una variable puntual y saber si hay diferencias entre machos y hembras

ano1<- aov(Peso~Sexo)
summary(ano1)
TukeyHSD(ano1)

ano2<-aov(t.tuk1~Sexo)
summary(ano2)

ano3<-aov(t.tuk2~Sexo)
summary(ano3)

ano4<-aov(t.tuk3~Sexo)
summary(ano4)

ano5<-aov(Enveradura~Sexo)
summary(ano5)

ano6<-aov(LT~Sexo)
summary(ano6)

ano<-aov(t.tuk3~Especie)
summary(ano)
TukeyHSD(ano)
##### el resultado de los anova indica que no hay diferencia significaticas entre machos y hembras excepto en su peso,
##que dio diferencia significativa,como se observa en el boxplot de peso se podria decir que el peso medio de las hembras tiende hacer mayor qque la de los machos
#Cargo las librerias necesarias
library(dplyr)
#Verifico mi working directory
getwd()
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final")

#Verifico si hay una carpeta llamada data, sino la creo
if(!file.exists("data")){
        dir.create("data")
}

#Descargo los datos
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = ".\\data\\Dataset.zip", method = "curl")
list.files("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final\\data")
fechadescarga <- date()
fechadescarga

getwd()
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final\\data")

#Descomprimo
unzip("Dataset.zip")

setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final\\data\\UCI HAR Dataset")

#Leer los datos

features <- read.table("features.txt",col.names = c("N","Funciones"))
activities <- read.table("activity_labels.txt", col.names = c("Codigo","Actividad"))

#Test
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final\\data\\UCI HAR Dataset\\test")
subject_test <- read.table("subject_test.txt",col.names = "Subject")
x_test <- read.table("X_test.txt", col.names = features$Funciones)
y_test <- read.table("y_test.txt", col.names = "Codigo")

#Train
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final\\data\\UCI HAR Dataset\\train")
subject_train <- read.table("subject_train.txt", col.names = "Subject")
x_train <- read.table("X_train.txt", col.names = features$Funciones)
y_train <- read.table("y_train.txt", col.names = "Codigo")




#Step 1
#Uniendo los datos
     #Primero uno los valores de X para train y test
     X <- rbind(x_train,x_test)
     #Luego uno los valores de Y para train y test
     Y <- rbind(y_train,y_test)
     #Luego uno los valores de subject para train y test
     subject <- rbind(subject_train,subject_test)
     #por ultimo creo un data frame uniendo las columnas subject, X y Y
     onedata <- cbind(subject,Y,X)
     
#Step2
library(dplyr)
#Selecciona las siguientes columnas de onedata: Subject,Codigo, las que contengan "mean" y las que tengan "sd"
tidyData <- onedata %>% select(Subject, Codigo, contains("mean"),contains("std"))

#Step 3
tidyData$Codigo <- activities[tidyData$Codigo,2]

#Step 4

names(tidyData)[2] <- "Actividad"
#gsub = Cambie esta por esta aqui
names(tidyData) <- gsub("Acc","Acelerometro",names(tidyData))
names(tidyData) <- gsub("Gyro","Giroscopio",names(tidyData))
names(tidyData) <- gsub("BodyBody","Cuerpo",names(tidyData))
names(tidyData) <- gsub("Mag","Magnitud",names(tidyData))
names(tidyData) <- gsub("^t","Tiempo",names(tidyData))
names(tidyData) <- gsub("^f","Frecuencia",names(tidyData))
names(tidyData) <- gsub("Body","Cuerpo",names(tidyData))
names(tidyData) <- gsub("tCuerpo","TiempoCuerpo",names(tidyData))
names(tidyData) <- gsub(".mean","Promedio",names(tidyData))
names(tidyData) <- gsub("Mean","Promedio",names(tidyData))
names(tidyData) <- gsub(".std","DesviacionEstandar",names(tidyData))
names(tidyData) <- gsub("Freq","Frecuencia",names(tidyData))
names(tidyData) <- gsub("angle","Angulo",names(tidyData))
names(tidyData) <- gsub("Gravity","Gravedad",names(tidyData))

#Step5
DataFinal <- tidyData %>% group_by(Subject,Actividad) %>% summarise_all(funs(mean))
setwd("C:\\Users\\estiv\\OneDrive\\Escritorio\\Datascience Coursera\\R3\\Final")
write.table(DataFinal, "DataFinal.txt", row.name=FALSE)

str(DataFinal)
DataFinal

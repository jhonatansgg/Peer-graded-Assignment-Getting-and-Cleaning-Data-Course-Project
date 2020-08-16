# Code Book
## Introducción
Este libro de códigos tiene como fin aclarar el proceso realizado para la obtención, procesamiento y limpieza de los datos asignados para este proyecto de evaluación por pares.
El proyecto contiene el script llamado run_analysis.R, este permite la descarga, obtención, lectura y procesamiento de los datos de acuerdo con los 5 pasos de transformación de datos en desorden a datos ordenados

**- Descargando los datos:** Los datos fueron descargados de la siguiente dirección https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip en **"Sat Aug 15 23:03:46 2020"** y descomprimidos en **UCI HAR Dataset**


**- Leyendo los datos:**
      - features <- features.txt este txt contiene datos provenientes de las señales de giroscopios y acelerometros
      - activities <- activity_labels.txt, con columnas llamadas “Codigo” y “Actividad” estas son las actividades que realizaban cuando se tomaron los datos, con tiene 6           actividades etiquetadas con los números del 1 al 6.
-subject_test <- test/subject_test.txt, contiene los datos de prueba de los volutarios
-x_test <- test/X_test.txt, contiene los datos de las características
-y_test <- test/y_test.txt, contiene las actividades que se estaban realizando en el momento de prube bajo las etiquetas del 1 al 6
-	subject_train <- test/subject_train.txt contiene datos de las personas a las que se les tomaron
-	x_train <- test/X_train.txt, contiene datos de las caracteristicas
-	y_train <- test/y_train.txt, contiene las actividades, por etiquetas
-	Procesamiento para ordenar los datos:
-	Uniendo los datos: Primero se procedio a unir los datos de la siguiente manera, se unieron los datos de X test y train mediante la función rbind y también se unieron los datos de Y test y train de la misma manera, lo mismo para subject test y train y por ultimo se unieron por columnas Subject,Y,X obtieniendo un único data frame.
-	Extraer media y Desv: Aquí se procedio a extraer únicamente las medidas de desviación y media para el conjunto de datos
-	Nombre a las etiquetas: Aquí se procedio a darle el nombre correspondiente de actividad a cada una de las etiquetas del 1 al 6
-	Renombrando variables: Aquí se procedio a dar un nombre mas especifico a las columnas(variables) y para mi caso se los di en mi idioma natal español.
-	Nuevos datos: A partir del conjunto de datos del paso 4, se creó un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada tema.


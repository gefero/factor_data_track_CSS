# Ejercicios Clase 7. Repaso
## case_when() y tablas

## 1. Importe la librería tidyverse y la base de datos 
library(tidyverse)
df <- read_rds('./clase7/data/ENES_Personas_M1_EOW.rds')

## 2. ¿Cuál es la región con mayor % de asalariados (entre las personas ocupadas)? 
### Para ello, construir una variable que dicotomize la categoría ocupacional en asalariados 
## y no asalariados


## 3. Caracterizar la clase social según el esquema de EOW según las siguientes variables. 
### (en todos los casos, generar una tabla y un gráfico)
# a. Sexo

# b. Nivel educativo (recodificarlo a tres clases)

# c. Monto de ingreso individual (ITI)

# 4. Genere una nueva variable que contenga una tipología que permita 
## clasificar a cada categoría ocupacional según los diferentes niveles de calificación.
## La clasificación resultante debería ser:

## Patrones profesionales
## Patrones técnicos
## TCP o fliar. prof/tecn.
## TCP o fliar baja calif.
## Asalariado prof.
## Asalariado tecn.
## Asalariado baja calif.

## El código de ocupación (CNO) está en la variable v183cno_cod.

### Primero creamos la variable calificación
#### Pista: pueden usar la función str_sub() para extraer el último dígito de v183cno_cod

### Luego, generamos la tipología


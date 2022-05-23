# Ejercicios Clase 7. Repaso
## case_when() y tablas

## 1. Importe la librería tidyverse y la base de datos 
library(tidyverse)
df <- read_rds('./clase7/data/ENES_Personas_M1_EOW.rds')

## 2. ¿Cuál es la región con mayor % de asalariados (entre las personas ocupadas)? 
### Para ello, construir una variable que dicotomize la categoría ocupacional en asalariados 
## y no asalariados
df %>%
        mutate(asal = case_when(
                cat_ocup == 'Obrero o empleado' ~ 'Asalariado',
                TRUE ~ 'No asalariado')
               ) %>%
        filter(estado == 'Ocupado') %>%
        group_by(region, asal) %>%
        summarise(n=n()) %>%
        mutate(perc = 100*n/sum(n)) %>%
        filter(asal=='Asalariado') %>%
        arrange(desc(perc))

## 3. Caracterizar la clase social según el esquema de EOW según las siguientes variables. 
### (en todos los casos, generar una tabla y un gráfico)
# a. Sexo
df %>%
        filter(estado=='Ocupado') %>%
        group_by(v109, class_eow) %>%
        summarise(n=n()) %>%
        mutate(perc = round(100*n/sum(n),2)) %>%
        ggplot(aes(x=v109, y=perc, fill=class_eow)) + 
                geom_col() +
                geom_text(aes(label=perc), position = position_stack(vjust = 0.5)) +
                theme_minimal()

# b. Nivel educativo (recodificarlo a tres clases)
df %>%
        mutate(nivel_ed_agg = case_when(
                nivel_ed == 'Menores de 5 años' | nivel_ed == 'Sin instrucción (incluye nunca asistió o sólo asistió a sala de 5)' |
                        nivel_ed == 'Primaria/EGB incompleto' | nivel_ed == 'Primaria/EGB completo' ~ 'Bajo',
                nivel_ed == 'Secundario/Polimodal incompleto' | nivel_ed == 'Secundario/Polimodal completo' ~ 'Medio',
                TRUE ~ 'Alto')) %>%
        filter(estado=='Ocupado') %>%
        group_by(nivel_ed_agg, class_eow) %>%
        summarise(n=n()) %>%
        mutate(perc = round(100*n/sum(n),2)) %>%
        ggplot(aes(x=nivel_ed_agg, y=perc, fill=class_eow)) + 
        geom_col() +
        geom_text(aes(label=perc), position = position_stack(vjust = 0.5)) +
        theme_minimal()

# c. Monto de ingreso individual (ITI)
df %>%
        filter(estado=='Ocupado') %>%
        group_by(class_eow) %>%
        drop_na(ITI) %>%
        summarise(media = mean(ITI),
                  sd = sd(ITI),
                  cv = sd/media,
                  q1 = quantile(ITI, probs=0.24),
                  mediana = median(ITI),
                  q3 = quantile(ITI, probs=0.75),
                  ) 

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

### Primero creamos la variable calificación

df <- df %>%
        mutate(calif = str_sub(df$v183cno_cod, start = 5, end=5)) %>%
        mutate(calif = case_when(
                calif == 1 ~ 'Profesional',
                calif == 2 ~ 'Técnico',
                calif == 3 ~ 'Operativo',
                calif == 4 ~ 'No calificado',
                calif == 9 ~ 'Sin dato'
        ))

table(df$cat_ocup, df$calif)

### Luego, generamos la tipología

df <- df %>%
        mutate(cat_calif = case_when(
                cat_ocup == 'Patrón' & calif == 'Profesional' ~ 'Patrón prof.',
                cat_ocup == 'Patrón' & calif == 'Técnico' ~ 'Patrón tecn.',
                
                cat_ocup == 'Cuenta propia' & calif == 'Profesional' ~ 'TCP o fliar prof/tecn',
                cat_ocup == 'Cuenta propia' & calif == 'Técnico' ~ 'TCP o fliar prof/tecn',
                cat_ocup == 'Cuenta propia' & calif == 'Operativo' ~ 'TCP o fliar baja calif',
                cat_ocup == 'Cuenta propia' & calif == 'No calificado' ~ 'TCP o fliar baja calif',
                
                cat_ocup == 'Trabajador familiar sin remuneración' & calif == 'Profesional' ~ 'TCP o fliar prof/tecn',
                cat_ocup == 'Trabajador familiar sin remuneración' & calif == 'Técnico' ~ 'TCP o fliar prof/tecn',
                cat_ocup == 'Trabajador familiar sin remuneración' & calif == 'Operativo' ~ 'TCP o fliar baja calif',
                cat_ocup == 'Trabajador familiar sin remuneración' & calif == 'No calificado' ~ 'TCP o fliar baja calif',
                
                cat_ocup == 'Obrero o empleado' & calif == 'Profesional' ~ 'Asalariado prof.',
                cat_ocup == 'Obrero o empleado' & calif == 'Técnico' ~ 'Asalariado tecn',
                cat_ocup == 'Obrero o empleado' & calif == 'Operativo' ~ 'Asalariado baja calif',
                cat_ocup == 'Obrero o empleado' & calif == 'No calificado' ~ 'Asalariado baja calif'
        ))

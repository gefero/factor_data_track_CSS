# Ejercicios Clase 7. Repaso
## case_when() y tablas

## 1. Importe la librería tidyverse y la base de datos 
library(tidyverse)
df <- read_rds('./clase7/data/ENES_Personas_M1_EOW.rds')

## 2. ¿Cuál es la región con mayor % de asalariados (entre las personas ocupadas)? 
### Construir una variable que dicotomize la categoría ocupacional en asalariados 
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
        

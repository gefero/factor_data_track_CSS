## 1. Importe la librería tidyverse y la base de datos siu_procesada.csv
library(tidyverse)

siu_procesada <- read_csv('./ejercicios extra/siu_procesada.csv')


## 2. ¿Cuál es la disciplina de estudios que tiene mayor numero de egresades? 
siu_procesada %>%
        group_by(disciplina) %>%
        summarise(n=n()) %>%
        arrange(desc(n))
## 3. ¿Cuál es la carrera con mayor porcentaje de mujeres inscriptas? 
## ¿Y la carrera con mayor porcentaje de varones? 
siu_procesada %>%
                group_by(disciplina, genero_id,) %>%
                summarise(n=n()) %>%
                mutate(tasa = 100*n/sum(n)) %>%
                select(-n) %>%
                arrange(desc(tasa)) %>%
                pivot_wider(names_from=genero_id,
                            values_from=tasa)
        
## 4. Plasme en un gráfico la composición desagregada por género de todas las carreras. 
siu_procesada %>%
        group_by(disciplina, genero_id,) %>%
        summarise(n=n()) %>%
        mutate(tasa = 100*n/sum(n)) %>%
        select(-n) %>%
        ungroup() %>%
        ggplot() +
                geom_col(aes(x=tasa, y=reorder(disciplina, tasa), fill=genero_id)) +
                theme_minimal()

## 5. ¿Cuál es el top 3 de disciplinas estudiadas en universidades de gestión pública? ¿Y cuál es el 
## top 3 de disciplinas estudiadas en universidades de gestión privada?

siu_procesada %>%
        group_by(gestion, disciplina) %>%
        #filter(gestion=='Estatal') %>%
        summarise(n=n()) %>%
        #ungroup() %>%
        #group_by(gestion) %>%
        top_n(3)
        
        #arrange(desc(n)) %>%
        #pivot_wider(names_from = gestion,
        #            values_from = n)

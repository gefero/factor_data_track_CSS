library(tidyverse)
df <- read_rds('/media/grosati/Elements/PEN/Datasets_ML/factor_data_track_CSS/M2/clase3/data/ENES_Personas_M1_EOW.rds')

## Generamos un conteo de clases por hogar y nos quedamos con el valor máximo
class_max_hogar <- df %>%
        group_by(nocues, nhog, class_eow) %>%
        summarise(n=n()) %>%
        ungroup() %>%
        #filter(class_eow != 'Inactivo, desocupado o menor') %>%
        group_by(nocues, nhog) %>% 
        summarise(class_eow_max_hogar = class_eow[which.max(n)])

## Filtramos al PSH y cambiamos el nombre de la variable
psh <- df %>%
        filter(v111 == 'PSH') %>%
        rename(class_eow_PSH = class_eow)


## Hacemos el join con ambas tablas
df <- df %>%
        left_join(psh %>% select(nocues, nhog, class_eow_PSH)) %>%
        left_join(class_max_hogar)


## Generamos la tipología
df <- df %>%
        mutate(class_eow_hogar = case_when(
                class_eow_PSH == 'Inactivo, desocupado o menor' & class_eow_max_hogar == 'Inactivo, desocupado o menor' ~ 'Sin dato',
                class_eow_PSH == 'Inactivo, desocupado o menor' & class_eow_max_hogar != 'Inactivo, desocupado o menor' ~ class_eow_max_hogar,
                class_eow_PSH != 'Inactivo, desocupado o menor' & class_eow_max_hogar == 'Inactivo, desocupado o menor' ~ class_eow_PSH,
                TRUE ~ class_eow_PSH
        ))

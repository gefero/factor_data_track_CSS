library(tidyverse)

df <- read_rds('./clase6/data/ENES_Personas_M1_EOW.rds')

df <- df %>%
        mutate(CSO = as.character(CSO)) %>%
        mutate(class_cso = case_when(
                CSO == 'Obreros Calificados' 
                | CSO == 'Obreros no Calificados'
                | CSO == 'Peones Autónomos'
                | CSO == 'Empleados Domésticos'
                | CSO == 'Trabajadores Especializados Autónomos' ~ 'Clase obrera',
                TRUE ~ CSO)) 
                
get_diffs <- function(split, x="class_cso", y="class_eow", ...){

        dd <- analysis(split)
        
        xx <- dd %>%
                filter(estado=='Ocupado') %>%
                drop_na(!!sym(x)) %>%
                group_by(!!sym(x)) %>%
                summarise(n=sum(f_calib3)) %>%
                mutate(prop=n/sum(n)) %>%
                select(-n) %>%
                filter(!!sym(x)=='Clase obrera') %>%
                rename(clase=!!sym(x))
        
        yy <- dd %>%
                filter(estado=='Ocupado') %>%
                drop_na(!!sym(y)) %>%
                group_by(!!sym(y)) %>%
                summarise(n=sum(f_calib3)) %>%
                mutate(prop=n/sum(n)) %>%
                select(-n) %>%
                filter(!!sym(y)=='Trabajadores') %>%
                rename(clase=(!!sym(y))
                )
        
        diffs <- bind_rows(xx,yy) %>%
                pivot_wider(names_from = clase,
                            values_from=prop) %>%
                mutate(diff = `Clase obrera` - `Trabajadores`)
        
        
        return(diffs)
}

library(rsample)

set.seed(852)
df_bt <- bootstraps(df, 1000) %>%
                mutate(diffs = map(splits, ~get_diffs(.x)))

df_bt <- df_bt %>%
        unnest(cols=diffs)

df_bt %>%
        ggplot(aes(x=diff)) +
        geom_histogram()

df %>%
        mutate(f_calib3 = nrow(df)*f_calib3 / sum(f_calib3)) %>%
        filter(estado=='Ocupado') %>%
        drop_na(class_cso) %>%
        group_by(class_cso) %>%
        summarise(n=sum(f_calib3)) %>%
        mutate(prop = n/sum(n),
               N=sum(n))

df %>%
        mutate(f_calib3 = nrow(df)*f_calib3 / sum(f_calib3)) %>%
        filter(estado=='Ocupado') %>%
        group_by(class_eow) %>%
        summarise(n=sum(f_calib3)) %>%
        mutate(prop = n/sum(n),
               N=sum(n))


df %>%
        mutate(f_calib3 = nrow(df)*f_calib3 / sum(f_calib3)) %>%
        filter(estado=='Ocupado') %>%
        group_by(v109, class_eow) %>%
        summarise(n=sum(f_calib3)) %>%
        mutate(prop = n/sum(n),
               N=sum(n)) %>%
        select(-prop) %>%
        pivot_wider(names_from = v109,
                    values_from=c(n, N))

prop.test(x = c(4116, 3444), n = c(7152, 5262))


3444-5262

IIIa. Trabajadores no manuales de rutina, alta
IIIb. Trabajadores no manuales de servicios y comercio, baja
VI. Trabajadores manuales calificados
VIIa. Trabajadores manuales no calificados
VIIb. Trabajadores agropecuarios


df %>%
        filter(estado=='Ocupado') %>%
        group_by(CSO) %>%
        summarise(n=n()) %>%
        mutate(prop=n/sum(n))


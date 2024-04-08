### 1. Importe las librerías tidyverse y eph.
library(tidyverse)
library(eph)

### 2. Importe la base de datos individual  del segundo trimestre de 2021.
### Etiquete las variables REGION y ESTADO como character. 
### Etiquete la variable NIVEL_ED como factor. 

df <- get_microdata(year = 2021, trimester = 2, type = "individual")

df <- organize_labels(df=df, type='individual') 

df <- df %>% mutate_at(vars(REGION, ESTADO), ~as.character(.))%>%
             mutate_at(vars(NIVEL_ED), ~as.factor(.))

df <- df %>%
        mutate(across(c(REGION, ESTADO), ~as.character(.x))) %>%
        mutate(across(c(NIVEL_ED), ~as.factor(.x)))


### 3. Cree:
### a. Una tabla de frecuencias simple de la variable REGION usando r base
### b. Una tabla de frecuencias simple de la variable REGION usando tidyverse
### c. Una tabla de frecuencias en porcentajes de la variable REGION usando r base
### b. Una tabla de frecuencias en porcentajes de la variable REGION usando tidyverse
table(df$REGION)
df$REGION %>% table()
df %>%
        group_by(REGION) %>%
        summarise(n=n())

prop.table(table(df$REGION))

df %>%
        group_by(REGION) %>%
        summarise(n=n()) %>%
        mutate(prop=n/sum(n)*100)

### 4. ¿Qué región se lleva la mayor cantidad de casos? 

### 5. Realice un gráfico que exprese lo mismo que las tablas del punto 3. 
### Filtre los casos que crea correspondientes.
### Coloque título, subtítulo, epígrafe y nombre correctamente los ejes. 


df <- df %>%
        mutate(REGION = if_else(REGION == "44", "Patagonia", REGION))

df %>%
        ggplot(aes(x=REGION)) +
        geom_bar()

df %>%
        count(REGION)

df %>%
        group_by(REGION) %>%
        summarise(n=n()) %>%
        mutate(prop=prop.table(n)*100) %>%
        ggplot(aes(x=REGION, y=prop)) +
                geom_col() +
                labs(title="Cantidad de personas por región",
                     subtitle="EPH - 2T 2021",
                     x="Región",
                     y="%")

### 6. Realice un gráfico que cruce las variable de nivel educativo por estado ocupacional. 
### Filtre los casos que crea correspondientes.
### Coloque título, subtítulo, epígrafe y nombre correctamente los ejes. 
### TIP: Si las categorías del eje x se superponen, prueben agregar el atributo theme(axis.text.x = element_text(angle = 90)) o coord_flip()

orden <- c("Sin instruccion", "Primaria incompleta (incluye educación especial)",
           "Primaria completa", "Secundaria incompleta", "Secundaria completa",
           "Superior universitaria incompleta", "Superior universitaria completa")

df$NIVEL_ED <- factor(df$NIVEL_ED, levels=orden)

df <- df %>%
        mutate(NIVEL_ED = factor(NIVEL_ED, orden))

df %>%
        filter(ESTADO != "Menor de 10 anios." & 
                       ESTADO != "Entrevista individual no realizada (no respuesta al cuestionario individual)") %>%
        ggplot(aes(x=NIVEL_ED, fill=ESTADO)) +
                geom_bar(position="fill") +
                scale_fill_viridis_d() + 
                #scale_fill_viridis(discrete="t", option="A") +
                labs(title="Nivel educativo según estado ocupacional",
                     subtitle="2do T. 2021",
                     x="Nivel educativo",
                     y="%",
                     fill="Condición de actividad",
                     caption="Fuente: EPH") + 
                coord_flip() +
                theme(legend.position = "bottom")


df %>%
        filter(ESTADO != "Menor de 10 anios." & 
                       ESTADO != "Entrevista individual no realizada (no respuesta al cuestionario individual)") %>%
        group_by(NIVEL_ED, ESTADO) %>%
        summarise(n=n()) %>%
        mutate(p = n/sum(n)*100) %>%
        ggplot(aes(x=NIVEL_ED, y=p, fill=ESTADO)) +
                geom_col()



### 7. ¿Qué puede decir a partir de ese gráfico? 

### 8. Cruce estas dos variables por la región. 

df %>%
        filter(ESTADO != "Menor de 10 anios." & 
                       ESTADO != "Entrevista individual no realizada (no respuesta al cuestionario individual)") %>%
        group_by(REGION, NIVEL_ED, ESTADO) %>%
        summarise(n=n()) %>%
        mutate(p = n/sum(n)*100) %>%
        ggplot(aes(x=NIVEL_ED, y=p, fill=ESTADO)) +
        geom_col() + 
        coord_flip() +
        facet_wrap(~REGION)


### 9. ¿Qué puede decir a partir de este gráfico?
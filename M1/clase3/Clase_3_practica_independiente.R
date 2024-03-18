### 1. Importe las librerías tidyverse y eph.

### 2. Importe la base de datos individual  del segundo trimestre de 2021.
### Etiquete las variables REGION y ESTADO como character. 
### Etiquete la variable NIVEL_ED como factor. 

df <- get_microdata(year = 2021, trimester = 2, type = "individual")

df <- organize_labels(df=df, type='individual') 

df <- df %>% mutate_at(vars(REGION, ESTADO), ~as.character(.))%>%
             mutate_at(vars(NIVEL_ED), ~as.factor(.))

### 3. Cree:
### a. Una tabla de frecuencias simple de la variable REGION usando r base
### b. Una tabla de frecuencias simple de la variable REGION usando tidyverse
### c. Una tabla de frecuencias en porcentajes de la variable REGION usando r base
### b. Una tabla de frecuencias en porcentajes de la variable REGION usando tidyverse

### 4. ¿Qué región se lleva la mayor cantidad de casos? 

### 5. Realice un gráfico que exprese lo mismo que las tablas del punto 3. 
### Filtre los casos que crea correspondientes.
### Coloque título, subtítulo, epígrafe y nombre correctamente los ejes. 

### 6. Realice un gráfico que cruce las variable de nivel educativo por estado ocupacional. 
### Filtre los casos que crea correspondientes.
### Coloque título, subtítulo, epígrafe y nombre correctamente los ejes. 
### TIP: Si las categorías del eje x se superponen, prueben agregar el atributo theme(axis.text.x = element_text(angle = 90)) o coord_flip()

### 7. ¿Qué puede decir a partir de ese gráfico? 

### 8. Cruce estas dos variables por la región. 

### 9. ¿Qué puede decir a partir de este gráfico?
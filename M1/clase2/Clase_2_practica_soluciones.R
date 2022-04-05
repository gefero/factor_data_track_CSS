### 1. Importar librerías tidyverse y eph
library(tidyverse)
library(eph)

### 2. Importar datos del primer trimestre de la eph para individuos y etiquetar la base.
ind <- get_microdata(year=2021, trimester=1, type="individual")


ind <- ind %>%
        organize_labels(df=., type="individual")

ind <- organize_labels(df=ind, type="individual")

### 3. Asignar a las variables CH04, CH06 y CH07 los nombres: sexo, edad y estado_civil
ind <- ind %>% rename(sexo=CH04,
                      edad=CH06, 
                      estado_civil=CH07)
ind %>%
        select(sexo, edad, estado_civil)

### 4. Filtre de la base a aquellas personas menores de 18 y mayores de 70 y guárdelas 
#en un objeto que se llame "base_mayores"
base_filtrada_1 <- ind %>% filter(edad < 18 | edad > 70)

summary(base_filtrada_1$edad) 

### 5. Agrupar según las variables de sexo, edad y ESTADO y hacer un conteo de frecuencias. 

ind %>%
        group_by(sexo, edad, ESTADO) %>%
        summarise(n=n())

### 6. Teniendo en cuenta que en el código de registro:
### - sexo = 1 es "Hombre" y sexo = 2 es "Mujer" 
### - ESTADO = 1 es "Ocupado", ESTADO = 2 es "Desocupado" , ESTADO = 3 es "Inactivo", ESTADO = 4 es "Menor de 10 años" 
### a. ¿Qué grupo presenta la mayor frecuencia agrupada?
### b. ¿Qué grupo presenta la menor frecuencia? 

ind %>%
        group_by(sexo, edad, ESTADO) %>%
        summarise(n=n()) %>%
        arrange(desc(n))

ind %>%
        group_by(sexo, edad, ESTADO) %>%
        summarise(n=n()) %>%
        arrange(n)

### 7.a. Quienes presentan mayor nivel de desocupación, ¿los hombres o las mujeres? 
ind %>%
        group_by(sexo, ESTADO) %>%
        summarise(n=n()) %>%
        mutate(por = 100*n/sum(n)) %>%
        select(-n) %>%
        pivot_wider(id_cols = ESTADO,
                    names_from = sexo,
                    values_from = por)



### b. ¿Quiénes presentan mayores niveles de ocupación, ¿los hombres o las mujeres?
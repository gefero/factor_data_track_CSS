### 1. Importar las liberías eph y tidyverse
library(tidyverse)
library(eph)
### 2. Importe la base de datos individual  del segundo trimestre de 2021.
individuo <- get_microdata(2021, trim=2)
individuo <- individuo %>% organize_labels()

### 3. En base a la variable PP08D1, ¿cuánto cobra por mes la media de asalariados? ¿Y la mediana? 

individuo %>%
        summarise(media_asal = mean(PP08D1, na.rm=TRUE),
                  mediana_asal = median(PP08D1, na.rm = TRUE))

summary(individuo$PP08D1, na.rm=TRUE)

### 4. ¿Cuánto gana mensualmente el percentil 30 de los asalariados?
### ¿Qué puede hacer con esta variable para que los outliers no afecten la respuesta?

quantile(individuo$PP08D1, probs=seq(0,1,0.1), na.rm = TRUE)


individuo %>%
        filter(PP08D1 > 0) %>%
        summarise(p30 = quantile(PP08D1, probs = 0.3))

### 5. Cree un boxplot que muestre el ingreso mensual de los asalariados por región. 
### ¿Qué puede observar a partir del gráfico? 

individuo %>%
        filter(!is.na(PP08D1) | PP08D1 > 0) %>%
        ggplot(aes(x=PP08D1, y=as.character(REGION))) +
                geom_boxplot()


### 6. ¿Cuál es la moda de la variable PP08D1? Responda a partir de los valores que vea en un histograma. 
individuo %>%
        filter(!is.na(PP08D1) & PP08D1 > 0) %>%
        ggplot(aes(x=PP08D1)) +
                geom_histogram(bins=200)

individuo %>%
        filter(!is.na(PP08D1) & PP08D1 > 0) %>%
        group_by(PP08D1) %>%
        summarise(n=n()) %>%
        arrange(desc(n))


### 7. Cree un gráfico que cruce la variable PP08D1 por DECIFR (el decil del total de ingresos familares).
### ¿Qué puede decir a partir de este gráfico? 

individuo %>%
        filter(!is.na(PP08D1) & PP08D1 > 0) %>%
        filter(DECIFR != 12) %>%
        ggplot(aes(x=PP08D1, y=(DECIFR))) +
                geom_boxplot()
        
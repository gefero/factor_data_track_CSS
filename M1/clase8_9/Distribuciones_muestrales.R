library(googlesheets4)
library(tidyverse)
datos <- read_sheet("https://docs.google.com/spreadsheets/d/1qbe64Q5w2K1qxyv39sYCA3DNLddz-MaijC8OQOFErO4/edit?resourcekey#gid=1177396456")

datos <- datos %>%
        rename(timestap = `Marca temporal`,
               mail = `Dirección de correo electrónico`,
               nombre = `¿Cuál es tu nombre?`,
               edad = `¿Qué edad tenés?`,
               trabajo = `¿Trabajaste la semana pasada (al menos una hora?`,
               horas_trabajo = `¿Cuántas horas trabajaste la semana pasada?`,
               carrera = `¿De qué carrera sos?`,
               materias = `¿Cuántas materias tenés aprobada a la fecha?`
               ) 


datos <- datos %>%
        mutate(trabajo = if_else(trabajo == "Sí", 1, 0))


# Parámetros
paramtros <- datos %>%
        summarise(
                size = n,
                media_edad = mean(edad),
                prop_trabaja = mean(trabaja),
                media_horas = mean(horas_trabajo),
                media_materias = mean(materias)
        )


# Definimos un tamaño de muestra
n <- 2
# 
estimaciones <- datos %>%
        sample_n(size=n) %>% # Esta línea extrae una muestra
        summarise( # Estas líneas calculan los estadísticos
                size = n,
                media_edad = mean(edad),
                prop_trabaja = mean(trabaja),
                media_horas = mean(horas_trabajo),
                media_materias = mean(materias)
                )

estimaciones

# Ahora repitámoslo muchas veces...
muestras <- list()
for (r in 1:100){
        estimaciones <- datos %>%
                sample_n(size=n) %>%
                summarise(
                        sample = r,
                        size = n,
                        media_edad = mean(edad),
                        prop_trabaja = mean(trabaja),
                        media_horas = mean(horas_trabajo),
                        media_materias = mean(materias)
                )
        
        muestras[[r]] <- estimaciones
}

muestras <- do.call(rbind, muestras )

muestras %>%
        ggplot(aes(x=media_horas)) +
                geom_histogram() +
                theme_minimal()


# Ahora repitámoslo muchas veces y con diferentes tamaños de muestra
it <- 0
ns <- 2:9
muestras <- list()
for (n_ in ns){
        for (r in 1:100){
                it <- it + 1
                estimaciones <- datos %>%
                        sample_n(size=n_) %>%
                        summarise(
                                sample = r,
                                size = n_,
                                media_edad = mean(edad),
                                prop_trabaja = mean(trabaja),
                                media_horas = mean(horas_trabajo),
                                media_materias = mean(materias)
                        )
                                
                muestras[[it]] <- estimaciones
                }
}

muestras <- do.call(rbind, muestras )

muestras %>%
        ggplot(aes(x=media_edad)) +
        geom_histogram() +
        theme_minimal() +
        facet_wrap(~size)


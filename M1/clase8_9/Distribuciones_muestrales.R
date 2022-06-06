library(googlesheets4)
datos <- read_sheet("https://docs.google.com/spreadsheets/d/14YHOQfrteEB0Qjg_8TwLuy8DLoL6J4SCD_B7ZID9oCQ/edit#gid=0")

# Definimos un tamaño de muestra
n <- 2
# 
estimaciones <- datos %>%
        sample_n(size=n) %>% # Esta línea extrae una muestra
        summarise( # Estas líneas calculan los estadísticos
                size = n,
                media_edad = mean(edad),
                prop_trabaja = mean(trabaja),
                media_horas = mean(Horas_trabajo_semanales))

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
                        media_horas = mean(Horas_trabajo_semanales)
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
                                prop_trabaja = mean(trabaja))
                
                muestras[[it]] <- estimaciones
                }
}

muestras <- do.call(rbind, muestras )

muestras %>%
        ggplot(aes(x=media_edad)) +
        geom_histogram() +
        theme_minimal() +
        facet_wrap(~size)


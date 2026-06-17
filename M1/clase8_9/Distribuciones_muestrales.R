library(googlesheets4)
library(tidyverse)
#datos <- read_sheet("https://docs.google.com/spreadsheets/d/1qbe64Q5w2K1qxyv39sYCA3DNLddz-MaijC8OQOFErO4/edit?resourcekey#gid=1177396456")

datos <- read_sheet("https://docs.google.com/spreadsheets/d/1rhrm8Tb9V3EWAmoRbzATKBmbo6cmqwaohZrt0a-WKLg/edit?gid=175850295#gid=175850295")
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


poblacion <- datos 
tamanios           <- c(3, 5, 7, 9, 11)
todas_las_muestras <- list()
estadisticos       <- list()

# ── Loop
for (n in tamanios) {
        
        nombre_n <- paste0("n", n)
        
        # 1. Todas las combaciones de los indices
        combis <- combn(nrow(poblacion), n, simplify = FALSE)
        
        # 2. Construye una tibble con todos las muestras
        muestras_n <- vector("list", length(combis))
        
        for (i in seq_along(combis)) {
                muestras_n[[i]] <- poblacion[combis[[i]], ] |>
                        mutate(
                                tamanio_muestra = n,
                                muestra_id      = i,
                                .before         = everything()
                        )
        }
        
        todas_las_muestras[[nombre_n]] <- bind_rows(muestras_n)
        
        # 3. Calcula estadístcos por muestra
        estadisticos[[nombre_n]] <- todas_las_muestras[[nombre_n]] |>
                group_by(muestra_id, tamanio_muestra) |>
                summarise(
                        media_materias = mean(materias,        na.rm = TRUE),
                        prop_trabajo   = mean(trabajo, na.rm = TRUE),  # TRUE/FALSE coerced to 1/0
                        .groups        = "drop"
                )
        
        # 4. Imprime resumen
        cat("\n══ n =", n, "══\n")
        cat("   Muestras posibles:", length(combis), "\n")
        print(head(estadisticos[[nombre_n]], 3))
}

# ── Análisis
estadisticos_todos <- bind_rows(estadisticos)

estadisticos_long <- estadisticos_todos |>
        pivot_longer(
                cols      = c(media_materias, prop_trabajo),
                names_to  = "estadistico",
                values_to = "valor"
        ) |>
        mutate(
                estadistico = recode(estadistico,
                                     "media_materias" = "Media de materias",
                                     "prop_trabajo"   = "Proporción 'Sí' en trabajo"
                ),
                tamanio_muestra = factor(tamanio_muestra,
                                         labels = paste0("n = ", tamanios))
        )



estadisticos_long %>%
        filter( estadistico == "Media de materias") %>%
ggplot(aes(x = valor)) +
        geom_histogram(bins = 30, fill = "#3B6D11", color = "white", linewidth = 0.2) +
        facet_wrap(~tamanio_muestra, scales = "free") +
        labs(
                title    = "Distribución muestral de cada estadístico",
                subtitle = "Todas las muestras posibles sin reposición — N = 16",
                x        = NULL,
                y        = "Frecuencia"
        ) +
        theme_minimal(base_size = 13) +
        theme(
                strip.text       = element_text(size = 11, face = "bold"),
                panel.grid.minor = element_blank(),
                plot.title       = element_text(face = "bold")
        )

params <- tibble(
        estadistico = c("Media de materias", "Proporción 'Sí' en trabajo"),
        valor_pob   = c(mean(poblacion$materias),
                        mean(poblacion$trabajo))
)

ggplot(estadisticos_long, aes(x = valor)) +
        geom_histogram(bins = 30, fill = "#3B6D11", color = "white", linewidth = 0.2) +
        geom_vline(data = params, aes(xintercept = valor_pob),
                   color = "#D85A30", linewidth = 0.8, linetype = "dashed") +
        facet_grid(estadistico ~ tamanio_muestra, scales = "free_x") +
        labs(
                title    = "Distribución muestral de cada estadístico",
                subtitle = "Línea roja = parámetro poblacional | N = 16",
                x        = NULL,
                y        = "Frecuencia"
        ) +
        theme_minimal(base_size = 13) +
        theme(
                strip.text       = element_text(size = 11, face = "bold"),
                panel.grid.minor = element_blank(),
                plot.title       = element_text(face = "bold")
        )


# Parámetros
parametros <- datos %>%
        summarise(
#                size = n,
                media_edad = mean(edad),
                prop_trabaja = mean(trabajo),
                media_horas = mean(horas_trabajo, na.rm=TRUE),
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
                prop_trabaja = mean(trabajo),
                media_horas = mean(horas_trabajo, na.rm=TRUE),
                media_materias = mean(materias)
                )

estimaciones

# Ahora repitámoslo muchas veces...
muestras <- list()
for (r in 1:1000){
        estimaciones <- datos %>%
                sample_n(size=n) %>%
                summarise(
                        sample = r,
                        size = n,
                        media_edad = mean(edad),
                        prop_trabaja = mean(trabajo),
                        media_horas = mean(horas_trabajo, na.rm=TRUE),
                        media_materias = mean(materias)
                )
        
        muestras[[r]] <- estimaciones
}

muestras <- do.call(rbind, muestras )

muestras %>%
        ggplot(aes(x=media_materias)) +
                geom_histogram() +
                theme_minimal()


# Ahora repitámoslo muchas veces y con diferentes tamaños de muestra
it <- 0
ns <- 2:15
muestras <- list()
for (n_ in ns){
        for (r in 1:1000){
                it <- it + 1
                estimaciones <- datos %>%
                        sample_n(size=n_) %>%
                        summarise(
                                sample = r,
                                size = n_,
                                media_edad = mean(edad),
                                prop_trabaja = mean(trabajo),
                                media_horas = mean(horas_trabajo, na.rm=TRUE),
                                media_materias = mean(materias)
                        )
                                
                muestras[[it]] <- estimaciones
                }
}

muestras <- do.call(rbind, muestras )

muestras %>%
        ggplot(aes(x=media_materias)) +
        geom_histogram() +
        theme_minimal() +
        facet_wrap(~size)


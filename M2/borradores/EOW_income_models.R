library(tidyverse)
library(broom)

df <- read_rds('./clase3/data/ENES_Personas_M1_EOW.rds')

df <- df %>% 
        mutate(v109 = case_when(
                v109=='Varón' ~ 'Masculino',
                TRUE ~ 'No masculino'))


df <- df %>%
        mutate(nivel_ed_agg = case_when(
                nivel_ed == 'Menores de 5 años' | 
                        nivel_ed == 'Sin instrucción (incluye nunca asistió o sólo asistió a sala de 5)' |
                        nivel_ed == 'Primaria/EGB incompleto' | nivel_ed == 'Primaria/EGB completo' | 
                        nivel_ed == 'Educación especial' | nivel_ed == 'NS/NR'~ '0_Bajo',
                
                nivel_ed == 'Secundario/Polimodal incompleto' | 
                        nivel_ed == 'Secundario/Polimodal completo' ~ '1_Medio',
                
                nivel_ed == 'Terciario incompleto' | nivel_ed == 'Terciario completo' | nivel_ed == 'Universitario incompleto' | nivel_ed == 'Universitario completo' ~ '2_Alto'
        )
        )

df <- df %>%
        mutate(class_eow_agg = case_when(
                class_eow == 'Managers' | class_eow == 'Supervisores' ~  'Managers/superv.',
                class_eow == 'Trabajadores' ~ 'Trabajadores',
                class_eow == 'Pequeña burguesía' ~ 'Pequeña burguesía',
                class_eow == 'Inactivo, desocupado o menor' ~ 'Inactivo, desocupado o menor',
                class_eow == 'Empleadores' ~ 'Empleadores'
        ))

names(df)

## Generación de años de educación (ver INDEC 2018)
df <- df %>%
        mutate(years_educ=
                       case_when(
                               nivel_ed=='Menores de 5 años'~ 0,
                               nivel_ed=='Sin instrucción (incluye nunca asistió o sólo asistió a sala de 5)'~ 0,
                               nivel_ed=='Educación especial'~ 0,
                               nivel_ed=='Primaria/EGB completo'~ 7,
                               nivel_ed=='Secundario/Polimodal completo'~ 12,
                               nivel_ed=='Terciario completo'~ 15,
                               nivel_ed=='Universitario completo'~ 17,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Ninguno'~ 0,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Primero'~ 1,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Segundo'~ 2,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Tercero'~ 3,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Cuarto'~ 4,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Quinto'~ 5,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Sexto'~ 6,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Séptimo'~ 7,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Octavo'~ 8,
                               nivel_ed=='Primaria/EGB incompleto' & v123=='Noveno'~ 9,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Ninguno'~ 7+0,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Primero'~ 7+1,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Segundo'~ 7+2,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Tercero'~ 7+3,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Cuarto'~ 7+4,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Quinto'~ 12,
                               nivel_ed=='Secundario/Polimodal incompleto' & v123=='Sexto'~ 12,
                               nivel_ed=='Terciario incompleto' & v123=='Ninguno'~ 12+0,
                               nivel_ed=='Terciario incompleto' & v123=='Primero'~ 12+1,
                               nivel_ed=='Terciario incompleto' & v123=='Segundo'~ 12+2,
                               nivel_ed=='Terciario incompleto' & v123=='Tercero'~ 12+3,
                               nivel_ed=='Terciario incompleto' & v123=='Cuarto'~ 15,
                               nivel_ed=='Terciario incompleto' & v123=='Quinto'~ 15,
                               nivel_ed=='Terciario incompleto' & v123=='Sexto'~ 15,
                               nivel_ed=='Universitario incompleto' & v123=='Ninguno'~ 12+0,
                               nivel_ed=='Universitario incompleto' & v123=='Primero'~ 12+1,
                               nivel_ed=='Universitario incompleto' & v123=='Segundo'~ 12+2,
                               nivel_ed=='Universitario incompleto' & v123=='Tercero'~ 12+3,
                               nivel_ed=='Universitario incompleto' & v123=='Cuarto'~ 12+4,
                               nivel_ed=='Universitario incompleto' & v123=='Quinto'~ 12+5,
                               nivel_ed=='Universitario incompleto' & v123=='Sexto'~ 17,
                               nivel_ed=='Universitario incompleto' & v123=='Séptimo'~ 17,
                               TRUE~ 0)
        )

df_hogar <- read_rds('./clase6/data/ENES_psh_cony.rds')


table(df$v189)

df <- df %>%
        mutate(tam_estab = case_when(
                v189 %in% c("NS/NR","Solo 1", "entre 2 y 5", "entre 6 y10") ~ "1_Microempresa",
                v189 %in% c("entre 11 y 25", "entre 26 y 49") ~ "2_Pequeña",
                v189 %in% c("50 y más") ~ "3_Mediana_grande"
                )
        )

df <- df %>%
        mutate(calif = str_sub(v183cno_cod, 5,5)) %>%
        mutate(calif = case_when(
                calif == 1 ~ "1_Profesional",
                calif == 2 ~ "2_Tecnico",
                calif == 3 ~ "3_Operativo",
                calif == 4 ~ "4_No_calificado",
                TRUE ~ "5_Sin_Dato"
        ))


df <- df %>%
        mutate(grupos_agg = case_when(
                grupos %in% c("Gran Burguesía", "Pequeña burguesía acomodada") 
                ~ "Gran y peq. burg. acomodada",
                TRUE ~ grupos)
        )

lm_full <- df %>% filter(estado=="Ocupado") %>%
        lm(v213b~ v108 + I(v108^2) + v109 + years_educ +
                   tam_estab + calif + v190 + 
                   grupos_agg, data=.)

summary(lm_full)


df %>%
        filter(estado=="Ocupado") %>%
        janitor::tabyl(class_eow_agg, grupos_agg)
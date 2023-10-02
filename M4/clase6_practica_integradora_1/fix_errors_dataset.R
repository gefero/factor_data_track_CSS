### Arreglo letras
library(tidyverse)
letras <- read_delim('./practica_integradora_1/data/original_tango_rock.csv', delim=",") %>%
        janitor::clean_names()

letras <- letras %>%
        filter(genero=="rock" | genero == 'tango') %>%
        select(link:genero) %>%
        bind_rows(
                letras %>%
                        filter(genero!="rock" & genero != 'tango') %>%
                        unite("letra", letra:x15, na.rm = TRUE) %>%
                        mutate(genero = str_extract(letra, 'rock|tango')) %>%
                        mutate(letra = str_replace(letra, '_rock|_tango', "")) %>%
                        mutate(genero = case_when(
                                is.na(genero) & str_detect(string = link, 'tango') ~ 'tango',
                                is.na(genero) & str_detect(string = link, 'rock') ~ 'rock',
                                TRUE ~ genero))
        ) 

letras <- letras %>%
        distinct(letra, .keep_all = TRUE)

write_csv(letras, './practica_integradora_1/data/tango_rock.csv')

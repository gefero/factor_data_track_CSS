library(tidyverse)
library(sf)

vuln <- read_sf('./clase9/data/Vulnerabilidad sanitaria 2010-2018.csv')
cond <- read_csv('./clase9/data/radios_hogar.csv')

cond <- cond %>% rename(link=radio)

vuln <- vuln %>%
        select(RADIO, `Centro de salud`:`Posta sanitaria`, `Geometría en WKT`) %>%
        rename(link=RADIO,
               tpo_hospital = `Hospital`,
               tpo_ctro_salud = `Centro de salud`,
               tpo_posta = `Posta sanitaria`,
               geometry = `Geometría en WKT`)

vuln_final <- vuln %>%
        left_join(cond) %>%
        select(everything(), geometry)

write_csv(vuln_final, "./clase9/data/vulnerabilidad_final.csv")

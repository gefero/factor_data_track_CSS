library(tidyverse)
library(haven)

pers <- read_rds('./clase5/data/ENES_Personas_M1_EOW.rds')
hog <- read_spss('./clase5/data/ENES_Hogares_version_final.sav')
psh_cony <- read_spss('./clase5/data/ENES_psh_cony.sav')


psh_cony <- haven::as_factor(psh_cony)

write_rds(psh_cony, './clase5/data/ENES_psh_cony.rds')

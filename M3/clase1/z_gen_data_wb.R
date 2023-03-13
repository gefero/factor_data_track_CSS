library(wbstats)
library(tidyverse)

indicators <- c("EG.ELC.ACCS.ZS",
                "SP.DYN.LE00.IN",
                "SH.DYN.MORT",
                "SH.STA.ODFC.ZS",  
                "SH.H2O.BASW.ZS",
                "SH.STA.BASS.ZS",
                "SH.STA.SMSS.ZS",
                "SP.POP.TOTL",
                "SP.URB.TOTL.IN.ZS")

data <- wb_data(indicators, start_date=2010, end_date=2022)

labs <- wb_data(indicators, start_date=2010, end_date=2022, return_wide = FALSE)

labs %>%
        select(indicator_id, indicator) %>%
        distinct()

data <- data %>%
        group_by(iso2c, iso3c, country) %>%
        summarise(across(everything(), ~mean(., na.rm=TRUE))) %>%
        select(-date) %>%
        drop_na()

write_csv(data, './clase1/data/desarrollo_wb.csv')

x <- read_csv('./clase1/data/desarrollo_wb.csv')

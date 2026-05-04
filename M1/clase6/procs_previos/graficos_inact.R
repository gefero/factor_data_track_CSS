library(Rilostat)
inact <- get_ilostat("EIP_2WAP_SEX_AGE_RT_A", type="both") %>%
        mutate(time = lubridate::ymd(paste0(time, "-01-01")))

population <- get_ilostat("POP_2POP_SEX_NB_A")

count_data <- read_csv('../../PIMSA_spr_mundo/data/ouputs/country_classification.csv')

inact <- inact %>%
        rename(iso3c = ref_area) %>%
        left_join(count_data) %>%
        filter(sex == "SEX_T" & classif1 == "AGE_YTHADULT_YGE15")

inact %>%
        filter(!(income_group_2 == "99_Sin_datos" | is.na(income_group_2))) %>%
        group_by(income_group_2, time) %>%
        summarise(value_mean = mean(obs_value, na.rm=TRUE)) %>%
        ggplot() + 
                geom_line(aes(x=time, y=value_mean, color=income_group_2,
                              group=income_group_2)) + 
                geom_vline(xintercept = as.Date("2026-01-01"), color = "grey50", linetype = "dashed") +
                scale_x_date(date_breaks = "10 year", date_labels = "%Y") +
                facet_wrap(~income_group_2) +
                theme_minimal() +
                labs(x="Año", 
                     y="Promedio simple tasas inact.", 
                     color="Grupo de ingresos")


inact  %>%
        filter(!is.na(region)) %>%
        group_by(region, time) %>%
        summarise(value_mean = mean(obs_value, na.rm=TRUE)) %>%
        ggplot() + 
        geom_line(aes(x=time, y=value_mean, color=region,
                      group=region)) + 
        geom_vline(xintercept = as.Date("2026-01-01"), color = "grey50", linetype = "dashed") +
        scale_x_date(date_breaks = "10 year", date_labels = "%Y") +
        facet_wrap(~region) +
        theme_minimal() +
        labs(x="Año", 
             y="Promedio simple tasas inact.", 
             color="Región")
        

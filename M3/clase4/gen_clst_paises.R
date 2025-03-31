df <- read_csv('./clase3/data/wb_bank_data_2019.csv')

df <- df %>%
        pivot_wider(id_cols = c(iso3c, iso2c, country), names_from = indicatorID, values_from = value)

df <- df %>%
        mutate(prop_tcp = SL.EMP.SELF.ZS - SL.FAM.WORK.ZS - SL.EMP.MPYR.ZS) %>%
        rename(prop_emp = SL.EMP.MPYR.ZS,
               prop_familiar = SL.FAM.WORK.ZS,
               prop_asal = SL.EMP.WORK.ZS)

df <- df %>%
        mutate(prop_pob_rel_sal = prop_asal + prop_emp ,
               prop_pob_rel_no_sal = prop_familiar + prop_tcp)


df <- df %>%
        rename(
                prop_agro = SL.AGR.EMPL.ZS,
                prop_ind = SL.IND.EMPL.ZS,
                prop_serv = SL.SRV.EMPL.ZS
        ) %>%
        select(iso3c:country, starts_with("prop"))


recipe_km <-df %>% 
        recipe(~.) %>%
        step_normalize(c(prop_pob_rel_sal, prop_agro, prop_serv)) 

set.seed(123)
dist <- recipe_km %>%
        prep() %>%
        bake(df) %>%
        select(prop_pob_rel_sal,  prop_agro, prop_serv) %>%
        dist(.x, method="euclidean")

hc_clust <- hclust(dist, method="ward.D2")

df <- df %>%
        mutate(
                clust_5 = paste0("C", cutree(hc_clust, k = 5)),
                clust_8 = paste0("C", cutree(hc_clust, k = 8))
                )

recipe_km <-df %>% 
        recipe(~.) %>%
        step_normalize(c(prop_pob_rel_sal, prop_agro, prop_serv)) 

set.seed(123)
km_2clst <- recipe_km %>%
        prep() %>%
        bake(df) %>%
        select(prop_pob_rel_sal,  prop_agro, prop_serv) %>%
        kmeans(x=.,
               centers=3)

df <- augment(km_2clst, df) %>% 
        rename(clust_3=.cluster) %>%
        mutate(
                clust_3 = paste0("C", clust_3),
                clust_9 = paste0("C",round(runif(nrow(df), min=1, max=9),0)))

df %>%
        select(iso3c:prop_pob_rel_no_sal, clust_3, clust_5, clust_8, clust_9) %>%
        write_csv('./clase4/data/wb_bank_data_2019_clsts.csv')

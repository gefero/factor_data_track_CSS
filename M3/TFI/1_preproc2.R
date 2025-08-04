library(tidyverse)
library(sf)
library(tidymodels)

vuln <- read_csv('./TFI/data/vuln_sanit.csv')
cond_vida <- read_csv('./TFI/data/radios_hogar.csv') %>% rename(link=radio)
radios_eph <- read_csv('./TFI/data/env_eph.csv') %>%
        mutate(link = paste0(codprov,coddepto,frac2010,radio2010)) %>%
                       select(id:aglomerado, link)
estab <- read_csv('./TFI/data/distribucion_establecimientos_productivos_sexo.csv')


df <- vuln %>%
        left_join(cond_vida) %>%
        left_join(radios_eph)


df <- df %>%
        st_as_sf(wkt="geometry")

estab <- estab %>% st_as_sf(coords=c("lon", "lat"))

estab <- estab %>%
        st_join(df)


set.seed(123)
split <- initial_split(df) 
train <- training(split)
test <- testing(split)

recipe_preproc <- df %>%
                recipe(~.) %>%
                update_role(link, new_role = "id variable") %>%
                update_role(geometry, new_role = "id variable") %>%
        step_mutate(
                tpo_posta = tidyr::replace_na(tpo_posta, 1700),
                tpo_ctro_salud = tidyr::replace_na(tpo_ctro_salud, 231),
                tpo_hospital = tidyr::replace_na(tpo_ctro_salud, 95),
                mean_tpo = (tpo_ctro_salud + tpo_hospital + tpo_posta)/3
                )
        

        step_normalize(tpo_ctro_salud:tpo_posta) %>%
        step_pca(tpo_ctro_salud:tpo_posta, num_comp = 2)

pca_estimates <- prep(recipe_preproc, training = df)

train <- pca_estimates %>% bake(train) %>% 
        mutate(link = as.character(link),
               geometry =as.character(geometry))

test <- pca_estimates %>% bake(test) %>% 
        mutate(link = as.character(link),
               geometry =as.character(geometry))

test <- test %>% st_as_sf(wkt="geometry")


train %>%
        filter(provincia=="Ciudad Autónoma de Buenos Aires") %>%
        ggplot() + 
                geom_sf(aes(fill=PC1)) + 
                scale_fill_viridis_c()



test <- pca_estimates %>% bake(test) %>%
        mutate(link = as.character(link),
               geometry =as.character(geometry))



cor(train$mean_tpo, train$PC1, method =  "spearman")

train

train %>%
        ggplot() +
         geom_point(aes(x=mean_tpo,y=PC1)) +
        facet_wrap(~provincia) +
                theme_minimal()


tidy(pca_estimates, 4, type = "coef") %>%
        filter(component %in% c("PC1", "PC2")) %>%
        ggplot(aes(value, terms, fill = terms)) + geom_col(show.legend = FALSE) + geom_text(aes(label = round(value,                                                                                                            +     2))) + labs(title = "Cargas factoriales (comp. 1 y 2)", x = "Valor", y = "Variable") +
        facet_wrap(~component, nrow = 1) + theme_minimal()

tidy(pca_estimates, 4, type = "variance")




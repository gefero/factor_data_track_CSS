library(tidyverse)
library(tidymodels)
library(themis)
library(baguette)
library(rpart.plot)

data <- read_delim("./clase7/data/enut2021_base.txt", delim = "|")

data <- data %>% select(ID, SEXO_SEL, EDAD_SEL, TCS_GRUPO_DOMESTICO, CONDICION_ACTIVIDAD_AGRUPADA,   
                        NIVEL_EDUCATIVO_AGRUPADO, CANT_DEMANDANTES_TOTAL, CANT_NODEMANDANTES_TOTAL,
                        BHCH04_SEL, BHDC_SEL) %>% 
        mutate(realiza_domest = as.factor(case_when(
                TCS_GRUPO_DOMESTICO > 120 ~ "Realiza",
                TRUE ~ "No realiza")))

data <- data %>% mutate_at(
        vars(SEXO_SEL), 
        ~as.factor(case_when(
                . == 1 ~ "Mujer",
                . == 2 ~ "Varón"
        )))


data <- data %>% mutate_at(vars(CONDICION_ACTIVIDAD_AGRUPADA), 
                           ~as.factor(case_when(
                                   . == 1 ~ "Ocupado",
                                   . == 2 ~ "No ocupado"
                           )))

data <- data %>% mutate_at(vars(BHCH04_SEL), 
                           ~as.factor(case_when(
                                   . == 1 ~ "Jefe/a",
                                   . == 2 ~ "Cónyuge/pareja",
                                   . == 3 ~ "Hijo/a",
                                   . == 4 ~ "Hijastro/a",
                                   . == 5 ~ "Yerno/nuera",
                                   . == 6 ~ "Nieto/a",
                                   . == 7 ~ "Padre o madre",
                                   . == 8 ~ "Suegro/a",
                                   . == 9 ~ "Hermano/a",
                                   . == 10 ~ "Cuñado/a",
                                   . == 11 ~ "Sobrino/a",
                                   . == 12 ~ "Abuelo/a",
                                   . == 13 ~ "Otro familiar",
                                   . == 14 ~ "Otro no familiar")))



data <- data %>% mutate_at(vars(BHDC_SEL), 
                           ~as.factor(case_when(
                                   . == 0 ~ "No es demandante de cuidado",
                                   . == 1 ~ "Es demandante de cuidado"
                           )))

data <- data %>% select(-TCS_GRUPO_DOMESTICO)

set.seed(123)

split <- initial_split(data)
train <- training(split)
test <- testing(split)

recipe <- recipe(realiza_domest ~ ., data = train)%>%
        update_role(ID, new_role = "id") %>%
        step_other(BHCH04_SEL, threshold = 0.2)

wf <- workflow() %>%
        add_recipe(recipe)

rf_spec <- rand_forest(
        trees = 750,
        mtry = tune(),
        min_n = tune()
) %>%
        set_mode("classification") %>%
        set_engine("ranger")

rf_spec %>% translate()

tree_rf <- wf %>%
        add_model(rf_spec)

tree_grid <- expand.grid(
        mtry = seq(1,8,2),
        min_n = seq(1,50,10)
)

set.seed(1912)
folds <- vfold_cv(train, v = 5)

tictoc::tic()
tree_rs <- tree_rf %>% 
        tune_grid(
                resamples = folds,
                grid = tree_grid,
                metrics = metric_set(precision, recall,
                                     roc_auc, f_meas))
tictoc::toc()

write_rds(tree_rs, './models/rf_final_train.rds')
autoplot(tree_rs)

best_model <- select_best(tree_rs, "roc_auc")

final_model <- finalize_model(rf_spec, best_model)
final_fit <- wf %>%
        update_model(final_model) %>%
        fit(train)

write_rds(final_fit, './clase7/models/rf_final_train.rds')

test_val <- final_fit %>%
        predict(test) %>%
        bind_cols(., test)

test_val <- predict(final_fit, test, type = "prob") %>%
        bind_cols(test_val, .)

class_metrics <- metric_set(precision, recall,
                            accuracy, f_meas)

roc_auc(test_val, truth = realiza_domest, ".pred_No realiza") %>% 
        bind_rows(class_metrics(test_val, truth = realiza_domest, estimate = .pred_class))


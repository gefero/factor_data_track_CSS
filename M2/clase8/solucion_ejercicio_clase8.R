

set.seed(753)
df_ocupados <- df_ocupados %>%
        slice_sample(n=nrow(df_ocupados), replace=FALSE)

# Definimos la cantidad de grupos
k <- 4

# Creamos k grupos del mismo tamaño
folds <- seq(1, nrow(df_ocupados)) %>%
        cut_interval(., n=k) %>%
        as.numeric()

# Hacemos cross validation
errores <- tibble(full = numeric(),
                  sin_clase = numeric(),
                  sin_ned = numeric(),
                  sin_ms = numeric()
)

for(i in 1:k){
        #Segement your data by fold using the which() function 
        test_index <-  which(folds==i, arr.ind=TRUE)
        test <- df_ocupados %>% slice(test_index)
        train <- df_ocupados %>% slice(-test_index)
        
        model_full <- train %>%
                lm(v213b ~ v108 + nivel_ed_agg + EOW_class_ + MS_CNO_calif , data = .)
        
        model_sin_clase <- train %>% 
                lm(v213b ~ v108 + nivel_ed_agg + MS_CNO_calif, data = .)
        
        model_sin_ned <- train %>%
                lm(v213b ~ v108 + EOW_class_ + MS_CNO_calif, data = .)
        
        model_sin_ms <-  train %>%
                lm(v213b ~ v108 + nivel_ed_agg + EOW_class_ , data = .)
        
        y_pred_full <- predict(model_full, test)
        y_pred_sin_clase <- predict(model_sin_clase, test)
        y_pred_sin_ned <- predict(model_sin_ned, test)
        y_pred_sin_ms <- predict(model_sin_ms, test)
        
        
        err <- tibble(
                full = sqrt(mean((test$v213bi - y_pred_full)**2)),
                sin_clase = sqrt(mean((test$v213bi - y_pred_sin_clase)**2)),
                sin_ned = sqrt(mean((test$v213bi - y_pred_sin_ned)**2)),
                sin_ms = sqrt(mean((test$v213bi - y_pred_sin_ms)**2))
        )
        
        errores <- errores %>% add_row(err)
        
}
errores %>%
        summarise(across(everything(), mean))
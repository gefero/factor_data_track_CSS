## Prácticos
### Calcular los residuos de la regresión anterior. Agregarlos como columna en el dataset original.
df_mayores <- df_mayores %>%
        mutate(weight_pred = predict(lm_1, df_mayores),
               weight_resid = weight - weight_pred)


### Hacer un residual plot. Recuerden, los residuos van en el eje $y$ y los valores predichos según el modelo de la variable dependiente van en el eje $x$
df_mayores %>%
        ggplot() +
        geom_point(aes(x=weight_pred, y=weight_resid)) +
        theme_minimal()

### Ahora tomen los menores de 18 años y realicen un gráfico de dispersión entre `heigth` (como variable independiente) y `weight` como dependiente. ¿Qué pueden decir al respecto? ¿Cómo se imaginan que sería el valor del $r$ en relación a los que surgen de los mayores de 18 años . Calcúlenlos.
df_menores <- df %>% filter(age < 18)

df_menores %>%
        ggplot() +
        geom_point(aes(x=height, y=weight, color=age)) +
        scale_color_viridis_c() +
        theme_minimal()

##Estimen una regresión lineal entre las mismas variables. ¿Cómo son los $\bteta_{1}$ en relación los de la regresión con los mayores de 18 años?
        
lm_2 <- lm(weight ~ height, data = df_menores)
summary(lm_2)

cor(df_mayores$height, df_mayores$weight)

cor(df_menores$height, df_menores$weight)


## ¿Qué pueden decir de los residuos?

df_menores %>%
        ggplot(aes(x=height, y=weight)) +
        geom_point() +
        geom_smooth(method='lm', se=FALSE, color="red") +
        theme_minimal()
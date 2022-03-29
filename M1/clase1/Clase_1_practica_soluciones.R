### EJERCICIOS DE PRÁCTICA

# 1. Crear un objeto llamado "primer_objeto" que defina el resultado de la multiplicación 6*4

# 2. Crear un vector llamado "ingresos" que contenga los valores: 45000, 70000, 90000, 25000

ingresos <- c(45000, 70000, 90000, 25000)

# 3. Modificar el valor del tercer elemento del vector ingresos por otro número
ingresos[3] <- 30000
ingresos

# 4. Crear un vector de tipo character que tenga la misma cantidad de valores que el vector "ingresos"
profesion <- c("Médico", "Panadero", "Docente", "Taxista")

# 5. Crear un factor que se llame "nivel_educativo", que contenga los valores: 
# "Hasta primario completo", "Hasta secundario completo" y "Hasta terciario/universitario completo" 
# y tenga la misma cantidad de registros que el vector "ingresos".
# Asígnele los niveles que le parezcan correspondientes. 
nivel_educativo <- factor(c("Hasta primario completo", "Hasta secundario completo",
                            "Hasta terciario/universitario completo", "Hasta primario completo"),
                          levels=c("Hasta terciario/universitario completo",
                                   "Hasta secundario completo",
                                   "Hasta primario completo"))

# 6a. Cree un objeto dataframe combinando los vectores creados previamente. 
# 6b. ¿Qué funciones puedo usar para explorar brevemente el dataframe? Úselas y describa que realizan.
data <- data.frame(ingresos, nivel_educativo, profesion)


# 7. Calcule la media de ingresos para el dataframe y almacénela en un objeto llamado "media_ingresos". 

media_ingresos <- mean(data$ingresos)

# 8. ¿Cómo puedo acceder al valor que está en la primera fila de la segunda columna del dataframe? 
data[1,2]

# 9. Cree una tabla de frecuencias para la columna "nivel_educativo". 
tabla <- table(data$nivel_educativo)
prop.table(tabla)


# 10. Borre todos los objetos creados. 

rm(ingresos, data, media_ingresos, nivel_educativo, profesion, tabla)

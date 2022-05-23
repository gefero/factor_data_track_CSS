# 1. Importe tidyverse y la base de datos de la ENES
library(tidyverse)

df <- read_rds('../clase6/data/ENES_Personas_M1.rds')

# 2. Usando mutate y case_when, realice el esquema de clases de John Goldthorpe (página 9 del ppt de la clase 6)

# 3. Realice gráficos y tablas que expresen cómo es el cruce de la clase social con las siguientes variables:
# a. Sexo
# b. Nivel educativo
# c. Monto de ingreso individual (ITI)

# 4. Cruce la condición socio-ocupacional (CSO) con la categoría ocupacional (cat_ocup). 
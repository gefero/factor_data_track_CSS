library(foreign)
library(tidyverse)

df<-read.spss('F:/PEN/Datasets_ML/PISAC_ENES/data/ENES_Personas_version_final.sav',
               to.data.frame = TRUE,
               use.value.labels = TRUE)


df <- df %>%
        mutate(v108=as.character(v108),
               v112=as.numeric(as.character(v112)),
               v113=as.numeric(as.character(v113)),
               v115=as.numeric(as.character(v115)),
               t_hogar=as.numeric(as.character(t_hogar)),
               v151=as.numeric(as.character(v151)),
               v163=as.numeric(as.character(v163)),
               v167=as.numeric(as.character(v167)),
               v187=as.numeric(as.character(v187)),
               v205=as.numeric(as.character(v205)),
               v206a=as.numeric(as.character(v206a)),
               v206b=as.numeric(as.character(v206b)),
               v211=as.numeric(as.character(v211)),
               v213b=as.numeric(as.character(v213b)),               
               v213bi=as.numeric(as.character(v213bi)),
               v214b=as.numeric(as.character(v214b)),
               v214bi=as.numeric(as.character(v214bi)),
               v215b=as.numeric(as.character(v215b)),
               v215bi=as.numeric(as.character(v215bi)),
               v216b=as.numeric(as.character(v216b)),
               v216bi=as.numeric(as.character(v216bi)),
               v217b=as.numeric(as.character(v217b)),
               v217bi=as.numeric(as.character(v217bi)),
               ITI=as.numeric(as.character(ITI))
        ) %>% 
        mutate(v108 = as.numeric(ifelse(v108=='Menor de un año', '0', 
                             ifelse(v108=='99 años y más','99',v108))))

df1<-read.spss('F:/PEN/Datasets_ML/PISAC_ENES/data/ENES_Personas_version_final.sav',
               to.data.frame = TRUE,
               use.value.labels = FALSE)


df$v182caes_cod<-df1$v182caes
df$v183cno_cod<-df1$v183cno
df$v183ciuo_cod<-df1$v183ciuo

df <- df %>%
        select(1:97,v182caes, v182caes_cod, v183ciuo_cod, v183cno, v183cno_cod, everything())

rm(df1)

### Procesamiento de variables de ocupación

#### CNO
df <- df %>%
        mutate(CNO_carac=str_sub(v183cno_cod,1,2),
               CNO_calif=factor(str_sub(v183cno_cod,5,5),
                                levels=c('1','2','3','4',' '),
                                labels=c('Profesional', 'Técnica',
                                         'Operativa', 'No calificada', NA)),
               CNO_jerarq=factor(str_sub(v183cno_cod,3,3),
                                 levels=c('0','1','2','3', ' '),
                                 labels=c('Dirección', 'Cuenta propia',
                                          'Jefatura', 'Ejecución directa','SD')),
               CNO_tecn=factor(str_sub(v183cno_cod,4,4),
                               levels=c('1','2','3','0','9',' '),
                               labels=c('Sin operación de maquinaria',
                                        'Operación de maquinaria y equipos electromecánicos',
                                        'Operación de sistemas y equipos informartizados',
                                        'SD', 'SD', NA))
        )

### CIUO
df %>%
        mutate(CIUO_1d=factor(str_sub(v183ciuo_cod, 1, 1),
                              levels=c('1','2','3','4','5','6','7','8','9','0'),
                              labels=c('Directivos y gerentes','Profesionales científicos e intelectuales',
                                       'Técnicos y profesionales de nivel medio',
                                       'Personal de apoyo administrativo',
                                       'Trabajadores de los servicios y vendedores de comercios y mercados',
                                       'Agricultores y trabajadores calificados agropecuarios, forestales y pesqueros',
                                       'Oficiales, operarios y artesanos de artes mecánicas y de otros oficios',
                                       'Operadores de instalaciones y máquinas y ensambladores',
                                       'Ocupaciones elementales',
                                       'Ocupaciones militares'))
               )                
                              
                              
                          

### Esquema de clases de OWright (1973)
# Se usa v187 como proxy de Say in pay or promotions

df$EOW_class <- NA

employers <- (df$cat_ocup == 'Patrón' | df$cat_ocup == 'Cuenta propia' | df$cat_ocup=='Trabajador familiar sin remuneración') & 
        (df$v196 == 'Sí, siempre' | df$v196 == 'Sólo a veces, por temporadas') & 
        (df$v186 == 'Sí' | df$v186 == 'No')

df$EOW_class[employers]<-'Empleadores'

managers <- (df$cat_ocup == 'Obrero o empleado') & 
        (df$v186 == 'Sí') & (df$v187 >= 5)

df$EOW_class[managers]<-'Managers'

supervisors <- (df$cat_ocup == 'Obrero o empleado') &
        (df$v186 == 'Sí' | df$v186 == 'NS/NR') & (df$v187 < 5 | is.na(df$v187))

df$EOW_class[supervisors]<-'Supervisores'

workers <- (df$cat_ocup == 'Obrero o empleado') &
        (df$v186 == 'No')

df$EOW_class[workers]<-'Trabajadores'

pettyb<- (df$cat_ocup == 'Cuenta propia' | df$cat_ocup=='Trabajador familiar sin remuneración') &
        (df$v196 == 'No contrata' | is.na(df$v196))

df$EOW_class[pettyb]<-'Pequeña burguesía'

table(df$estado)
apply(table(df$estado, df$EOW_class),1,sum)
table(df$estado, df$EOW_class)

df <- df %>%
        mutate(EOW_class=as.factor(EOW_class)) %>%
        select(1:118, EOW_class, everything())

rm(employers, managers, pettyb, supervisors, workers)

library(haven)
write_sav(df, "./data/ENES_personas.sav")


## Appendeamos datos de historia laboral y educativa de PSH y Cónyuge

df_hogar<-read.spss('F:/PEN/Datasets_ML/PISAC_ENES/data/ENES_Hogares_version_final.sav',
                    to.data.frame = TRUE)

df_hogar<-df_hogar %>% 
                select(c(1:3, 175:226))

df_hogar<-df_hogar %>% 
        select(c(1:2,4:29)) %>%
        rename_all(funs(str_replace(., "a", ""))) %>%
        rename(miembro=vnropsh) %>%
        mutate(miembro=as.numeric(miembro)) %>%
        bind_rows(
                df_hogar %>%
                        select(c(1:2, 30:55)) %>%
                        rename_all(funs(str_replace(., "b", ""))) %>%
                        rename(miembro=vnrocon) %>%
                        mutate(miembro=as.numeric(miembro))
                ) %>%
        select(1:2, miembro, everything())




df_psh_c <- df %>%
                filter((v111 == 'PSH' | v111 == 'Cónyuge'))



df_psh_c<-df_psh_c %>%
        left_join(df_hogar, by=c('nocues', 'nhog', 'miembro'))


write_sav(df_psh_c, "./data/ENES_psh_cony.sav")



### CONSTRUIR NIVEL EDUCATIVOS

### CONSTRUIR ESQUEMA PIMSA (o aproximado)


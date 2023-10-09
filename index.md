![](./imgs/LOGO-FactorData-Color.jpg)

## Docente
- [Germán Rosati](https://gefero.github.io/)

## Presentación
Esta materia se constituye como la última de un trayecto de materias optativas orientado a incorporar a las carreras de la EIDAES un conjunto de materias que permitan realizar a les estudiantes un primer acercamiento al campo disciplinar conocido como "Ciencias Sociales Computacionales". Por ello, se plantean como una continuación y profundización de la materia Metodologías Cuantitativas. En este sentido, la orientación es correlativa a las materias “Metodología de la Investigación” y “Metodologías Cuantitativas”. 

El objetivo general de este cuarto módulo es brindar un acercamiento a algunas técnicas avanzadas de procesamiento de lenguaje natural para la investigación empírica. También se abordarán algunas estrategias de web scraping. Particularmente, se trabajará desde un enfoque conceptual (fundamentos teórico-metodológicos, casos y problemas de aplicación, etc.) y técnico (análisis de algoritmos, herramientas con interfaces gráficas, etc.).

Tanto los contenidos de los ejercicios prácticos como las lecturas más conceptuales giran en torno de una misma temática, que para el segundo semestre de 2023 será el análisis de un corpus textual de letras de dos géneros (rock y tango) de la música popular argentina. Esta focalización en un único tema pretende facilitar la comprensión de métodos y técnicas y, al mismo tiempo, aportar a la formación sustantiva de les estudiantes. 

El curso es una introducción práctica al análisis computacional de textos. Se propone que les asistentes 
logren comprender algunos conceptos metodológicos fundamentales para el preprocesamiento de datos textuales (tokenizacion, lematizacion, stemming, etc.) y representación vectorial clásica de textos (Term-Frequency Matrix, tf-idf, bag of words, n-gramas, etc.); 
conozcan algunas técnicas de modelado y detección de tópicos; 
se introduzcan a algunas técnicas modernas de representación vectorial de textos (word embeddings); 
conozcan algunos fundamentos para la recolección de datos no estructurados de páginas web (web scraping)
sean capaces de identificar situaciones de aplicación de estas técnicas en sus propias investigaciones.

## Modalidad de trabajo
Las clases estarán organizadas en dos segmentos. En el primero se expondrán los contenidos conceptuales del curso. En el segundo se trabajará en forma colectiva en la resolución de prácticas guiadas e independientes: repaso metodológico de investigaciones empíricas, procesamiento de datos, análisis e interpretación de resultados. 

## Correlatividades
Para poder cursar esta materia es necesario haber aprobado la materia “Metodologías cuantitativas”. Al mismo tiempo, es requisito haber cursado y mantenido la regularidad de los tres primeros módulos del trayecto (“Procesamiento de datos con R para ciencias sociales” y “Métodos de análisis cuantitativos multivariados” y “Machine Learning aplicado a las Ciencias Sociales”). 

## Condiciones de cursada y evaluación
Para obtener la regularidad de la materia es necesario: a) asistir al 80% de las clases (tanto teóricas como prácticas); b) realizar las actividades propuestas en clase y c) aprobar con una nota de 4 o más tres instancias de evaluación: la presentación de un trabajo monográfico final (grupal), una exposición de avance (grupal) y su defensa oral (individual).

La nota final de la materia consistirá en el promedio del puntaje obtenido en las dos instancias de evaluación. La materia se inscribe en el régimen de promoción directa de la UNSAM, que requiere que el alumno obtenga un promedio de cursada igual o mayor a 7 (siete) y una nota igual o mayor a 6 (seis) en cada una de las instancias parciales. 

## Programa
- [Programa de la materia - 2do. cuatrimestre 2023](https://docs.google.com/document/d/1GlcEyFdRJUairxOFrQS8GaGKskHM60p3U29xSWMMrdM/edit?usp=sharing)

## Contenidos y materiales
### Clase 8. Clasificación de textos mediante TF-IDF y Word Embeddings
- [Explicación - LDA - Notebook](./M4/clase8/notebooks/clase_7_word2vec.html)
- [Explicación - LDA - RMarkdown](./M4/clase8/notebooks/notebooks/clase_7_word2vec.Rmd)

[![](./imgs/Download.png)](./M4/clase7/clase7.zip)

### Clase 7. ¿Cómo vectorizar un corpus E.II? Breve introducción a word embeddings
- [Diapositivas](./M4/clase7/M4_clase_7.pdf)
- [Explicación - LDA - Notebook](./M4/clase7/notebooks/clase_8_clasificacion.html)
- [Explicación - LDA - RMarkdown](./M4/clase7/notebooks/notebooks/clase_8_clasificacion.Rmd)

[![](./imgs/Download.png)](./M4/clase8/clase8.zip)

### Clase 6. Práctica integradora 1.
Se entrega 
- [Consignas - Notebook](./M4/clase6_practica_integradora_1/practica_integradora_c1_c3.html)
- [Consignas - RMarkdown](./M4/clase6_practica_integradora_1/practica_integradora_c1_c3.Rmd)
- [Corpus](./M4/practica_integradora_1/data/tango_rock.csv)
- [Lexicon stopwords](./M4/clase6_practica_integradora_1/data/stop_words_complete.csv)

[![](./imgs/Download.png)](./M4/clase6_practica_integradora_1/practica_integradora_1.zip)

### Clase 5. ¿Cómo detectar temas en un corpus? Dos técnicas de modelado de tópicos
- [Diapositivas](./M4/clase5/M4_clase_5.pdf)
- [Explicación - LDA - Notebook](./M4/clase5/notebooks/clase_51_topic_modeling_LDA.html)
- [Explicación - LDA - RMarkdown](./M4/clase5/notebooks/clase_51_topic_modeling_LDA.Rmd)
- [Explicación - STM - Notebook](./M4/clase5/notebooks/clase_52_topic_modeling_STM.html)
- [Explicación - STM - RMarkdown](./M4/clase5/notebooks/clase_52_topic_modeling_STM.Rmd)
- [Práctica independiente - Notebook](./M4/clase5/notebooks/clase_53_practica_independiente.html)
- [Práctica independiente - RMarkdown](./M4/clase5/notebooks/clase_53_practica_independiente.Rmd)

[![](./imgs/Download.png)](./M4/clase5/clase5.zip)

### Clase 4. ¿Cómo recolectar datos de la web? Web scraping y APIS
- [Diapositivas](./M4/clase4/M4_clase_4.pdf)
- [Explicación - Scraping - Notebook](./M4/clase4/notebooks/clase_4_scraping.html)
- [Explicación - Scraping - RMarkdown](./M4/clase4/notebooks/clase_4_scraping.Rmd)
- [Explicación - APIs - Notebook](./M4/clase4/notebooks/clase_4_APIs.html)
- [Explicación - APIs - RMarkdown](./M4/clase4/notebooks/clase_4_APIs.Rmd)
- [Práctica independiente - Notebook](./M4/clase4/notebooks/clase_4_practica_independiente.html)
- [Práctica independiente - RMarkdown](./M4/clase4/notebooks/clase_4_practica_independiente.Rmd)

[![](./imgs/Download.png)](./M4/clase4/clase4.zip)

### Clase 3.¿Cómo vectorizar textos? N-gramas, co-ocurrencias, grafos y correlaciones entre palabras.
- [Explicación y práctica - Sentiment Analysis - Notebook](./M4/clase3/notebooks/clase_3_n_grams.html)
- [Explicación y práctica - Sentiment Analysis - RMarkdown](./M4/clase3/notebooks/clase_3_n_grams.Rmd)

### Clase 2.¿Cómo vectorizar textos? Contando palabras y extrayendo conclusiones de un corpus. Bag of Words. Term-frequency matrix: conteos crudos y ponderación TF-IDF. Análisis de sentimientos sobre un corpus.
- [Diapositivas](./M4/clase2/M4_clase_2.pdf)
- [Explicación y práctica - Sentiment Analysis - Notebook](./M4/clase2/notebooks/clase_2_1_sentiment_analysis.html)
- [Explicación y práctica - Sentiment Analysis - RMarkdown](./M4/clase2/notebooks/clase_2_1_sentiment_analysis.Rmd)
- [Explicación y práctica - TFIDF - Notebook](./M4/clase2/notebooks/clase_2_2_tfidf.html)
- [Explicación y práctica - TFIDF - RMarkdown](./M4/clase2/notebooks/clase_2_2_tfidf.Rmd)

[![](./imgs/Download.png)](./M4/clase2/clase2.zip)


### Clase 1. ¿Cómo hacer de un corpus de texto crudo algo analizable mediante métodos cuantitativos? Cualitativo y cuantitativo como niveles de estandarización de los datos. Preprocesamiento de texto: stopwords, lemmas y stemming. Concepto general del formato tidytext. 
- [Diapositivas](./M4/clase1/M4_clase_1.pdf)
- [Explicación y práctica - Notebook](./M4/clase1/notebooks/clase_1.html)
- [Explicación y práctica - RMarkdown](./M4/clase1/notebooks/clase_1.Rmd)
- [Práctica independiente - Notebook](./M4/clase1/notebooks/practica_clase_1.html)
- [Práctica independiente - RMarkdown](./M4/clase1/notebooks/practica_clase_1.Rmd)

[![](./imgs/Download.png)](./M4/clase1/clase1.zip)

	
---

## Modulo 3: Machine Learning aplicado a las Ciencias Sociales
### Presentación

## Presentación
Esta materia se constituye como la tercera de un trayecto de materias optativas orientado a incorporar a las carreras de la EIDAES un conjunto de materias que permitan realizar a les estudiantes un primer acercamiento al campo disciplinar conocido como "Ciencias Sociales Computacionales". Por ello, se plantean como una continuación y profundización de la materia Metodologías Cuantitativas. En este sentido, la orientación es correlativa a las materias “Metodología de la Investigación” y “Metodologías Cuantitativas”. 

El objetivo general de este tercer módulo es brindar un acercamiento  a algunas técnicas avanzadas de  modelado de datos y aprendizaje automático para la investigación empírica. Particularmente, se trabajará desde un enfoque conceptual (fundamentos teórico-metodológicos, casos y problemas de aplicación, etc.) y técnico (análisis de algoritmos, herramientas con interfaces gráficas, etc.).

El curso intenta brindar insumos que sirvan para que les estudiantes logren comprender los fundamentos conceptuales y metodológicos de algunas técnicas básicas de machine learning: clustering, árboles de decisión, bagging y boosting.

Tanto los contenidos de los ejercicios prácticos como las lecturas más conceptuales giran en torno de una misma temática, que para el primer semestre de 2023 será el análisis de la estructura social. Esta focalización en un único tema pretende facilitar la comprensión de métodos y técnicas y, al mismo tiempo, aportar a la formación sustantiva de les estudiantes. 

Para el procesamiento y análisis estadístico se utilizará el lenguaje R y datos de la Encuesta Permanente de Hogares del INDEC.

Durante el curso se espera que les estudiantes:
- se familiaricen con aspectos conceptuales del entrenamiento de modelos de machine learning
- conozcan los fundamentos de los análisis de clustering
- logren implementar e interpretar algunos métodos de machine learning
- adviertan la posibilidad de aplicar este tipo de herramientas a problemas vinculados al análisis de la estructura social 
- identifiquen situaciones de aplicación de este tipo de herramientas a problemas de investigación básica y aplicada

## Programa
- [Programa de la materia - 1er. cuatrimestre 2023](https://docs.google.com/document/d/18AaSQh2mvOahGhLAniOhCyUrIOhLL3ZhqUauhcOSM2o/edit?usp=sharing)

## Trabajo Final Integrador
- [Consignas - Notebook](./M3/TFI/TFI_Consignas.html)
- [Consignas - Rmarkdown](./M3/TFI/TFI_Consignas.Rmd)
- [Dataset 1 - Datos sobre condiciones de vida](./M3/TFI/data/radios_hogar.csv)
- [Dataset 2 - Datos sobre accesibildad a servicios de salud](./M3/TFI/data/vuln_sanit.csv)
- [Dataset 3 - Radios pertenecientes a EPH](./M3/TFI/data/env_eph.csv)

[![](./imgs/Download.png)](./M3/TFI/TFI.zip)

## Contenidos y materiales
### Clase 1. Presentación - Aprendizaje No Supervisado E1: PCA
- [Diapositivas](./M3/clase1/M3_Clase_1.pdf)
- [Explicación y práctica - Notebook](./M3/clase1/Clase_1.html)
- [Explicación y práctica - RMarkdown](./M3/clase1/Clase_1.Rmd)
- [Práctica independiente - Notebook](./M3/clase1/Clase_1_pract.html)
- [Práctica independiente - RMarkdown](./M3/clase1/Clase_1_pract.Rmd)

[![](./imgs/Download.png)](./M3/clase1/clase1.zip)

### Clase 2. Aprendizaje No Supervisado E2: Análisis de Correspondencias Múltiples (MCA)
- [Diapositivas](./M3/clase2/M3_Clase_2.pdf)
- [Explicación y práctica - Notebook](./M3/clase2/Clase_2.html)
- [Explicación y práctica - RMarkdown](./M3/clase2/Clase_2.Rmd)
- [Práctica independiente - Notebook](./M3/clase2/Clase_2_pract.html)
- [Práctica independiente - RMarkdown](./M3/clase2/Clase_2_pract.Rmd)
- [Bibliografía-Baranger](./M3/clase2/biblio/Baranger_ACM.pdf)
- [Bibliografía-De la Fuente Fernández](./M3/clase2/biblio/correspondencias.pdf)

### Clase 3. Aprendizaje No Supervisado E3: Clustering K-Medias
- [Diapositivas](./M3/clase3/M3_Clase_3.pdf)
- [Explicación y práctica - Notebook](./M3/clase3/Clase_3.html)
- [Explicación y práctica - RMarkdown](./M3/clase3/Clase_3.Rmd)
- [Práctica independiente - Notebook](./M3/clase3/Clase_3_pract.html)

[![](./imgs/Download.png)](./M3/clase3/clase3.zip)


### Clase 4. Aprendizaje No Supervisado E3: Clustering Jerárquico y pŕactica
- [Diapositivas](./M3/clase3/M3_Clase_3.pdf)
- [Explicación y práctica - Notebook](./M3/clase4/Clase_4.html)
- [Explicación y práctica - RMarkdown](./M3/clase4/Clase_4.Rmd)
- [Práctica independiente - Notebook](./M3/clase4/Clase_4_pract.html)

[![](./imgs/Download.png)](./M3/clase4/clase4.zip)


### Clase 5. Introducción al flujo de trabajo supervisado
- [Diapositivas](./M3/clase5/M3_Clase_5.pdf)
- [Explicación y práctica Parte 1 - Notebook](./M3/clase5/Clase_5a.html)
- [Explicación y práctica Parte 1 - RMarkdown](./M3/clase5/Clase_5a.Rmd)
- [Explicación y práctica Parte 2 - Notebook](./M3/clase5/Clase_5b.html)
- [Explicación y práctica Parte 2 - RMarkdown](./M3/clase5/Clase_5b.Rmd)
- [Práctica independiente - Notebook](./M3/clase5/Clase_5_pract.html)

[![](./imgs/Download.png)](./M3/clase5/clase5.zip)


### Clase 6. Árboles de decisión - CART
- [Diapositivas](./M3/clase6/M3_Clase_6.pdf)
- [Explicación y práctica - Notebook](./M3/clase6/Clase_6.html)
- [Explicación y práctica - RMarkdown](./M3/clase6/Clase_6.Rmd)
- [Práctica independiente - Notebook](./M3/clase6/Clase_6_pract.html)

[![](./imgs/Download.png)](./M3/clase6/clase6.zip)

### Clase 7. Ensamble Learning E1 - Bagging + Random Forest
- [Diapositivas Parte 1](./M3/clase7/M3_Clase_7_I.pdf)
- [Explicación y práctica - Notebook](./M3/clase7/Clase_7.html)
- [Explicación y práctica - RMarkdown](./M3/clase7/Clase_7.Rmd)

[![](./imgs/Download.png)](./M3/clase7/clase7.zip)

### Clase 8. Ensamble Learning E2 - Boosting
- [Diapositivas Random Forest](./M3/clase8/M3_Clase_7_II.pdf)
- [Diapositivas Boosting](./M3/clase8/M3_Clase_8.pdf)
- [Explicación y práctica - Notebook](./M3/clase8/Clase_8_I.html)
- [Explicación y práctica - RMarkdown](./M3/clase8/Clase_8_I.Rmd)
- [Explicación y práctica parte 2 - Notebook](./M3/clase8/Clase_8_II.html)
- [Explicación y práctica parte 2 - RMarkdown](./M3/clase8/Clase_8_II.Rmd)

[![](./imgs/Download.png)](./M3/clase8/clase8.zip)


### Clase 9 a 11. Taller Trabajo Final Integrador

---

## Modulo 2: Métodos de análisis cuantitativos multivariados
### Presentación
Esta materia se constituye como la primera de un trayecto de materias optativas orientado a incorporar a las carreras de la EIDAES un conjunto de materias que permitan realizar a les estudiantes un primer acercamiento al campo disciplinar conocido como "Ciencias Sociales Computacionales". Por ello, se plantean como una continuación y profundización de la materia Metodologías Cuantitativas. En este sentido, la orientación es correlativa a las materias “Metodología de la Investigación” y “Metodologías Cuantitativas”.

El objetivo general de este segundo módulo es brindar un acercamiento  a algunas técnicas básicas de modelado de datos para la investigación empírica desde un enfoque conceptual (fundamentos teórico-metodológicos, casos y problemas de aplicación, etc.) y técnico (análisis de algoritmos, herramientas con interfaces gráficas, etc.).

El curso está centrado en brindar insumos que sirvan para que les estudiantes logren comprender los fundamentos conceptuales y metodológicos de tres técnicas básicas de modelado de datos: regresión lineal, logística y clustering.

Tanto los contenidos de los ejercicios prácticos como las lecturas más conceptuales giran en torno de una misma temática, que para el segundo semestre de 2022 será el análisis de la estructura social. Esta focalización en un único tema pretende facilitar la comprensión de métodos y técnicas y, al mismo tiempo, aportar a la formación sustantiva de les estudiantes. 

Para el procesamiento y análisis estadístico se utilizará el lenguaje R y datos de la Encuesta Permanente de Hogares del INDEC y de la Encuesta Nacional sobre la Estructura Social (ENES) realizada por el PISAC.

---

### Trabajo Final Integrador

- **Fecha de entrega:** 14 de noviembre de 2022
- [Consignas](https://docs.google.com/document/d/14LlpB5ny6yMSJ34jmojov7pjIeii81teSzc-d6QXXPA/edit?usp=sharing)

- [Insumo: script para generar la clase total del hogar](./M2/clase10/script_class_hogar.R)

---



### Programa
- [Programa de la materia - 2do. cuatrimestre 2022](https://docs.google.com/document/d/1gPVwRZETVF07Rg7veu0UAUMKmdobLCtR6mDHq16vnoM/edit?usp=sharing)

### Contenidos y materiales
#### Clase 1. Presentación - Regresión lineal simple E1
- [Explicación y práctica - Notebook](./M2/clase1/Clase_1.html)
- [Explicación y práctica - RMarkdown](./M2/clase1/Clase_1.Rmd)


#### Clase 2. Presentación - Regresión lineal simple E2 
- [Explicación y práctica - Notebook](./M2/clase2/Clase_2.html)
- [Explicación y práctica - RMarkdown](./M2/clase2/Clase_2.Rmd)
- [Ejericio - Notebook](./M2/clase2/Clase_2_ejercicio.html)
- [Ejericio - RMarkdown](./M2/clase2/Clase_2_ejercicio.Rmd)
- [Ejericio solución - Notebook](./M2/clase2/Clase_2_ejercicio_solucion.html)
- [Ejericio solución - RMarkdown](./M2/clase2/Clase_2_ejercicio_solucion.Rmd)

[![](./imgs/Download.png)](./M2/clase2/clase2.zip)


#### Clase 3. Presentación - Regresión lineal múltiple E1 
- [Explicación y práctica - Notebook](./M2/clase3/Clase_3.html)
- [Explicación y práctica - RMarkdown](./M2/clase3/Clase_3.Rmd)
- [Olin Wright, E. (1974), _Class structure and income determination_, New York: Academic Press](https://drive.google.com/file/d/1_uzxqlkOmx_AG6T1uqILvNZIK9hIS4mN/view?usp=sharing)
- [Cuestionario - ENES](./M1/clase6/material_pisac/formulario_enes.pdf)
- [Diseño de registro - personas - ENES](./M1/clase6/material_pisac/manual_codigos_base_personas.pdf)
- [Marco conceptual - ENES](./M1/clase6/material_pisac/marco_teorico_metodologico_enes_pisac.pdf)

[![](./imgs/Download.png)](./M2/clase3/clase3.zip)


#### Clase 4. Presentación - Regresión lineal múltiple E2 
- [Explicación y práctica - Notebook](./M2/clase4/Clase_4.html)
- [Explicación y práctica - RMarkdown](./M2/clase4/Clase_4.Rmd)

[![](./imgs/Download.png)](./M2/clase4/clase4.zip)


#### Clase 5. Ejercicio integrador 
- [Ejericio integrador - Notebook](./M2/clase4/Clase_4_ejercicio.html)
- [Ejericio integrador - RMarkdown](./M2/clase4/Clase_4_ejercicio.Rmd)


#### Clase 6. Regresión logística 
- [Explicación y práctica - Notebook](./M2/clase5/Clase_5.html)
- [Explicación y práctica - RMarkdown](./M2/clase5/Clase_5.Rmd)
- [Diapositivas](./M2/clase5/Clase_5.pdf)

[![](./imgs/Download.png)](./M2/clase5/clase5.zip)


#### Clase 7. Regresión logística - Ejercicio integrador y evaluación de ajuste
- [Explicación y práctica - Notebook](./M2/clase6/Clase_6_practico.html)
- [Explicación y práctica - RMarkdown](./M2/clase6/Clase_6_practico.Rmd)
- [Explicación y práctica (solución) - Notebook](./M2/clase6/Clase_6_practico_soluciones.html)
- [Explicación y práctica (solución) - RMarkdown](./M2/clase6/Clase_6_practico_soluciones.Rmd)

[![](./imgs/Download.png)](./M2/clase6/clase6.zip)


#### Clase 8. Inferencia en regresión lineal
- [Explicación y práctica - Notebook](./M2/clase7/Clase_7.html)
- [Explicación y práctica - RMarkdown](./M2/clase7/Clase_7.Rmd)
- [Loops Explicación y práctica - Notebook](./M2/clase7/Clase_7_loops.html)
- [Loops Explicación y práctica - RMarkdown](./M2/clase7/Clase_7_loops.Rmd)
- [Práctica - Notebook](./M2/clase7/Clase_7_ejercicio.html)
- [Práctica - RMarkdown](./M2/clase7/Clase_7_ejercicio.Rmd)
- [Práctica solución - Notebook](./M2/clase7/Clase_7_ejercicio_solucion.html)
- [Práctica solución - RMarkdown](./M2/clase7/Clase_7_ejercicio_solucion.Rmd)

[![](./imgs/Download.png)](./M2/clase7/clase7.zip)


#### Clase 9. Inferencia en regresión lineal EII
- [Explicación y práctica - Notebook](./M2/clase8/Clase_8.html)
- [Explicación y práctica - RMarkdown](./M2/clase8/Clase_8.Rmd)
- [Diapositivas](./M2/clase8/Slides_Clase_8.pdf)

[![](./imgs/Download.png)](./M2/clase8/clase8.zip)


#### Clase 9. Inferencia en regresión logística
- [Explicación y práctica - Notebook](./M2/clase9/Clase_9.html)
- [Explicación y práctica - RMarkdown](./M2/clase9/Clase_9.Rmd)
- [Diapositivas](./M2/clase9/Slides_Clase_9.pdf)

[![](./imgs/Download.png)](./M2/clase9/clase9.zip)

#### Clase 10a. Taller TP Integrador I

#### Clase 10b. Taller TP Integrador II + Haciendo entendible una regresión
- [Explicación y práctica - Notebook](./M2/clase10/Clase_10.html)
- [Explicación y práctica - RMarkdown](./M2/clase10/Clase_10.Rmd)

#### Clase 11. Taller TP Integrador III

#### Clase 12. Entrega y exposición


---

# Módulo 1: Procesamiento de datos en R y estadística para Ciencias Sociales
## Contenidos y materiales
### Clase 1. Presentación - Introducción a R

- [Explicación y práctica - Notebook](./M1/clase1/Clase_1.html)
- [Explicación y práctica - RMarkdown](./M1/clase1/Clase_1.Rmd)
- [Práctica Independiente - RMarkdown](./M1/clase1/Clase_1_practica.R)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip

[![](./imgs/Download.png)](./M1/clase1/clase1.zip)


## Clase 2. Introducción a `tidyverse`

- [Slides - pdf](./M1/clase2/M1_Clase_2.pdf)
- [Explicación y práctica - Notebook](./M1/clase2/Clase_2.html)
- [Explicación y práctica - RMarkdown](./M1/clase2/Clase_2.Rmd)
- [Práctica Independiente - RMarkdown](./M1/clase2/Clase_2_practica.R)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip

[![](./imgs/Download.png)](./M1/clase2/clase2.zip)


## Clase 3. Intuiciones de muestreo -  Ejercicio integrador `tidyverse`

- [Slides - pdf](./M1/clase3/M1_Clase_3.pdf)
- [Práctica - Notebook](./M1/clase3/Clase_3.html)
- [Práctica - RMarkdown](./M1/clase3/Clase_3.Rmd)
- [Soluciones práctica - Notebook](./M1/clase3/Clase_3_soluciones.Rmd)


Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip

[![](./imgs/Download.png)](./M1/clase3/clase3.zip)


## Clase 4. Explorando datos categóricos

- [Explicación teórica - Notebook](./M1/clase4/Clase_4_Teoria.html)
- [Explicación teórica - RMarkdown](./M1/clase4/Clase_4_Teoria.Rmd)
- [Práctica guiada - Notebook](./M1/clase4/Clase_4_Practica.html)
- [Práctica guiada - RMarkdown](./M1/clase4/Clase_4_Practica.Rmd)
- [Práctica independiente - RScript](./M1/clase4/Clase_4_practica_independiente.R)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip

[![](./imgs/Download.png)](./M1/clase4/clase4.zip)

## Clase 5. Explorando datos cuantitativos

- [Explicación teórica - Notebook](./M1/clase5/Clase_5_Teoria.html)
- [Explicación teórica - RMarkdown](./M1/clase5/Clase_5_Teoria.Rmd)
- [Práctica guiada - Notebook](./M1/clase5/Clase_5_Practica.html)
- [Práctica guiada - RMarkdown](./M1/clase5/Clase_5_Practica.Rmd)
- [Práctica independiente - RScript](./M1/clase5/Clase_5_practica_independiente.R)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip
1
[![](./imgs/Download.png)](./M1/clase4/clase4.zip)


## Clase 6. Tipologías en R

- [Slides - Notebook](./M1/clase6/M1_Clase_6.pdf)
- [Explicación y práctica - Notebook](./M1/clase6/Clase_6_Esquema_EOW.html)
- [Explicación y práctica - RMarkdown](./M1/clase6/Clase_6_Esquema_EOW.Rmd)
- [Olin Wright, E. (1974), _Class structure and income determination_, New York: Academic Press](https://drive.google.com/file/d/1_uzxqlkOmx_AG6T1uqILvNZIK9hIS4mN/view?usp=sharing)
- [Cuestionario - ENES](./M1/clase6/material_pisac/formulario_enes.pdf)
- [Diseño de registro - personas - ENES](./M1/clase6/material_pisac/manual_codigos_base_personas.odf)
- [Marco conceptual - ENES](./M1/clase6/material_pisac/marco_teorico_metodologico_enes_pisac.pdf)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip
[![](./imgs/Download.png)](./M1/clase6/clase6.zip)


## Clase 7. Ocupación y ejercicio integrador
- [Slides - Notebook](./M1/clase7/M1_Clase_7.pdf)
- [Práctica - R script](./M1/clase7/Clase_7_ejercicio.R)
- [Práctica con soluciones - R script](./M1/clase7/Clase_7_ejercicio_SOLUCIONES.R)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip
[![](./imgs/Download.png)](./M1/clase7/clase7.zip)


## Clases 8 y 9. Introducción a Bootstrap
- [Slides - Notebook](./M1/clase8_9/M1_Clase_8.pdf)
- [Script - Ejercicio de construcción de distribución muestral](./M1/clase8/Distribuciones_muestrales.R) 
- [Explicación y práctica - Notebook](./M1/clase8_9/Clase_8_9_PdHip.html)
- [Explicación y práctica - RMarkdown](./M1/clase8_9/Clase_8_9_PdHip.Rmd)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip
[![](./imgs/Download.png)](./M1/clase8_9/clase8_9.zip)


## Clases 10. Asociación en tablas de contingencia
- [Explicación y práctica - Notebook](./M1/clase10/Clase_10_asociacion_tablas.html)
- [Explicación y práctica - RMarkdown](./M1/clase10/Clase_10_asociacion_tablas.Rmd)

Pueden descargarse la totalidad de los materiales del repositorio para trabajar en un único archivo .zip
[![](./imgs/Download.png)](./M1/clase10/clase10.zip)



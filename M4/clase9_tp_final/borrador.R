library(tidyverse)
library(word2vec)

embedding <- read.word2vec("../../WordEmbeddings/Word2Vec/sbw_vectors.bin",
                                                     normalize = TRUE)


genero <- tibble(
        masc=c("él", "hombre", "hombres" ,"niño", "niños", "macho", "masculino"),
        fem=c("ella", "mujer", "mujeres", "niña", "niñas", "hembra", "femenino")
)

genero_emb <- predict(embedding, newdata = c(genero$masc, genero$fem), type = "embedding")


masc <- predict(embedding, newdata = genero$masc, type = "embedding") %>%
        colMeans()

fem <- predict(embedding, newdata = genero$fem, type = "embedding") %>%
        colMeans()

masc_fem <- fem-masc

predict(embedding, masc_fem, top_n=100)



clase <- tibble(
        rico=c("rico", "riqueza", "opulento", "opulencia",  "caro"),
        pobre=c("pobre", "pobreza", "miserable", "miseria", "barato")
)

clase_emb <- predict(embedding, c(clase$rico, clase$pobre), "embedding")

rico_emb <- predict(embedding, newdata = clase$rico, type = "embedding") %>%
        colMeans()

pobre_emb <- predict(embedding, newdata = clase$pobre, type = "embedding") %>%
        colMeans()

predict(embedding, c(pobre_emb-rico_emb), top_n=-1)

word2vec_similarity(predict(embedding, "fútbol", "embedding"), c(pobre_emb-rico_emb), type="cosine")
word2vec_similarity(predict(embedding, "boxeo", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "basketball", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "carreras", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "turf", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "rugby", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "polo", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "tenis", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "natación", "embedding"), c(pobre_emb-rico_emb),type="cosine")
word2vec_similarity(predict(embedding, "lacrosse", "embedding"), c(pobre_emb-rico_emb),type="cosine")

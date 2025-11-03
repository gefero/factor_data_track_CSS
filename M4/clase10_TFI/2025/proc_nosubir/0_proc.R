library(tidyverse)


df <- read_csv("./clase10_TFI/2025/data_nosubir/df_final_full.csv") %>%
        drop_na(party_final) %>%
        drop_na(`VOD-START`)

df <- read_csv('./clase10_TFI/2025/data/df_date_filtered_lang_final.csv')


df <- df %>% arrange(`VOD-START`)


df <- df %>%
        mutate(speech_duration = as.numeric(`VOD-END` - `VOD-START`),
               length = nchar(TEXT),
               n_words = str_count(TEXT, "\\S+"))


df <- df %>%
        group_by(`VOD-START`,`VOD-END`) %>%
        mutate(wei_words = n_words / sum(n_words),
               wei_char = length/sum(length)) %>%
        ungroup() %>%
        mutate(speech_duration_wei_char = as.integer(speech_duration * wei_char),
               speech_duration_wei_word = as.integer(speech_duration * wei_words)
               ) %>%
        mutate

df %>%
        group_by(party_final) %>%
        summarise(n=n(),
                  mean_w=mean(speech_duration_wei_word),
                  mean_char=mean(speech_duration_wei_char),
                  sd_w = sd(speech_duration_wei, na.rm=TRUE),
                  mean = mean(speech_duration),
                  sd = sd(speech_duration, na.rm=TRUE),
                  nchar = mean(length)
        )

df %>%
        filter(party_final != "No data") %>%
        ggplot() + 
                geom_density(aes(x=(speech_duration_wei_word), fill=party_final)) + 
                facet_grid(rows=vars(party_final)) +
                theme_minimal()



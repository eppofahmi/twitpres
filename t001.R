library(tidyverse)

# impor data
jokowi <- read_csv("Data/u-eppo q-from jokowi from 2018-09-21 to 2019-10-20.csv")
prabowo <- read_csv("Data/u-eppo q-from prabowo from 2018-09-21 to 2019-10-20.csv")

all_data <- bind_rows(jokowi %>% 
                        mutate(person = "Jokowi"), 
                      prabowo %>% 
                        mutate(person = "Prabowo"))

rm(jokowi, prabowo)

# Filter kolom
all_data1 <- all_data %>% 
  dplyr::select(person, user_name, user_screen_name, 
                created_at, full_text, full_text_norm, entities_user_mentions, entities_hashtags,
                favorite_count, retweet_count, reply_count)

# Simpan clean data
write_csv(all_data1, "Data Clean/data_clean.csv")

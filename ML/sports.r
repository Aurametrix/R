
library(pdftools)
library(tidyverse)
library(tidytext)

url <- "http://stavochka.com/files/Mathletics.pdf"

doc <- pdftools::pdf_text(pdf = url)


doc_df <- doc %>% 
  data.frame() %>% 
  `colnames<-`("page")


data("stop_words")


doc_words <- doc_df %>%
  select(page) %>%
  unnest_tokens(word, page) %>%
  anti_join(stop_words)


sports <- c("soccer","basketball","tennis","baseball","golf","running","volleyball","badminton","swimming","boxing","table tennis","skiing","ice skating","roller skating","cricket","rugby","pool","darts","football","bowling","ice hockey","surfing","karate","horse racing","snowboarding","skateboarding","cycling","archery","fishing","gymnastics","figure skating","rock climbing","sumo wrestling","taekwondo","fencing","water skiing","jet skiing","weight lifting","scuba diving","judo","wind surfing","kickboxing","sky diving","hang gliding","bungee jumping")


doc_words %>% 
  filter(word %in% sports) %>% 
  group_by(word) %>% 
  summarise(n=n()) %>% 
  arrange(desc())


#  word           n
#   <chr>      <int>
# 1 baseball     187
# 2 football     128
# 3 basketball   100
# 4 running       79
# 5 soccer         8
# 6 pool           6
# 7 golf           2
# 8 boxing         1

# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/ggpage")

tinderbox %>% 
  ggpage_build() %>% 
  ggpage_plot()
  
tinderbox %>%
ggpage_build() %>%
mutate(long_word = stringr::str_length(word) > 8) %>%
ggpage_plot(aes(fill = long_word)) +
labs(title = "Longer words throughout The Tinder-box") +
scale_fill_manual(values = c("grey70", "blue"),
                  labels = c("8 or less", "9 or more"),
                  name = "Word length")

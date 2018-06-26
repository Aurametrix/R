mebo_names <- names(mebo_df)[-c(1,2)]
mebo_ssrs <- seq(1900000,length.out=length(mebo_names), by = 1)

mebo_mapfile <- data.frame(Username = mebo_names,
                           Date = as.Date("2018-06-01"),
                           Site = "gut",
                           SSR = mebo_ssrs)

knitr::kable(head(mebo_mapfile))

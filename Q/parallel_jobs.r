num_jobs <- 7
# How big would each job be if perfectly split?
job_size <- sum(chr_sizes$total_size)/7

shuffle_job <- function(i){
  chr_sizes %>%
    sample_frac() %>% 
    mutate(
      cum_size = cumsum(total_size),
      job_num = ceiling(cum_size/job_size)
    ) %>% 
    group_by(job_num) %>% 
    summarise(
      job_chrs = paste(chr, collapse = ','),
      total_job_size = sum(total_size)
    ) %>% 
    mutate(sd = sd(total_job_size)) %>% 
    nest(-sd)
}

shuffle_job(1)

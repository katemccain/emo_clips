library(tidyverse)

parent_dir <- '/home/andrewf/Research_data/EEG/EmoClips'

# emoclips_master <- readxl::read_excel(path = paste0(parent_dir,'/emoclips_mastersheet.xlsx'))

emoclips_master <- read.csv(file = paste0(parent_dir,'/emoclips_mastersheet_upfated_dec_6.csv'))

emoclips_scoring <- readxl::read_excel(path = paste0(parent_dir,'/emoclips_survey.xlsx'),col_names = T,skip = 2)

scoring_totals <- emoclips_scoring[,c(1, (ncol(emoclips_scoring) - 3):ncol(emoclips_scoring))]


names(scoring_totals) <- c("par_id", "STAI_trait_total", "LSAS_total", "BDI_total", "WHODAS_total")

scoring_totals$par_id <- scoring_totals$par_id %>% extract_numeric()

scoring_totals$par_id[1] <- 1

has_both_eeg_files <- c(2:12,14:18,21:24,26:28,30:32,35,36,39,40,42:61)

length(has_both_eeg_files)

has_pupil_run1 <- c(3:18,21:24,26:30,32:36,38:47,59:61)
has_pupil_run2 <- c(4:15,17,18,21,22,24,26,27,28,30,32,33,35,36,38,39,41,42,43,45,59:61)

length(has_pupil_run1)
length(has_pupil_run2)

(has_pupil_run1 %in% has_pupil_run2) %>% 
  sum()

has_ratings <- c(2:6,8:18,21,22,24:26,28,30:36,38:45,47,49:51,53:61)

length(has_ratings)

summary_df <- data.frame(par_id = 1:61)

summary_df <- summary_df %>% 
  mutate(has_eeg = if_else(par_id %in% has_both_eeg_files, T, F),
         has_pupil_run1 = if_else(par_id %in% has_pupil_run1, T, F),
         has_pupil_run2 = if_else(par_id %in% has_pupil_run2, T, F),
         has_ratings =  if_else(par_id %in% has_ratings, T, F)) %>% 
  mutate(has_all = has_eeg & has_pupil_run1 & has_pupil_run2 & has_ratings, 
         .after = par_id)

summary_df$has_all %>% sum()

summary_df_demo <- merge(y = summary_df, x = emoclips_master[,1:7],
      by.y = "par_id", by.x = "ID", all.y = T) %>% 
  mutate(Age = numeric(Age))

summary_df_demo %>% 
  summarise(mean_age = mean(Age, na.rm = T),
            sd_age = sd(Age, na.rm = T))

summary_df_demo %>% 
  count(Sex)

summary_df_demo %>% 
  count(Gender)

summary_df_demo %>% 
  count(Race)

summary_df_demo %>% 
  count(Ethnicity)

summary_df_demo %>% 
  count(Handedness)




summary_df_demo %>%  
  filter(has_eeg) %>% 
  summarise(mean_age = mean(Age, na.rm = T),
            sd_age = sd(Age, na.rm = T))

summary_df_demo %>% 
  filter(has_eeg) %>% 
  count(Sex)

summary_df_demo %>% 
  filter(has_eeg) %>% 
  count(Gender)

summary_df_demo %>% 
  filter(has_eeg) %>% 
  count(Race)

summary_df_demo %>% 
  filter(has_eeg) %>% 
  count(Ethnicity)

summary_df_demo %>% 
  filter(has_eeg) %>% 
  count(Handedness)




summary_df_demo %>%  
  filter(has_all) %>% 
  summarise(mean_age = mean(Age, na.rm = T),
            sd_age = sd(Age, na.rm = T))

summary_df_demo %>%  
  filter(has_all) %>%  
  count(Sex)

summary_df_demo %>%  
  filter(has_all) %>% 
  count(Gender)

summary_df_demo %>% 
  filter(has_all) %>% 
  count(Race)

summary_df_demo %>%  
  filter(has_all) %>% 
  count(Ethnicity)

summary_df_demo %>%  
  filter(has_all) %>% 
  count(Handedness)


library(patchwork)
scoring_plot_df <- merge(x = summary_df_demo, y = scoring_totals,
      by.x = "ID", by.y = "par_id", all.x = T)


((scoring_plot_df %>% 
  filter(has_eeg == T) %>% 
  ggplot() +
  geom_histogram(aes(x = STAI_trait_total), fill = "lightgray", color = "black") +
  theme_classic() +
    theme(text = element_text(size = 25))) + 
(  scoring_plot_df %>% 
  filter(has_eeg == T) %>% 
  ggplot() +
  geom_histogram(aes(x = LSAS_total), fill = "lightgray", color = "black") +
  theme_classic() +
    theme(text = element_text(size = 25)))) /
(  (  scoring_plot_df %>% 
       filter(has_eeg == T) %>% 
       ggplot() +
       geom_histogram(aes(x = BDI_total), fill = "lightgray", color = "black") +
       theme_classic() +
        theme(text = element_text(size = 25))) + 
  (  scoring_plot_df %>% 
       filter(has_eeg == T) %>% 
       ggplot() +
       geom_histogram(aes(x = WHODAS_total), fill = "lightgray", color = "black") +
       theme_classic() +
       theme(text = element_text(size = 25))))


hold <- emoclips_master %>% 
  pivot_longer(cols = starts_with("STAI"))



list.files(pattern = 'rating.*\\.csv$',
           recursive = T,
           path = paste0(parent_dir,'/raw_data'))

list.files(pattern = '.raw$|.RAW$',
           recursive = T,
           path = paste0(parent_dir,'/raw_data'))

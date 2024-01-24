library(tidyverse)
library(patchwork)

# Ratings
rating_file_path <- list.files(path = "/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/ratings",
                               pattern = ".csv",
                               full.names = T)

ratings <- read.csv(rating_file_path, 
                    header = T)

ratings <- ratings %>% 
  filter(order %in% c(0:90)) %>% 
  select(video, 
         valence_id,
         valence_slider.response, 
         arousal_slider.response)


ratings %>% 
  mutate(arousal_slider.response = abs(arousal_slider.response-10)) %>% 
  group_by(valence_id) %>% 
  summarise(mean_val = mean(valence_slider.response),
            se_val = plotrix::std.error(valence_slider.response),
            mean_aro = mean(arousal_slider.response),
            se_aro = plotrix::std.error(arousal_slider.response)) %>%
  ungroup() %>% 
  rename(valence = valence_id) %>%
  mutate(valence = c("Pleasant", "Neutral", "Unpleasant")) %>% 
  data.table::data.table()
  

ratings %>% 
  mutate(valence_id = as.factor(valence_id)) %>% 
  ggplot(aes(x = valence_slider.response, 
             y = abs(arousal_slider.response-10),
             color = valence_id)) +
  geom_point() +
  # geom_text(aes(label = video)) +
  coord_cartesian(xlim = c(1,9), ylim = c(1,9)) +
  scale_x_continuous(breaks = c(1:9),name = "Valence") +
  scale_y_continuous(breaks = c(1:9), name = "Arousal") +
  scale_color_manual(values = c("blue","green","red"),
                     labels = c("pleasant", "neutral", "unpleasant")) +
  theme_classic()


# Pupil

log_run1_path <- list.files(path = "/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/logs/run_1",
                            pattern = ".csv",
                            full.names = T)

log_run2_path <- list.files(path = "/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/logs/run_2",
                            pattern = ".csv",
                            full.names = T)

log_run1 <- read.csv(log_run1_path,
                     header = T)

log_run2 <- read.csv(log_run2_path,
                     header = T)

valence_presentation_order_run1 <- log_run1 %>% 
  filter(order %in% c(0:90)) %>% 
  pull(valence_id)

valence_presentation_order_run2 <- log_run2 %>% 
  filter(order %in% c(0:90)) %>% 
  pull(valence_id)


pupil_run1_path <- list.files(path = "/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_1",
                            pattern = ".csv",
                            full.names = T)

pupil_run2_path <- list.files(path = "/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_2",
                            pattern = ".csv",
                            full.names = T)

pupil_diameter_trials_run1 <- read.csv(pupil_run1_path, header = F)
pupil_diameter_trials_run2 <- read.csv(pupil_run2_path, header = F)

baseline_values_run1 <- pupil_diameter_trials_run1 %>%
  select(V500:V1000) %>% 
  rowMeans()
baseline_values_run2 <- pupil_diameter_trials_run2 %>%
  select(V500:V1000) %>% 
  rowMeans()

pupil_diameter_trials_run1 <- pupil_diameter_trials_run1 - baseline_values_run1
pupil_diameter_trials_run2 <- pupil_diameter_trials_run2 - baseline_values_run2

pupil_diameter_trials_run1 <- pupil_diameter_trials_run1 %>% 
  add_column(.before = 1, valence_presentation_order_run1)

pupil_diameter_trials_run2 <- pupil_diameter_trials_run2 %>% 
  add_column(.before = 1, valence_presentation_order_run2)


pupil_by_valence_run1 <- pupil_diameter_trials_run1 %>% 
  group_by(valence_presentation_order_run1) %>% 
  summarise_all(mean) %>%
  ungroup() %>% 
  pivot_longer(., cols = 2:length(.),) %>% 
  mutate(time_ms = as.numeric(unlist(
    stringr::str_extract_all(name, "\\d+"))) - 1001) %>% 
  rename(valence = valence_presentation_order_run1) %>% 
  mutate(valence = case_when(valence == 1 ~ "Pleasant",
                             valence == 2 ~ "Neutral",
                             valence == 3 ~ "Unpleasant")) %>% 
  mutate(valence = factor(valence,
                          levels = c("Pleasant",
                                     "Neutral",
                                     "Unpleasant")))

pupil_by_valence_run2 <- pupil_diameter_trials_run2 %>% 
  group_by(valence_presentation_order_run2) %>% 
  summarise_all(mean) %>%
  ungroup() %>% 
  pivot_longer(., cols = 2:length(.),) %>% 
  mutate(time_ms = as.numeric(unlist(
    stringr::str_extract_all(name, "\\d+"))) - 1001) %>% 
  rename(valence = valence_presentation_order_run2) %>% 
  mutate(valence = case_when(valence == 1 ~ "Pleasant",
                             valence == 2 ~ "Neutral",
                             valence == 3 ~ "Unpleasant")) %>% 
  mutate(valence = factor(valence,
                          levels = c("Pleasant",
                                     "Neutral",
                                     "Unpleasant")))

(pupil_by_valence_run1 %>% 
  ggplot()+
  geom_line(aes(x = time_ms, 
                y = value,
                color = valence),
            size = 2) +
  scale_color_manual(values = c("blue", "green", "red")) +
  ggtitle("Run 1 Pupil Diameter") +
  theme_classic() +
  theme(text = element_text(size = 20))) +

(pupil_by_valence_run2 %>% 
  ggplot()+
  geom_line(aes(x = time_ms, 
                y = value,
                color = valence),
            size = 2) +
  scale_color_manual(values = c("blue", "green", "red")) +
  ggtitle("Run 2 Pupil Diameter") +
   scale_y_continuous(name = element_blank())+
  theme_classic() +
   theme(text = element_text(size = 20))) +
  patchwork::plot_layout(guides = 'collect')

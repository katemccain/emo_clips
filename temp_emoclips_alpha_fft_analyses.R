library(tidyverse)

video_key <- read.csv("/home/andrewf/Research_data/EEG/EmoClips/misc/video_key.csv")



valence_ar_dir <- "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_valence_ar"

video_ar_dir <- "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_video_ar"

by_video_all_chans_samples <- 
  EMEGShelper::read_ar_files(data_folders = video_ar_dir,
                             # patterns = "002",
                             patterns = "emo111",
                             include_channel_name = T,
                             include_file_name = T)

by_video_all_chans_samples <- by_video_all_chans_samples %>% 
  mutate(.after = "file_name",
         raw_par_id = as.numeric(sub(pattern = ".*?(\\d+).*", 
                      replacement = "\\1", 
                      x = file_name))) %>% 
  mutate(.after = "file_name",
         block = if_else(raw_par_id < 100, 1, 2),
         par_id = if_else(raw_par_id < 100, raw_par_id, raw_par_id -100),
         video_id = as.numeric(sub(pattern = ".*at(\\d+)\\.ar.*", 
                        replacement = "\\1",
                        x = file_name))) %>% 
  merge(x = video_key, y = ., by.x = "video_id", by.y = "video_id", all.y = T)


time_key <- data.frame(sample_point_name = paste0("V",c(1:12001)),
                       time_msec = rep(-2000,12001) + seq(0, 12000, by = 1))

by_video_all_chans_samples_long <- by_video_all_chans_samples %>% 
  pivot_longer(cols = 9:ncol(by_video_all_chans_samples))

##
get_fft_df <- function(eegdata, 
                   start_time_ms, 
                   end_time_ms,
                   channel_number,
                   video_id_number,
                   sample_rate = 1000) {

start_label <- time_key[time_key$time_msec == start_time_ms,
                        "sample_point_name"]

stop_label <- time_key[time_key$time_msec == end_time_ms,
                       "sample_point_name"]

chosen_labels <- time_key[time_key$time_msec <= end_time_ms &
                            time_key$time_msec >= start_time_ms,
                          "sample_point_name"]

nyquist_freq <- sample_rate / 2

number_of_samples <- length(chosen_labels)

length_data_seconds <- number_of_samples/sample_rate

frequency_axis <- seq(0, nyquist_freq, by = 1/length_data_seconds)


eeg_fft <- eegdata %>% 
  filter(video_id == video_id_number, 
         channel_names == channel_number) %>% 
  select(all_of(chosen_labels)) %>% 
  unlist(use.names = F) %>% 
  fft() %>%
  abs()
eeg_fft <- eeg_fft / number_of_samples
eeg_fft <- eeg_fft[1:((length(eeg_fft)/2) + 1)]

return(data.frame(frequency_axis, eeg_fft))
}

chosen_video_id <- 86
chosen_channel_id <- 137 # OZ
# chosen_channel_id <- 101 # PZ

eeg_fft_df_vid_baseline <- get_fft_df(by_video_all_chans_samples,
                                       start_time_ms = -2000,
                                       end_time_ms = 0,
                                       video_id_number = chosen_video_id,
                                       channel_number = chosen_channel_id)

eeg_fft_df_vid <- get_fft_df(by_video_all_chans_samples,
                              start_time_ms = 1000,
                              end_time_ms = 9000,
                              video_id_number = chosen_video_id,
                              channel_number = chosen_channel_id)

eeg_fft_df_vid_all <- get_fft_df(by_video_all_chans_samples,
                                  start_time_ms = -2000,
                                  end_time_ms = 12000,
                                  video_id_number = chosen_video_id,
                                  channel_number = chosen_channel_id)


# ggplot() +
#   geom_line(data = eeg_fft_df_vid_baseline,
#             aes(x = frequency_axis, y = eeg_fft)) +
#   geom_line(data = eeg_fft_df_vid, 
#             aes(x = frequency_axis, y = eeg_fft),
#             color = "blue") +
#   # geom_line(data = eeg_fft_df_vid_all, 
#   #           aes(x = frequency_axis, y = eeg_fft),
#   #           color = "green") +
#   coord_cartesian(xlim = c(0,30))+
#   labs(title = "Amplitude Spectrum of EEG Data",
#        x = "Frequency (Hz)",
#        y = "Amplitude") +
#   theme_minimal()

by_video_all_chans_samples_long %>% 
  filter(video_id == chosen_video_id,
         channel_names == chosen_channel_id) %>% 
  merge(x = ., y = time_key, 
        by.x = "name", by.y = "sample_point_name",all.x = T) %>% 
  ggplot() +
  geom_vline(xintercept = 0) +
  geom_line(aes(x =time_msec, y = value)) +
  scale_x_continuous(expand = c(0,0)) +
  # coord_cartesian(xlim = c(-2000,0)) +
  theme_minimal()

video_ids_to_average <- c(1:90)

available_videos <- by_video_all_chans_samples %>% 
  pull(video_id) %>% 
  unique()

all_eeg_fft_df_vid <- data.frame(video_id = numeric(),
                                 frequency_axis = numeric(),
                                 eeg_fft = numeric())

all_eeg_fft_df_baseline <- data.frame(video_id = numeric(),
                                      frequency_axis = numeric(),
                                      eeg_fft = numeric())



for (i in 1:length(video_ids_to_average)) {
  
  current_video_id <- video_ids_to_average[i]
  
  if (current_video_id %in% available_videos) {
    
    time_to_add <- 0
    for (j in 1:4) {



      current_eeg_fft_df_vid <- get_fft_df(by_video_all_chans_samples,
                                           start_time_ms = 1000 + time_to_add,
                                           end_time_ms = 3000 + time_to_add,
                                           video_id_number = current_video_id,
                                           channel_number = chosen_channel_id)

      current_eeg_fft_df_vid <- current_eeg_fft_df_vid %>%
        mutate(video_id = i)

      all_eeg_fft_df_vid <- rbind.data.frame(all_eeg_fft_df_vid,
                                             current_eeg_fft_df_vid)
      time_to_add <- time_to_add + 2000
    }
    # 
    # current_eeg_fft_df_vid <- get_fft_df(by_video_all_chans_samples,
    #                                      start_time_ms = 1000 + time_to_add,
    #                                      end_time_ms = 9000 + time_to_add,
    #                                      video_id_number = current_video_id,
    #                                      channel_number = chosen_channel_id)
    
    current_eeg_fft_df_vid <- current_eeg_fft_df_vid %>% 
      mutate(video_id = i)
    
    all_eeg_fft_df_vid <- rbind.data.frame(all_eeg_fft_df_vid, 
                                           current_eeg_fft_df_vid)
    current_eeg_fft_df_baseline <- get_fft_df(by_video_all_chans_samples,
                                              start_time_ms = -2000,
                                              end_time_ms = 0,
                                              video_id_number = current_video_id,
                                              channel_number = chosen_channel_id)
    
    current_eeg_fft_df_baseline <- current_eeg_fft_df_baseline %>% 
      mutate(video_id = i)
    
    all_eeg_fft_df_baseline <- rbind.data.frame(all_eeg_fft_df_baseline, 
                                                current_eeg_fft_df_baseline)
    
    
  }
}

all_avg_eeg_fft_df_vid <- all_eeg_fft_df_vid %>% 
  select(-video_id) %>% 
  group_by(frequency_axis) %>% 
  summarise_all(mean)

all_avg_eeg_fft_df_baseline <- all_eeg_fft_df_baseline %>% 
  select(-video_id) %>% 
  group_by(frequency_axis) %>% 
  summarise_all(mean)



ggplot() +
  geom_line(data = all_avg_eeg_fft_df_baseline,
            aes(x = frequency_axis, y = eeg_fft)) +
  geom_line(data = all_avg_eeg_fft_df_vid, 
            aes(x = frequency_axis, y = eeg_fft),
            color = "blue") +
  # geom_line(data = all_avg_eeg_fft_df,
  #           aes(x = frequency_axis, y = eeg_fft),
  #           color = "green") +
  coord_cartesian(xlim = c(0,30))+
  labs(title = "Amplitude Spectrum of EEG Data",
       x = "Frequency (Hz)",
       y = "Amplitude") +
  theme_minimal()


library(tidyverse)

where_ratings_are <- "/home/andrewf/Research_data/EEG/EmoClips/logs_ratings"

csv_paths <- list.files(path = where_ratings_are, 
                        pattern = ".csv$",
                        full.names = T)

csv_ratings_paths <- csv_paths[grepl(pattern = "alpha_ratings",
                                     x = csv_paths)]


for (participant_index in 1:length(csv_ratings_paths)) {
  current_ratings <- read.csv(file = csv_ratings_paths[participant_index])
  
  if(!exists("ratings")){
    ratings <- current_ratings
    
    #Figure out how to get subject id from path name
    current_ratings %>% 
      mutate("sub_id" = csv_ratings_paths[participant_index])
    
  } else {
    ratings <- rbind(ratings, current_ratings)
  }
  
}



first_ratings <- read.csv(file = csv_ratings_paths[1])

first_ratings %>% 
  select(arousal_slider.response, valence_slider.response)

data_we_like <- first_ratings %>% 
  select(arousal_slider.response, valence_slider.response)

write.csv(data_we_like, "data_we_like.csv")

## if we wanted to make some figures this runs but they're pretty ugly

arousal_plot <- barplot(data_we_like[,1], beside = TRUE, horiz = FALSE, col = "tomato", border = "blue", main = "Arousal_Ratings_per_stimulus", xlab = "stimulus", ylab = "rating")

valence_plot <- barplot(data_we_like[,2], beside = TRUE, horiz = FALSE, col = "tomato", border = "blue", main = "Valence_Ratings_per_stimulus", xlab = "stimulus", ylab = "rating")

## Adding the data to a mastersheet/grand, we will have to play around with this depending on formatting of mastersheet

Mastersheet <- read.csv("fake_mastersheet_file_for_now", header = TRUE)

combined_data <- rbind(Mastersheet, data_we_like)

write.csv(combined_data, "updated_mastersheet", row.names = TRUE)
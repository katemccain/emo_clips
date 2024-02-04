library(tidyverse)
library(magick)
library(EMEGShelper)

# Magick is used here, but using python with moviepy functions 
#is probably better in most cases, particularly if editing the videos


# example using one video to get the luminance and movement
video_directory <- "/home/andrewf/Documents/UGA_misc/scene_sets/Adjusted_vids_no_scramble"


videos <- list.files(video_directory,
                     pattern = ".mp4",
                     full.names = T)

first_video <- magick::image_read_video(videos[1],
                                fps = 24)



first_video_grayscale <- magick::image_quantize(first_video, 
                                        colorspace = "Gray")

video_info <- first_video_grayscale[1] %>% 
  magick::image_info()

first_video_frame <- first_video_grayscale[[1]] %>% 
  as.integer() %>%
  matrix(ncol = video_info$width, 
         nrow = video_info$height)

# first_video_frame_color <- array(
#   as.integer(first_video[[1]]),
#   dim = c(video_info$height, video_info$width, 3)
# )

second_video_frame <- first_video_grayscale[[2]] %>% 
  as.integer() %>%
  matrix(ncol = video_info$width, 
         nrow = video_info$height)

# look at frames
first_video[1]
first_video[2]


# brightness / luminance here is the average brightness of the gray pixels

brightness_first_frame <- mean(first_video_frame)
brightness_second_frame <- mean(second_video_frame)

brightness_first_frame
brightness_second_frame


# movement is found by looking at the difference between frames.
# if a pixel changed brightness, that counts as movement.
# the movement is the average of pixel changes between each frame.
# below is an example

difference_between_frames_values <- abs(second_video_frame - first_video_frame) %>% 
  array(c(video_info$height, video_info$width, 1))

# convert integers to gray scale pixels which are coded from 0 to 255
difference_between_frames_image <- magick::image_read(difference_between_frames_values / 255)

# LETS LOOK! first is a little movie of the first two frames, notice what changes
first_video[1:2]

# Now lets look at which pixels changed brightness the most, brighter pixels
# are the ones that changed the most
difference_between_frames_image

# The absolute value of this difference frame is what I call movement
mean(difference_between_frames_values)

# Now just loop through all frames to get the average brightness, movement, 
# and RGB for each video for each video

video_average_brightness <- c()
video_average_movement <- c()

video_average_red <- c()
video_average_green <- c()
video_average_blue <- c()

for (video_index in 1:length(videos)) {
  current_video_color <- magick::image_read_video(videos[video_index],
                                            fps = 24) 
  current_video_gray <- magick::image_quantize(current_video_color,
                                               colorspace = "Gray")
  
  video_info <- current_video_gray[1] %>% 
    magick::image_info()
  
  frame_brightness_values <- c()
  movement_values <- c()
  
  frame_red_values <- c()
  frame_green_values <- c()
  frame_blue_values <- c()
  
  for (video_frame_index in 1:length(current_video_gray)) {
    
    if(video_frame_index != 1) {
      last_frame_color <- current_frame_color
      last_frame_gray <- current_frame_gray
    }
    
    current_frame_color <- array(
      as.integer(current_video_color[[video_frame_index]]),
      dim = c(video_info$height, video_info$width, 3)
    )
    
    
    
    current_frame_gray <- current_video_gray[[video_frame_index]] %>% 
      as.integer() %>%
      matrix(ncol = video_info$width, 
             nrow = video_info$height)
    
    
    frame_brightness_values <- c(frame_brightness_values,
                                 mean(current_frame_gray))
    
    frame_red_values <- c(frame_red_values,
                          mean(current_frame_color[,,1]))
    frame_green_values <- c(frame_green_values,
                            mean(current_frame_color[,,2]))
    frame_blue_values <- c(frame_blue_values,
                           mean(current_frame_color[,,3]))
    
    if(video_frame_index != 1) {
      difference_between_frames_values <- 
        abs(current_frame_gray - last_frame_gray) %>% 
        array(c(video_info$height, video_info$width, 1))
      
      movement_values <- c(movement_values,
                           mean(difference_between_frames_values))
    }
  }
  video_average_brightness <- c(video_average_brightness,
                                mean(frame_brightness_values))
  
  video_average_movement <- c(video_average_movement,
                              mean(movement_values))
  
  video_average_red <- c(video_average_red,
                         mean(frame_red_values))
  video_average_green <- c(video_average_green,
                           mean(frame_green_values))
  video_average_blue <- c(video_average_blue,
                          mean(frame_blue_values))
}


# Looking at lum and momvement values ####
library(tidyverse)

load("/home/andrewf/Research_data/EEG/video_alpha_UF/video_brightness_movement_values.RData")

video_average_lum_movement <- data.frame(video_name = list.files(video_directory,
                                                                 pattern = ".mp4"),
                                         video_average_movement,
                                         video_average_brightness,
                                         video_average_red,
                                         video_average_green,
                                         video_average_blue)


video_key <- read.csv("/home/andrewf/Research_data/EEG/Pic_Vid/misc/video_key.csv")

video_average_lum_movement <- video_average_lum_movement %>% 
  mutate(video_name = gsub(x = video_name,
                           pattern = ".mp4",
                           replacement = "")) %>% 
  merge(y = ., x = video_key,
        by.y = "video_name", by.x = "video")


video_average_lum_movement %>% 
  group_by(cat_id) %>% 
  summarise(avg_lum = mean(video_average_brightness),
            sd_lum = sd(video_average_brightness))

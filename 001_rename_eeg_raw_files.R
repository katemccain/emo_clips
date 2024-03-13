# Put your data folder path here
andrew_data_directory <- "/home/andrewf/Research_data/EEG/EmoClips/eeg"

if (dir.exists(andrew_data_directory)) {
  data_directory <- andrew_data_directory
# If you add your data directory path above, uncomment the following
# lines and put your path variable
# } else if(dir.exists(andrew_data_folder)) {
  # data_directory <- 
} else {
  stop("Something is wrong, are you working on the right computer with access to the data")
}

lower_case_raw_files <- list.files(path = data_directory,
                                   pattern = "raw$",
                                   recursive = T,
                                   full.names = T)

new_upper_case_names <- gsub(pattern = "raw$", 
                             replacement = "RAW",
                             x = lower_case_raw_files)

file.rename(from = lower_case_raw_files, 
            to = new_upper_case_names)

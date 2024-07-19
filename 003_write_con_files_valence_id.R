if (dir.exists("/home/andrewf/Research_data/EEG/EmoClips/raw_data")) {
  
  data_directory <-  "/home/andrewf/Research_data/EEG/EmoClips/raw_data"
  
} else if (dir.exists("/Users/katemccain/Documents/video_alpha/raw_data")) {
  
  data_directory <- "/Users/katemccain/Documents/video_alpha/raw_data"
  
} else {
  stop("No known data directories are on this computer, add yours with another if else statement.")
}

participant_directories <- list.dirs(data_directory,
                                     recursive = F)

for (directory_index in 1:length(participant_directories)) {
  
  current_eeg_log_filepath <- list.files(
    paste0(participant_directories[directory_index],"/",
           "eeg_log"), 
    pattern = ".*video_alpha_5.*\\.csv$",
    recursive = F, 
    full.names = T)
  
  if(length(current_eeg_log_filepath) == 1){
    
    current_eeg_log_file <- read.csv(current_eeg_log_filepath)
    
    current_valence_presentation_order <- 
      current_eeg_log_file$valence_id[
        !is.na(current_eeg_log_file$valence_id)]
  }
  
  current_run1_con_path <- list.files(
    path = paste0(participant_directories[directory_index],"/",
                  "EEG/run1"),
    pattern = ".CON$|.con$", 
    full.names = T)
  
  if(length(current_run1_con_path) > 1){
    print("assuming the newest con file has the correct name")
    
    con_files_information <- file.info(current_run1_con_path)
    
    current_run1_con_path <- current_run1_con_path[
      which.max(con_files_information$ctime)]
  }
  
  current_run2_con_path <- list.files(
    path = paste0(participant_directories[directory_index],"/",
                  "EEG/run2"),
    pattern = ".CON$|.con$", 
    full.names = T)
  
  if(length(current_run2_con_path) > 1){
    print("assuming the newest con file has the correct name")
    
    con_files_information <- file.info(current_run2_con_path)
    
    current_run2_con_path <- current_run2_con_path[
      which.max(con_files_information$ctime)]
  }
  
  if( (length(current_eeg_log_filepath) == 1) & 
      (length(current_run1_con_path) == 1) ) {
    
    current_con_file_to_write <- paste0(gsub(x = current_run1_con_path,
                                             pattern = ".CON$|.con$",
                                             replacement = ""),".con")
    
    readr::write_delim(rbind.data.frame(c(90,1, rep(NA, 88)),
                                        current_valence_presentation_order[1:90]),
                       current_con_file_to_write, 
                       delim = "\t",col_names = F, na = "")
  }
  
  if( (length(current_eeg_log_filepath) == 1) & 
      (length(current_run2_con_path) == 1) ) {
    
    current_con_file_to_write <- paste0(gsub(x = current_run2_con_path,
                                             pattern = ".CON$|.con$",
                                             replacement = ""),".con")
    
    readr::write_delim(rbind.data.frame(c(90,1, rep(NA, 88)),
                                        current_valence_presentation_order[91:180]),
                       current_con_file_to_write, 
                       delim = "\t",col_names = F, na = "")
  }
}


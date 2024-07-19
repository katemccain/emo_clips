# Put your data folder path here
andrew_data_directory <- "/home/andrewf/Research_data/EEG/EmoClips/raw_data"
andrew_batch_file_directory <- "/home/andrewf/Research_data/EEG/EmoClips/batch_files"

if (dir.exists(andrew_data_directory)) {
  data_directory <- andrew_data_directory
# If you add your data directory path above, uncomment the following
# lines and put your path variable
# } else if(dir.exists(andrew_data_folder)) {
  # data_directory <- 
} else {
  stop("Something is wrong, are you working on the right computer with access to the data")
}

unusable_participants <- c(19, 27)

for (i in 1:length(unusable_participants)) {
  if (nchar(unusable_participants[i]) != 2) {
    stop("unusable_participants needs to have nchar equal to 2, for example 05")
  }
}

exclude_regex <- paste(paste0("/emo", "0", unusable_participants),
                   "|", paste0("/emo", "1", unusable_participants),
                   "|", paste0("/", "0", unusable_participants),
                   "|", paste0("/", "1", unusable_participants),
                   sep = "")
                   
                   

RAW_file_paths <- list.files(path = data_directory,
                             pattern = ".RAW$",
                             recursive = T,
                             full.names = T)

write(x = RAW_file_paths[!grepl(pattern = exclude_regex,RAW_file_paths)],
      file = paste0(andrew_batch_file_directory, "/RAW_files.txt"))





AEMAR_file_paths <- list.files(path = data_directory,
                               pattern = "AEM.AR$",
                               recursive = T,
                               full.names = T)

write(x = AEMAR_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/AEMAR_files.txt"))

E1_file_paths <- list.files(path = data_directory,
                               pattern = "E1$",
                               recursive = T,
                               full.names = T)

write(x = E1_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/E1_files.txt"))

est257_file_paths <- list.files(path = data_directory,
                               pattern = "257est$",
                               recursive = T,
                               full.names = T)

write(x = est257_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/est257_files.txt"))

est256_file_paths <- list.files(path = data_directory,
                               pattern = "256est$",
                               recursive = T,
                               full.names = T)

write(x = est256_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/est256_files.txt"))



ar1_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_valence_ar",
                             pattern = "1.ar$",
                             recursive = T,
                             full.names = T)
# run1_ar1_file_paths <- ar1_file_paths[grepl("run1",ar1_file_paths)]
# run2_ar1_file_paths <- ar1_file_paths[grepl("run2",ar1_file_paths)]


ar2_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_valence_ar",
                                pattern = "2.ar$",
                                recursive = T,
                                full.names = T)
# run1_ar2_file_paths <- ar2_file_paths[grepl("run1",ar2_file_paths)]
# run2_ar2_file_paths <- ar2_file_paths[grepl("run2",ar2_file_paths)]

ar3_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_valence_ar",
                                pattern = "3.ar$",
                                recursive = T,
                                full.names = T)
# run1_ar3_file_paths <- ar3_file_paths[grepl("run1",ar3_file_paths)]
# run2_ar3_file_paths <- ar3_file_paths[grepl("run2",ar3_file_paths)]

# ar_file_paths <- c(run1_ar1_file_paths,
#                    run2_ar1_file_paths, 
#                    run1_ar2_file_paths,
#                    run2_ar2_file_paths,
#                    run1_ar3_file_paths,
#                    run2_ar3_file_paths)

ar_file_paths <- c(ar1_file_paths,
                   ar2_file_paths,
                   ar3_file_paths)

write(x = ar_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/valence_ar_files.txt"))

app1_file_paths <- list.files(path = data_directory,
                             pattern = "app1$",
                             recursive = T,
                             full.names = T)
run1_app1_file_paths <- app1_file_paths[grepl("run1",app1_file_paths)]
run2_app1_file_paths <- app1_file_paths[grepl("run2",app1_file_paths)]


app2_file_paths <- list.files(path = data_directory,
                                pattern = "app2$",
                                recursive = T,
                                full.names = T)
run1_app2_file_paths <- app2_file_paths[grepl("run1",app2_file_paths)]
run2_app2_file_paths <- app2_file_paths[grepl("run2",app2_file_paths)]

app3_file_paths <- list.files(path = data_directory,
                                pattern = "app3$",
                                recursive = T,
                                full.names = T)
run1_app3_file_paths <- app3_file_paths[grepl("run1",app3_file_paths)]
run2_app3_file_paths <- app3_file_paths[grepl("run2",app3_file_paths)]

app_file_paths <- c(run1_app1_file_paths,
                   run2_app1_file_paths, 
                   run1_app2_file_paths,
                   run2_app2_file_paths,
                   run1_app3_file_paths,
                   run2_app3_file_paths)

write(x = app_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/valence_app_files.txt"))

app1_ar_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/wapower_8_13hz_1000_9000ms",
                                 pattern = "app1.ar", full.names = T)
app2_ar_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/wapower_8_13hz_1000_9000ms",
                                 pattern = "app2.ar", full.names = T)
app3_ar_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/wapower_8_13hz_1000_9000ms",
                                 pattern = "app3.ar", full.names = T)
app_ar_file_paths <- c(app1_ar_file_paths, app2_ar_file_paths, app3_ar_file_paths)

write(x = app_ar_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/valence_app_files_average_alpha.txt"))


ar_file_paths <- list.files(path = "/home/andrewf/Research_data/EEG/EmoClips/misc/temp_valence_ar",
           full.names = T)

write(x = ar_file_paths,
      file = paste0(andrew_batch_file_directory,
                    "/valence_ar_files.txt"))

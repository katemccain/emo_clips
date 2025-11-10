# log_filepath <- list.files(
#   # "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-001/log/",
#   pattern = ".csv$",
#   full.names = T
# )

log_filepath <- "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/logfiles/emoclips_PD_002_1_emoclips_eeg_fmri_pilot_2025-10-29_09h22.49.608.csv"
log_file <- read.delim(file = log_filepath, header = T, sep = ",")


time_first_tr_sec <- log_file$first_fixation.stopped[
  !is.na(log_file$first_fixation.stopped)
]

valence_ids <- log_file$valence_id[!is.na(log_file$valence_id)]

video_start_times <- log_file$video.started[!is.na(log_file$video.started)] -
  time_first_tr_sec

pleasant_video_start_times <- video_start_times[valence_ids == 1]

neutral_video_start_times <- video_start_times[valence_ids == 2]

unpleasant_video_start_times <- video_start_times[valence_ids == 3]


write(
  x = video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/video_start_times.1D",
  ncolumns = 1
)

write(
  x = pleasant_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/pleasant_video_start_times.1D",
  ncolumns = 1
)

write(
  x = neutral_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/neutral_video_start_times.1D",
  ncolumns = 1
)

write(
  x = unpleasant_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/unpleasant_video_start_times.1D",
  ncolumns = 1
)

log_filepath <- "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/logfiles/emoclips_PD_002_2_emoclips_eeg_fmri_pilot_2025-10-29_10h10.51.221.csv"
log_file <- read.delim(file = log_filepath, header = T, sep = ",")


time_first_tr_sec <- log_file$first_fixation.stopped[
  !is.na(log_file$first_fixation.stopped)
]

valence_ids <- log_file$valence_id[!is.na(log_file$valence_id)]

video_start_times <- log_file$video.started[!is.na(log_file$video.started)] -
  time_first_tr_sec

pleasant_video_start_times <- video_start_times[valence_ids == 1]

neutral_video_start_times <- video_start_times[valence_ids == 2]

unpleasant_video_start_times <- video_start_times[valence_ids == 3]


write(
  x = video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/video_start_times_2.1D",
  ncolumns = 1
)

write(
  x = pleasant_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/pleasant_video_start_times_2.1D",
  ncolumns = 1
)

write(
  x = neutral_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/neutral_video_start_times_2.1D",
  ncolumns = 1
)

write(
  x = unpleasant_video_start_times,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-002/unpleasant_video_start_times_2.1D",
  ncolumns = 1
)

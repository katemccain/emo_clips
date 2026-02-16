library(tidyverse)

roi_emo001 <- read.table(
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/ROI_mean_emo001.1D"
)
roi_emo002 <- read.table(
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/ROI_mean_emo002.1D"
)
roi_emo003 <- read.table(
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/ROI_mean_emo003.1D"
)
roi_emo004 <- read.table(
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/ROI_mean_emo004.1D"
)
roi_emo005 <- read.table(
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/ROI_mean_emo005.1D"
)

stats_emo001 <- readxl::read_excel(
  path = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/tempemo001roi_stats.xlsx"
)
stats_emo002 <- readxl::read_excel(
  path = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/tempemo002roi_stats.xlsx"
)
stats_emo003 <- readxl::read_excel(
  path = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/tempemo003roi_stats.xlsx"
)
stats_emo004 <- readxl::read_excel(
  path = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/tempemo004roi_stats.xlsx"
)
stats_emo005 <- readxl::read_excel(
  path = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/tempemo005roi_stats.xlsx"
)

stats_emo001 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  filter(area == "MT + _Complex") %>% # 18 Area_FST_L;198 Area_FST_R, 24 Area_PH_L;204 Area_PH_R,  out for now 22 Medial_Superior_Temporal_Area_L; 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L;
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% # none
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo002 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo003 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo004 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo005 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo001 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo002 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R;
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo003 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo004 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo004 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo005 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,
  # filter(area == "Medial_Temporal") %>% # none
  filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)


stats_emo001 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  filter(area == "TPO") %>% #  99 Area_TemporoParietoOccipital_Junction_2_L
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo002 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  filter(area == "TPO") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo003 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  filter(area == "TPO") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo004 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  filter(area == "TPO") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

stats_emo005 %>%
  # filter(area == "Ventral_Stream_Visual") %>% # none
  # filter(area == "MT + _Complex") %>% # 18 Area_FST_L ,  24 Area_PH_L, 19 Area_Lateral_Occipital_1_L, 20 Area_Lateral_Occipital_2_L, 21 Area_Lateral_Occipital_3_L
  # filter(area == "Medial_Temporal") %>% # none
  # filter(area == "Lateral_Temporal") %>% #  88 Area_PHT_L 268 Area_PHT_R
  filter(area == "TPO") %>% #
  # filter(area == "Early_Auditory") %>%
  # filter(area == "Auditory_Association") %>%
  # filter(region_id %in% c(11,12,13)) %>%
  select(region_id, region_name, `EmoVsNeut Coef`, EmoVsNeut_t, voxels)

lateral_occipital_ROIs <- stats_emo002 %>%
  mutate(region_id = as.integer(region_id)) %>%
  filter(region_id %in% c(18, 198, 24, 204, 88, 268))

lat_occ_total_voxel <- lateral_occipital_ROIs %>%
  mutate(percent_total_voxels = voxels / sum(voxels))

# lateral_occipital_emo001 <- rowMeans(roi_emo001[, c(18:26, 198:206)])
# lateral_occipital_emo001 <- rowMeans(roi_emo001[, c(18:26)])
# lateral_occipital_emo001 <- rowMeans(roi_emo001[, c(18, 198, 24, 204, 88, 268)])
lateral_occipital_emo001 <- as.matrix(roi_emo001[, c(
  18,
  198,
  24,
  204,
  88,
  268
)]) %*%
  lat_occ_total_voxel$percent_total_voxels

lateral_occipital_emo002 <- as.matrix(roi_emo002[, c(
  18,
  198,
  24,
  204,
  88,
  268
)]) %*%
  lat_occ_total_voxel$percent_total_voxels

lateral_occipital_emo003 <- as.matrix(roi_emo003[, c(
  18,
  198,
  24,
  204,
  88,
  268
)]) %*%
  lat_occ_total_voxel$percent_total_voxels

lateral_occipital_emo004 <- as.matrix(roi_emo004[, c(
  18,
  198,
  24,
  204,
  88,
  268
)]) %*%
  lat_occ_total_voxel$percent_total_voxels


lateral_occipital_emo005 <- as.matrix(roi_emo005[, c(
  18,
  198,
  24,
  204,
  88,
  268
)]) %*%
  lat_occ_total_voxel$percent_total_voxels


write.table(
  t(lateral_occipital_emo001),
  row.names = F,
  col.names = F,
  quote = F,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/lateral_occipital_emo001.1D"
)
write.table(
  t(lateral_occipital_emo002),
  row.names = F,
  col.names = F,
  quote = F,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/lateral_occipital_emo002.1D"
)
write.table(
  t(lateral_occipital_emo003),
  row.names = F,
  col.names = F,
  quote = F,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/lateral_occipital_emo003.1D"
)
write.table(
  t(lateral_occipital_emo004),
  row.names = F,
  col.names = F,
  quote = F,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/lateral_occipital_emo004.1D"
)

write.table(
  t(lateral_occipital_emo005),
  row.names = F,
  col.names = F,
  quote = F,
  file = "/home/andrewfarkas/Research_data/multimodal/emoclips/processed/lateral_occipital_emo005.1D"
)

lat_occ_reml_stats <- data.frame(
  names = c(
    "Full_f",
    "Pleasant_Coef",
    "Pleasant_t",
    "Pleasant_f",
    "Neutral_Coef",
    "Neutral_t",
    "Neutral_f",
    "Unpleasant_Coef",
    "Unpleasant_t",
    "Unpleasant_f",
    "EmoVsNeut_Coef",
    "EmoVsNeut_t",
    "EmoVsNeut_f",
    "PlsVsNeut_Coef",
    "PlsVsNeut_t",
    "PlsVsNeut_f",
    "UnplsVsNeut_Coef",
    "UnplsVsNeut_t",
    "UnplsVsNeut_f"
  ),
  emo001_values = c(
    6.62013,
    0.17835,
    2.63115,
    6.92295,
    0.0215515,
    0.317276,
    0.100664,
    0.260963,
    3.83681,
    14.7211,
    0.198105,
    2.52579,
    6.37961,
    0.156798,
    1.72944,
    2.99096,
    0.239412,
    2.64181,
    6.97916
  ),
  emo002_values = c(
    98.6032,
    0.859864,
    13.2198,
    174.763,
    0.447955,
    6.96697,
    48.5387,
    0.796347,
    12.1066,
    146.569,
    0.380151,
    5.13476,
    26.3658,
    0.41191,
    4.8436,
    23.4604,
    0.348392,
    4.06218,
    16.5013
  ),
  emo003_values = c(
    11.652,
    0.257195,
    3.79038,
    14.367,
    0.0766636,
    1.09535,
    1.19979,
    0.342095,
    5.05293,
    25.5321,
    0.222982,
    2.83725,
    8.05001,
    0.180532,
    1.99817,
    3.99268,
    0.265432,
    2.94967,
    8.70057
  ),
  emo004_values = c(
    0.773444,
    0.135428,
    1.43705,
    2.06511,
    -0.0377899,
    -0.400646,
    0.160517,
    0.0124185,
    0.130759,
    0.0170979,
    0.111713,
    1.00135,
    1.0027,
    0.173218,
    1.34581,
    1.81121,
    0.0502084,
    0.388218,
    0.150713
  ),
  emo005_values = c(
    28.7099,
    0.574421,
    7.02817,
    49.3952,
    0.192133,
    2.32131,
    5.38849,
    0.572917,
    6.91174,
    47.7721,
    0.381536,
    4.02221,
    16.1782,
    0.382288,
    3.51116,
    12.3283,
    0.380784,
    3.47733,
    12.0918
  )
)


mema_roi_from_beta_t <- function(
  subject_beta,
  subject_t_statistic,
  use_hk = TRUE
) {
  stopifnot(length(subject_beta) == length(subject_t_statistic))

  # implied subject-level standard error and sampling variance
  subject_standard_error <- abs(subject_beta / subject_t_statistic)
  subject_sampling_variance <- subject_standard_error^2

  # guard against t == 0 or missing values
  keep_index <- is.finite(subject_beta) &
    is.finite(subject_t_statistic) &
    subject_t_statistic != 0 &
    is.finite(subject_sampling_variance) &
    subject_sampling_variance > 0

  if (sum(keep_index) < 3) {
    stop(
      "Need at least 3 valid subjects (finite beta, nonzero t, finite variance)."
    )
  }

  meta_fit <- metafor::rma.uni(
    yi = subject_beta[keep_index],
    vi = subject_sampling_variance[keep_index],
    method = "REML",
    test = if (use_hk) "knha" else "t" # "knha" aligns with 3dMEMA default HK behavior
  )

  list(
    n_subjects_used = sum(keep_index),
    group_beta = as.numeric(meta_fit$beta),
    group_standard_error = as.numeric(meta_fit$se),
    # metafor stores the coefficient test statistic in $zval; under test="knha" it is t-referenced
    group_test_statistic = as.numeric(meta_fit$zval),
    group_p_value = as.numeric(meta_fit$pval),
    tau2_between_subject = as.numeric(meta_fit$tau2),
    model_object = meta_fit
  )
}

lateral_occ_beta <- lat_occ_reml_stats %>%
  filter(names == "EmoVsNeut_Coef") %>%
  select(-names) %>%
  unlist()

lateral_occ_t <- lat_occ_reml_stats %>%
  filter(names == "EmoVsNeut_t") %>%
  select(-names) %>%
  unlist()

lateral_occ_result <- mema_roi_from_beta_t(
  subject_beta = lateral_occ_beta,
  subject_t_statistic = lateral_occ_t
)

lateral_occ_result$group_beta
lateral_occ_result$group_test_statistic
lateral_occ_result$group_p_value
lateral_occ_result$tau2_between_subject

lateral_occ_meta_fit <- lateral_occ_result$model_object

lateral_occ_k <- lateral_occ_meta_fit$k
lateral_occ_p <- lateral_occ_meta_fit$p # not a p-value, for finding the degrees of freedom
lateral_occ_df <- lateral_occ_k - lateral_occ_p # HK reference df for the mean test (intercept-only)

lateral_occ_d <- lateral_occ_result$group_test_statistic /
  sqrt(lateral_occ_k)

lateral_occ_d


# Optional Hedges correction using df = k - 1 for one-sample SMD intuition
J <- 1 - 3 / (4 * (lateral_occ_k - lateral_occ_p) - 1)
g <- lateral_occ_d * J


Amygdala_L_beta <- c(0.0876498, 0.00892329, -0.0722916)
Amygdala_L_t <- c(0.976707, 0.132832, -0.809858)

Seventh_Visual_Area_L_beta <- c(0.300257, 0.154915, 0.0996711)
Seventh_Visual_Area_L_t <- c(3.38099, 1.72975, 1.27217)

IntraParietal_Sulcus_Area_1_R_beta <- c(0.227399, 0.206873, 0.0998604)
IntraParietal_Sulcus_Area_1_R_t <- c(2.51, 2.87016, 1.25267)

Amygdala_L_result <- mema_roi_from_beta_t(
  subject_beta = Amygdala_L_beta,
  subject_t_statistic = Amygdala_L_t
)

Amygdala_L_result$group_beta
Amygdala_L_result$group_test_statistic
Amygdala_L_result$group_p_value
Amygdala_L_result$tau2_between_subject

Amygdala_L_meta_fit <- Amygdala_L_result$model_object

Amygdala_L_k <- Amygdala_L_meta_fit$k
Amygdala_L_p <- Amygdala_L_meta_fit$p
Amygdala_L_df <- Amygdala_L_k - Amygdala_L_p # HK reference df for the mean test (intercept-only)

Amygdala_L_d <- Amygdala_L_result$group_test_statistic /
  sqrt(Amygdala_L_k)

Amygdala_L_d


IntraParietal_Sulcus_Area_1_R_result <- mema_roi_from_beta_t(
  subject_beta = IntraParietal_Sulcus_Area_1_R_beta,
  subject_t_statistic = IntraParietal_Sulcus_Area_1_R_t
)

IntraParietal_Sulcus_Area_1_R_result$group_beta
IntraParietal_Sulcus_Area_1_R_result$group_test_statistic
IntraParietal_Sulcus_Area_1_R_result$group_p_value
IntraParietal_Sulcus_Area_1_R_result$tau2_between_subject

IntraParietal_Sulcus_Area_1_R_meta_fit <- IntraParietal_Sulcus_Area_1_R_result$model_object

IntraParietal_Sulcus_Area_1_R_k <- IntraParietal_Sulcus_Area_1_R_meta_fit$k
IntraParietal_Sulcus_Area_1_R_p <- IntraParietal_Sulcus_Area_1_R_meta_fit$p
IntraParietal_Sulcus_Area_1_R_df <- IntraParietal_Sulcus_Area_1_R_k -
  IntraParietal_Sulcus_Area_1_R_p # HK reference df for the mean test (intercept-only)

IntraParietal_Sulcus_Area_1_R_d <- IntraParietal_Sulcus_Area_1_R_result$group_test_statistic /
  sqrt(IntraParietal_Sulcus_Area_1_R_k)

IntraParietal_Sulcus_Area_1_R_d

Seventh_Visual_Area_L_result <- mema_roi_from_beta_t(
  subject_beta = Seventh_Visual_Area_L_beta,
  subject_t_statistic = Seventh_Visual_Area_L_t
)

Seventh_Visual_Area_L_result$group_beta
Seventh_Visual_Area_L_result$group_test_statistic
Seventh_Visual_Area_L_result$group_p_value
Seventh_Visual_Area_L_result$tau2_between_subject

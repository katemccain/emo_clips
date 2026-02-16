library(tidyverse)
#figures

# Emotion regions
# Amygdala: video .25%, t = 3.55, d = 1.56; scene <.20%, d = .8
# Atttention regions
# FEF: video .20%, t = 3.2, d = 1.43; scene d .5
# TPJ: video .30%, t = 6, d = 2.68; scene d < .7 (no real scene studies)
# IPS: video .40%, t = 6.5, d = 2.9; scene d = .6
# Sensory areas:
# Lateral occipital video .30%, t = 5.5, d = 2.45 scene %.26, d = 1.47
# extended auditory video .20%, t = 3.5, d = 1.5
# DMN
# Post cingulate -.40%, t = 4, d = 1.7; basically same for mpfc, no scene studies

effect_size_df <- data.frame(
  stimulus = c(
    "video",
    "video",
    "video",
    "video",
    "video",
    "video",
    "video",
    "scene",
    "scene",
    "scene",
    "scene",
    "scene",
    "scene",
    "scene"
  ),
  roi = c(
    "amygdala",
    "TPJ",
    "FEF",
    "IPS",
    "LatOcc",
    "Auditory",
    "PostCin",
    "amygdala",
    "TPJ",
    "FEF",
    "IPS",
    "LatOcc",
    "Auditory",
    "PostCin"
  ),
  cohen_d = c(
    1.56,
    2.68,
    1.43,
    2.9,
    2.45,
    1.5,
    1.7,
    .82,
    NA,
    .5,
    .6,
    1.47,
    NA,
    NA
  )
) %>%
  mutate(stimulus = factor(stimulus, levels = c("video", "scene"))) %>%
  mutate(
    roi = factor(
      roi,
      levels = rev(c(
        "amygdala",
        "TPJ",
        "FEF",
        "IPS",
        "LatOcc",
        "Auditory",
        "PostCin"
      ))
    )
  )

effect_size_df %>%
  filter(roi != "TPJ") %>%
  ggplot() +
  # geom_point(aes(x = cohen_d, y = roi, color = stimulus), size = 4) +
  geom_bar(
    aes(x = cohen_d, y = roi, fill = stimulus),
    color = "black",
    stat = "identity",
    position = "dodge",
    linewidth = 2
  ) +
  geom_vline(xintercept = .8, linetype = "dashed", linewidth = 2) +
  scale_x_continuous(
    breaks = c(.5, .8, 1.0, 1.5, 2.0, 2.5),
    labels = c(0.5, "large", 1.0, 1.5, 2.0, 2.5)
  ) +
  scale_y_discrete(
    labels = rev(c(
      "Amygdala",
      "Frontal Eye Fields",
      "Intraparietal Sulcus",
      "Lateral Occipital",
      "Auditory Cortices",
      "Default Mode\nPosterior Cingulate"
    ))
  ) +
  scale_x_continuous(
    name = "Cohen's D",
    breaks = c(.5, .8, 1.0, 1.5, 2.0, 2.5),
    labels = c(0.5, "Large", 1.0, 1.5, 2.0, 2.5),
    expand = c(0, 0)
  ) +
  coord_cartesian(xlim = c(.4, 3)) +
  scale_color_manual(values = c("blue1", "red1")) +
  scale_fill_manual(values = c("blue1", "red1")) +
  theme_bw() +
  theme(
    text = element_text(family = "Arial", size = 25, colour = "black"),
    axis.text = element_text(family = "Arial", size = 25, colour = "black", ),
    legend.position = "none",
    panel.grid.major.x = element_line(
      colour = "black",
      linetype = "dotted",
      linewidth = 1
    ),
    panel.border = element_rect(
      colour = "black",
      linewidth = 2, # thicker than default
      fill = NA
    ),
    axis.text.y = element_text(hjust = 0),
    axis.ticks = element_blank(),
    axis.title.y = element_blank()
  )


ggsave(
  filename = "/home/andrewfarkas/Documents/Grants/K_submission_AndrewF_Video/R2/fMRI_effect_sizes.png",
  device = "png",
  width = 4,
  height = 1.35,
  scale = 3.75,
  dpi = 150
)

# And what if I converted to Hedge's g?
effect_size_df <- effect_size_df %>%
  mutate(
    hedges_g = case_when(
      stimulus == "video" ~ cohen_d * (1 - 3 / (4 * (5 - 1) - 1)),
      stimulus == "scene" ~ cohen_d * (1 - 3 / (4 * (22 - 1) - 1))
    )
  )

effect_size_df %>%
  filter(roi != "TPJ") %>%
  ggplot() +
  # geom_point(aes(x = cohen_d, y = roi, color = stimulus), size = 4) +
  geom_bar(
    aes(x = hedges_g, y = roi, fill = stimulus),
    color = "black",
    stat = "identity",
    position = "dodge",
    linewidth = 2
  ) +
  geom_vline(xintercept = .8, linetype = "dashed", linewidth = 2) +
  scale_x_continuous(
    breaks = c(.5, .8, 1.0, 1.5, 2.0, 2.5),
    labels = c(0.5, "large", 1.0, 1.5, 2.0, 2.5)
  ) +
  scale_y_discrete(
    labels = rev(c(
      "Amygdala",
      "Frontal Eye Fields",
      "Intraparietal Sulcus",
      "Lateral Occipital",
      "Auditory Cortices",
      "Default Mode\nPosterior Cingulate"
    ))
  ) +
  scale_x_continuous(
    name = "Hedges' g",
    breaks = c(.5, .8, 1.0, 1.5, 2.0, 2.5),
    labels = c(0.5, "Large", 1.0, 1.5, 2.0, 2.5),
    expand = c(0, 0)
  ) +
  coord_cartesian(xlim = c(.4, 2.4)) +
  scale_color_manual(values = c("blue1", "red1")) +
  scale_fill_manual(values = c("blue1", "red1")) +
  theme_bw() +
  theme(
    text = element_text(family = "Arial", size = 25, colour = "black"),
    axis.text = element_text(family = "Arial", size = 25, colour = "black", ),
    legend.position = "none",
    panel.grid.major.x = element_line(
      colour = "black",
      linetype = "dotted",
      linewidth = 1
    ),
    panel.border = element_rect(
      colour = "black",
      linewidth = 2, # thicker than default
      fill = NA
    ),
    axis.text.y = element_text(hjust = 0),
    axis.ticks = element_blank(),
    axis.title.y = element_blank()
  )


ggsave(
  filename = "/home/andrewfarkas/Documents/Grants/K_submission_AndrewF_Video/R2/fMRI_effect_sizes_g.png",
  device = "png",
  width = 4,
  height = 1.35,
  scale = 3.75,
  dpi = 150
)


#Sabat et al., 2009
# middle occipital gyrus
effectsize::F_to_eta2(49.93, 2, 15)

#Sabat et al., 2007
# fusiform
effectsize::t_to_d(6.69, 21, paired = T)
# amygdala
effectsize::t_to_d(4.62, 21, paired = T)
2 * pt(4.62, 21, lower = FALSE)

# Sambuco 2019
#trauma factor
effectsize::F_to_eta2(8.9, 1, 160)


# Farkas pic vid
# in the .50 for partial eta

# emoclips 001 ROI
#amygdala
effectsize::t_to_d(2.44, 1106, paired = T)

# emoclips 002 peak voxels full F
effectsize::F_to_eta2(61, 3, 1091)
effectsize::t_to_d(4.1, 1174, paired = T)

# emoclips 003 peak voxels full F
effectsize::F_to_eta2(157, 3, 1174)

# emoclips emotion vs neutral
effectsize::t_to_d(11, 2, paired = T)

# gaborgen 139
effectsize::F_to_eta2(6.1, 12, 699)

# gaborgen 151
effectsize::F_to_eta2(5.7, 12, 1005)

#gaborgen t-test CS+ vs GS3 acquisition
# around 2-4 on z-score critical stat
effectsize::z_to_d(2, n = 38, paired = T)
effectsize::z_to_d(3, n = 38, paired = T)
effectsize::z_to_d(4, n = 38, paired = T)
effectsize::z_to_d(5, n = 38, paired = T)

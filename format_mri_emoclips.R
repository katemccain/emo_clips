system2(
  command = 'tcsh',
  args = c(
    '-c',
    shQuote(
      # 'dcm2niix -w 1 -f "%f_%p_%d_%t_%s" /home/andrewfarkas/Research_data/multimodal/emoclips/EMOCLIPS-PILOT-001'
      # 'dcm2niix -w 1 -f "%f_%p_%d_%t_%s" /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002'
      'dcm2niix -w 1 -f "%f_%p_%d_%t_%s" /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002'
    )
  )
)

setwd(
  # '/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002'
  '/home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002'
)

system2(
  command = 'tcsh',
  args = c(
    '-c',
    shQuote(
      # '3dWarp -deoblique -prefix ANAT_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/EMOCLIPS-PILOT-001/EMOCLIPS-PILOT-001_t1_mprage_sag_p2_iso_t1_mprage_sag_p2_iso_20251027124752_5.nii'
      # '3dWarp -deoblique -prefix ANAT_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_t1_mprage_sag_p2_iso_t1_mprage_sag_p2_iso_20251029154730_5.nii'
      '3dWarp -deoblique -prefix ANAT_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002/EMOCLIPS_PILOT_002_t1_mprage_sag_p2_iso_t1_mprage_sag_p2_iso_20251210160959_5.nii'
    )
  )
)

system2(
  command = 'tcsh',
  args = c(
    '-c',
    shQuote(
      # '3dWarp -deoblique -prefix FUNC_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/EMOCLIPS-PILOT-001/EMOCLIPS-PILOT-001_BOLD-EPI-cmrr-1.8s_BOLD-EPI-cmrr-1.8s_20251027124752_14.nii'
      # '3dWarp -deoblique -prefix FUNC_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_BOLD-EPI-cmrr-1.8s_BOLD-EPI-cmrr-1.8s_20251029154730_10.nii'
      '3dWarp -deoblique -prefix FUNC_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002/EMOCLIPS_PILOT_002_BOLD-EPI-cmrr-1.8s_BOLD-EPI-cmrr-1.8s_20251210160959_20.nii'
    )
  )
)


# system2(
#   command = 'tcsh',
#   args = c(
#     '-c',
#     shQuote(
#       # '3dWarp -deoblique -prefix FUNC_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/EMOCLIPS-PILOT-001/EMOCLIPS-PILOT-001_BOLD-EPI-cmrr-1.8s_BOLD-EPI-cmrr-1.8s_20251027124752_14.nii'
#       # '3dWarp -deoblique -prefix FUNC_DEOB_2 /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_BOLD-EPI-cmrr-1.8s-2x2x2_BOLD-EPI-cmrr-1.8s-2x2x2_20251029154730_21.nii'
#       '3dWarp -deoblique -prefix FUNC_DEOB_2 /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002/EMOCLIPS_002_BOLD-EPI-cmrr-1.8s-2x2x2_BOLD-EPI-cmrr-1.8s-2x2x2_20251029154730_21.nii'
#     )
#   )
# )

# blip
system2(
  command = 'tcsh',
  args = c(
    '-c',
    shQuote(
      # '3dWarp -deoblique -prefix BLIP_FOR_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_cmmr-DistMap_AP_cmmr-DistMap_AP_20251029154730_15.nii'
      '3dWarp -deoblique -prefix BLIP_FOR_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002/EMOCLIPS_PILOT_002_cmmr-DistMap_AP_cmmr-DistMap_AP_20251210160959_25.nii'
    )
  )
)

# system2(
#   command = 'tcsh',
#   args = c(
#     '-c',
#     shQuote(
#       # '3dWarp -deoblique -prefix BLIP_FOR_DEOB_2 /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_cmmr-DistMap_AP_2x2x2_cmmr-DistMap_AP_2x2x2_20251029154730_26.nii'
#       '3dWarp -deoblique -prefix BLIP_FOR_DEOB_2 /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_cmmr-DistMap_AP_2x2x2_cmmr-DistMap_AP_2x2x2_20251029154730_26.nii'
#     )
#   )
# )

system2(
  command = 'tcsh',
  args = c(
    '-c',
    shQuote(
      # '3dWarp -deoblique -prefix BLIP_REV_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_cmmr-DistMap_PA_cmmr-DistMap_PA_20251029154730_17.nii'
      '3dWarp -deoblique -prefix BLIP_REV_DEOB /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS-PILOT-003/EMOCLIPS_PILOT_002/EMOCLIPS_PILOT_002_cmmr-DistMap_PA_cmmr-DistMap_PA_20251210160959_27.nii'
    )
  )
)

# system2(
#   command = 'tcsh',
#   args = c(
#     '-c',
#     shQuote(
#       '3dWarp -deoblique -prefix BLIP_REV_DEOB_2 /home/andrewfarkas/Research_data/multimodal/emoclips/raw_data/EMOCLIPS_002/EMOCLIPS_002_cmmr-DistMap_PA_2x2x2_cmmr-DistMap_PA_2x2x2_20251029154730_28.nii'
#     )
#   )
# )

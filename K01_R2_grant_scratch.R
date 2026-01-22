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

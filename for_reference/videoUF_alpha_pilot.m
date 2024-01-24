% Pilot 90 10-second UGA videos, 2 runs, no flickering border, no sound,
% ITI uniform-distribution 4.5-6.5 seconds, epoch 2000ms before 10000ms after
% Necessary functions found in github csea-lab/Libas & csea-lab/Libas/4wavelettrans

run1_pls = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run1/video_pilot_andrew_nov16_20231116_013916.fl40h0.E1.app1';
run1_neut = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run1/video_pilot_andrew_nov16_20231116_013916.fl40h0.E1.app2';
run1_unpls = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run1/video_pilot_andrew_nov16_20231116_013916.fl40h0.E1.app3';

run2_pls = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run2/andrew_video_pilot2_nov16_20231116_020700.fl40h0.E1.app1';
run2_neut = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run2/andrew_video_pilot2_nov16_20231116_020700.fl40h0.E1.app2';
run2_unpls = '/home/andrewf/Research_data/EEG/video_alpha_UF/andrew_pilot/raw_data/run2/andrew_video_pilot2_nov16_20231116_020700.fl40h0.E1.app3';

run1_pls_mat = app2mat(run1_pls, 0);
run1_neut_mat = app2mat(run1_neut, 0);
run1_unpls_mat = app2mat(run1_unpls, 0);
run2_pls_mat = app2mat(run2_pls, 0);
run2_neut_mat = app2mat(run2_neut, 0);
run2_unpls_mat = app2mat(run2_unpls, 0);
    
pls_mat = cat(3, run1_pls_mat, run2_pls_mat);
neut_mat = cat(3, run1_neut_mat, run2_neut_mat);
unpls_mat = cat(3, run1_unpls_mat, run2_unpls_mat);

[wapower_run1_pls] = wavelet_app_mat(run1_pls_mat, 1000, 40, 400, 20, [], 'run1_pls');
[wapower_run1_neut] = wavelet_app_mat(run1_neut_mat, 1000, 40, 400, 20, [], 'run1_neut');
[wapower_run1_unpls] = wavelet_app_mat(run1_unpls_mat, 1000, 40, 400, 20, [], 'run1_unpls');

[wapower_run2_pls] = wavelet_app_mat(run2_pls_mat, 1000, 40, 400, 20, [], 'run2_pls');
[wapower_run2_neut] = wavelet_app_mat(run2_neut_mat, 1000, 40, 400, 20, [], 'run2_neut');
[wapower_run2_unpls] = wavelet_app_mat(run2_unpls_mat, 1000, 40, 400, 20, [], 'run2_unpls');

[wapower_pls] = wavelet_app_mat(pls_mat, 1000, 40, 400, 20, [], 'pls');
[wapower_neut] = wavelet_app_mat(neut_mat, 1000, 40, 400, 20, [], 'neut');
[wapower_unpls] = wavelet_app_mat(unpls_mat, 1000, 40, 400, 20, [], 'unpls');


[outWaMat_run1_pls] = bslcorrWAMat_percent(wapower_run1_pls, 500:1500);
[outWaMat_run1_neut] = bslcorrWAMat_percent(wapower_run1_neut, 500:1500);
[outWaMat_run1_unpls] = bslcorrWAMat_percent(wapower_run1_unpls, 500:1500);

[outWaMat_run2_pls] = bslcorrWAMat_percent(wapower_run2_pls, 500:1500);
[outWaMat_run2_neut] = bslcorrWAMat_percent(wapower_run2_neut, 500:1500);
[outWaMat_run2_unpls] = bslcorrWAMat_percent(wapower_run2_unpls, 500:1500);

[outWaMat_pls] = bslcorrWAMat_percent(wapower_pls, 500:1500);
[outWaMat_neut] = bslcorrWAMat_percent(wapower_neut, 500:1500);
[outWaMat_unpls] = bslcorrWAMat_percent(wapower_unpls, 500:1500);


time_axis =  -2000:10000;

frequency_step_1 = 0:1/12:500;

frequency_axis = frequency_step_1(40:20:400);

% Run one percent difference from baseline plots, Oz (hopefully, net configuration file
% needs to checked)
figure(1)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run1_pls(137,:,2:end))'), colorbar
caxis([.3 2.5])
figure(2)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run1_neut(137,:,2:end))'), colorbar
caxis([.3 2.5])
figure(3)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run1_unpls(137,:,2:end))'), colorbar
caxis([.3 2.5])
figure(11)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run1_pls(137,:,2:end))'), colorbar
caxis([-50 50])
figure(12)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run1_neut(137,:,2:end))'), colorbar
caxis([-50 50])
figure(13)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run1_unpls(137,:,2:end))'), colorbar
caxis([-50 50])

% Run two, pleasant less potent and neutral is more potent
figure(4)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run2_pls(137,:,2:end))'), colorbar
caxis([.8 4])
figure(5)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run2_neut(137,:,2:end))'), colorbar
caxis([.8 4])
figure(6)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_run2_unpls(137,:,2:end))'), colorbar
caxis([.8 4])
figure(14)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run2_pls(137,:,2:end))'), colorbar
caxis([-50 50])
figure(15)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run2_neut(137,:,2:end))'), colorbar
caxis([-50 50])
figure(16)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_run2_unpls(137,:,2:end))'), colorbar
caxis([-50 50])

% Average of run 1 and 2
figure(7)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_pls(137,:,2:end))'), colorbar
caxis([.8 4])
figure(8)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_neut(137,:,2:end))'), colorbar
caxis([.8 4])
figure(9)
contourf(time_axis, frequency_axis(2:end), squeeze(wapower_unpls(137,:,2:end))'), colorbar
caxis([.8 4])
figure(17)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_pls(137,:,2:end))'), colorbar
caxis([-50 50])
figure(18)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_neut(137,:,2:end))'), colorbar
caxis([-50 50])
figure(19)
contourf(time_axis, frequency_axis(2:end), squeeze(outWaMat_unpls(137,:,2:end))'), colorbar
caxis([-50 50])



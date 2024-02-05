% Organizes paths on Andrew's laptop 
% run_emegs_28


run1_pupil_path = '/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_1/cal001.edf';
run1_save_path = '/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_1/cal001.csv';

run2_pupil_path = '/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_2/cal101.edf';
run2_save_path = '/home/andrewf/Research_data/EEG/video_alpha_UF/cal_pilot/pupil/run_2/cal101.csv';

EmoclipsEyePipeline(run1_pupil_path, run1_save_path)
EmoclipsEyePipeline(run2_pupil_path, run2_save_path)
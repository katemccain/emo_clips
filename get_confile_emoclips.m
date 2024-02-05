
close all; clearvars;

%Set directory - location of .set file
DIR = '/Users/katemccain/Documents/video_alpha/Pilot_Data_Logs';


Subject_ID = 'JP_pilot';

%List of subjects to process, based on the name of the folder that contains that subject's data
RUN = {'run1', 'run2'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Loop through each subject listed in SUB
for i = 1:length(RUN)

    temp = [];
%     temp_file_name = [];
%     new_file_name = [];

    %Define subject path based on study directory and subject ID of current subject
    Subject_Path = ([DIR filesep Subject_ID filesep]);

    %log files path in the folder
    log_file_path = [Subject_Path 'logs' filesep RUN{i}];

    % Create a search pattern for files ending with '.csv'
    searchPattern = fullfile(log_file_path, '*.csv');
    
    % Use the dir function to get a list of files matching the search pattern
    log_file = dir(searchPattern);

    temp = getcon_emoclips([log_file_path filesep log_file.name]);

    con_file_path = [Subject_Path 'EEG' filesep RUN{i}];

    % Create a search pattern for files ending with '.csv'
    searchPattern_2 = fullfile(con_file_path, '*.CON');
    
    % Use the dir function to get a list of files matching the search pattern
    con_file = dir(searchPattern_2);

   % Define the original file path
    originalFilePath = [con_file_path filesep con_file.name]; 
    
    % Open the original file for writing
    fid = fopen(originalFilePath, 'wt');  % 'wt' mode will clear the existing file content
    
    % Write the header row with two columns
    fprintf(fid, '%d,%d\n', 90, 1);
    
    % Write the data from 'temp' into the file (assuming 'temp' is already defined)
    for row = 1:size(temp, 1)
        fprintf(fid, '%f', temp(row, 1));
        for col = 2:size(temp, 2)
            fprintf(fid, ',%f', temp(row, col));
        end
        fprintf(fid, '\n');  % New line for next row
    end
    
    % Close the original file
    fclose(fid);    

    % EMEGS takes con files with the lowercase extension '.con'
    % but MATLAB doesn't let you rename it from upper to lower case
    % directly

    temp_file_name = [originalFilePath(:,1:end -3) 'txt'];
    new_file_name = [originalFilePath(:,1:end -3) 'con'];

    movefile(originalFilePath, temp_file_name);
    movefile(temp_file_name, new_file_name);
    

end


function [convec] = getcon_emoclips(csvfilepath)
% This little piece of code opens a dat file from the EmoClips study with
% 90 video clips, reads it, outputs a condition vector - should be 90 elements

temp = readmatrix(csvfilepath);


column_data = temp(3:end, 5);

% Create a logical index vector that is true for non-NaN entries
non_nan_indices = ~isnan(column_data);

% Use the logical index to extract only the non-NaN values
convec = column_data(non_nan_indices);


if length(convec) ~= 90
    disp('warning: not 90')
end

end
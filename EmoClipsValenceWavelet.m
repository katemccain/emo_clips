timeAxisMs =  -2000:10000;

totalTimeSeconds = 12;

frequencyResolution = 1/totalTimeSeconds;

sampleRate = 1000;

nyquist = sampleRate / 2;

frequencyAxisTotal = 0:frequencyResolution:nyquist;

frquencyRangeOfInterestHz = [3 35];

[differenceFromTargetStartFrequencyHz , frequencyAxisIndexStart] = ...
    min(abs(frequencyAxisTotal - frquencyRangeOfInterestHz(1)));

[differenceFromTargetStopFrequencyHz , frequencyAxisIndexStop] = ...
    min(abs(frequencyAxisTotal - frquencyRangeOfInterestHz(2)));

numberOfFrequenciesToSkip = 10;

finalFrequencyIndices = ...
    frequencyAxisIndexStart : numberOfFrequenciesToSkip : frequencyAxisIndexStop;

condensedFrequencyAxis = frequencyAxisTotal(finalFrequencyIndices);


% 
% AppBatchFilePath = '/home/andrewf/Research_data/EEG/EmoClips/batch_files/valence_app_files.txt';
% 
% fileID = fopen(AppBatchFilePath, 'r');
% 
% % Check if the file was opened successfully
% if fileID == -1
%     error('Failed to open the file: %s', AppBatchFilePath);
% end
% 
% % Read all lines at once
% C = textscan(fileID, '%s');
% fclose(fileID);
% 
% % Extract the lines from the cell array C
% filePaths = C{1};
% 
% % Process each path
% dataStruct = struct();
% for i = 1:length(filePaths)
%     line = filePaths{i};
%     [~, name, ext] = fileparts(line);
% 
%     originalName = ['E' name ext]
% 
%     modifiedName = strrep(originalName, '.', '_');
% 
%     CurrentMat = app2mat(line, 0);
%     
%     dataStruct.(modifiedName) = wavelet_app_mat(CurrentMat, 1000, 40, 400, 20, [], modifiedName);
% end


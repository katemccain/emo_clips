% Set up

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

baselineSamplePoints = [500:1500];

% example wavelet

emo002run1Pleasant = '/home/andrewf/Research_data/EEG/EmoClips/raw_data/emo002/EEG/run1/emo002_20240306_032232.fl35h0.E1.app1';
emo002run1Neutral = '/home/andrewf/Research_data/EEG/EmoClips/raw_data/emo002/EEG/run1/emo002_20240306_032232.fl35h0.E1.app2';
emo002run1Unpleasant = '/home/andrewf/Research_data/EEG/EmoClips/raw_data/emo002/EEG/run1/emo002_20240306_032232.fl35h0.E1.app3';

emo002run1PleasantMat = app2mat(emo002run1Pleasant, 0);
emo002run1NeutralMat = app2mat(emo002run1Neutral, 0);
emo002run1UnpleasantMat = app2mat(emo002run1Unpleasant, 0);


[emo002run1WapowerPleasant] = wavelet_app_mat(emo002run1PleasantMat, ...
    sampleRate, finalFrequencyIndices(1), finalFrequencyIndices(end), numberOfFrequenciesToSkip, [],...
    'emo002run1Pleasant');
[emo002run1WapowerNeutral] = wavelet_app_mat(emo002run1NeutralMat, ...
    sampleRate, finalFrequencyIndices(1), finalFrequencyIndices(end), numberOfFrequenciesToSkip, [],...
    'emo002run1Neutral');
[emo002run1WapowerUnpleasant] = wavelet_app_mat(emo002run1UnpleasantMat, ...
    sampleRate, finalFrequencyIndices(1), finalFrequencyIndices(end), numberOfFrequenciesToSkip, [],...
    'emo002run1Unpleasant');


[emo002run1WapowerPleasantBaselined] =...
    bslcorrWAMat_percent(emo002run1WapowerPleasant, baselineSamplePoints);
[emo002run1WapowerNeutralBaselined] =...
    bslcorrWAMat_percent(emo002run1WapowerNeutral, baselineSamplePoints);
[emo002run1WapowerUnpleasantBaselined] =...
    bslcorrWAMat_percent(emo002run1WapowerUnpleasant, baselineSamplePoints);

OzChannel = 137;
PzChannel = 126;

figure(1)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerPleasant(PzChannel,:,:))'), colorbar
caxis([.8 4])
figure(2)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerNeutral(PzChannel,:,:))'), colorbar
caxis([.8 4])
figure(3)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerUnpleasant(PzChannel,:,:))'), colorbar
caxis([.8 4])

figure(4)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerPleasantBaselined(PzChannel,:,:))'), colorbar
caxis([-50 35])
figure(5)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerNeutralBaselined(PzChannel,:,:))'), colorbar
caxis([-50 35])
figure(6)
contourf(timeAxisMs, condensedFrequencyAxis, squeeze(emo002run1WapowerUnpleasantBaselined(PzChannel,:,:))'), colorbar
caxis([-50 35])

% Save the topography, matrix is channelsXsamplePointsXfrequency with each
% cell as an amplitude.

startFrequencyToAverageHz = 6.5;
stopFrequencyToAverageHz = 9;

[differenceFromTargetStartAverageFrequencyHz , frequencyAxisAverageIndexStart] = ...
    min(abs(condensedFrequencyAxis - startFrequencyToAverageHz));

[differenceFromTargetStopAverageFrequencyHz , frequencyAxisAverageIndexStop] = ...
    min(abs(condensedFrequencyAxis - stopFrequencyToAverageHz));

%SaveAvgFile(FilePath,AvgMat,NTrialAvgVec,StdChanTimeMat, ...
%     SampRate,MedMedRawVec,MedMedAvgVec,EegMegStatus,NChanExtra,TrigPoint,HybridFactor,...
%     HybridDataCell,DataTypeVal,EffectDf,ErrorDf)
SaveAvgFile('~/Research_data/EEG/EmoClips/emo002run1WapowerPleasant.at', ...
    squeeze((mean(emo002run1WapowerPleasant(:,:,frequencyAxisAverageIndexStart:frequencyAxisAverageIndexStop),3))), ...
    [],[],1000,[],[],1,[],2001)

SaveAvgFile('~/Research_data/EEG/EmoClips/emo002run1WapowerNeutral.at', ...
    squeeze((mean(emo002run1WapowerNeutral(:,:,frequencyAxisAverageIndexStart:frequencyAxisAverageIndexStop),3))), ...
    [],[],1000,[],[],1,[],2001)

SaveAvgFile('~/Research_data/EEG/EmoClips/emo002run1WapowerUnpleasant.at', ...
    squeeze((mean(emo002run1WapowerUnpleasant(:,:,frequencyAxisAverageIndexStart:frequencyAxisAverageIndexStop),3))), ...
    [],[],1000,[],[],1,[],2001)




% example of using batchfile
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


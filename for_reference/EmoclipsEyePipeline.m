function [TrialEpochsCorr, TrialEpochs] = EmoclipsEyePipeline(EdfFilePath, OutFileMatrixPath)


PupilStruc = Edf2Mat(EdfFilePath);


trialindexinMSGvec = [];

for x = 1:length(PupilStruc.Events.Messages.info)
    if startsWith(char(PupilStruc.Events.Messages.info(x)), 'Adju')
        trialindexinMSGvec = [trialindexinMSGvec PupilStruc.Events.Messages.time(x)];
    end
end


startbins = trialindexinMSGvec;

AllPupilDiameter = PupilStruc.Samples.pupilSize;

% % plot pupil vs trials:
% figure
% plot(PupilStruc.Samples.time, datavec)
% hold on
% plot(startbins, 200, '*')


timestamps = PupilStruc.Samples.time; % these are the time stamps in ms that match where the data are

% find indices for trial segmentation, i.e. timestamps of stim onsets
[test1, loc1] = ismember(startbins, timestamps);
% [test2, loc2] = ismember(startbins-1, timestamps); % they might be off by one point
% indices = loc1 + loc2; % Andrew - Why add indices that are the same?

VideoOnsetIndices = loc1;

% put in mat format chan (3) by time by trials.. important:
%looks like ethernet message takes 200 ms to initialize and then send to eye link out of psychtoolbox

% 1000 pts/ms before video onset and 10000 pts/ms after
PreTriggerPts = 1000;
PostTriggerPts = 10000;

TimeAxis = -PreTriggerPts:1:PostTriggerPts;
TrialEpochs = zeros(length(TimeAxis), length(startbins));

for x = 1:size(startbins,2)
    TrialEpochs(:, x) = AllPupilDiameter(...
        VideoOnsetIndices(x)-PreTriggerPts:VideoOnsetIndices(x)+PostTriggerPts);
end

% plot the data
% figure
% for x = 1:length(startbins)
%     plot(TimeAxis, TrialEpochs(:,x)'), title (['trial number:' num2str(x)]), pause(.1)
% end
% 
% disp('artifact correction about to commence')
% pause(1)


% %%%%%%%%%%%%%
% artifact correct
AllPupilDiameter_corr = AllPupilDiameter;

% identify points in each epoch were all are zero and set to nans
IndicesZeros =  find(AllPupilDiameter == 0);
AllPupilDiameter_corr(IndicesZeros) = NaN;

% identify points where pupli changes too fast and set to nans
IndicesSpikes =  find(abs(diff(AllPupilDiameter)) > 2.5);
AllPupilDiameter_corr(IndicesSpikes) = NaN;

% pick up the surrounding points after filtering
[filta, filtb] = butter(6, .03);
rawfilt = filtfilt(filta, filtb, abs(diff(AllPupilDiameter)));
IndicesNearSpikes =  find(rawfilt > 5);
AllPupilDiameter_corr(IndicesNearSpikes) = NaN;

AllNANIndices = isnan(AllPupilDiameter_corr); % make nans all the bad stuff and find indices of nans

% find out per trial how many NaNs
for x = 1:size(VideoOnsetIndices,2)
    percentbadvec(x)= (sum(isnan(AllPupilDiameter_corr(...
        VideoOnsetIndices(x)-PreTriggerPts:VideoOnsetIndices(x)+PostTriggerPts)))...
        ./length(TrialEpochs(:,1))).*100;
end

% replace all NaNs in x with linearly interpolated values
AllPupilDiameter_corr(AllNANIndices) = interp1(...
    timestamps(~ AllNANIndices), ...
    AllPupilDiameter_corr(~ AllNANIndices), ...
    timestamps(AllNANIndices), 'pchip');

% put in mat format chan (3) by time by trials
TrialEpochsCorr = zeros(length(TimeAxis), length(startbins));
for x = 1:size(VideoOnsetIndices,2)
    TrialEpochsCorr(:, x) = AllPupilDiameter_corr(...
        VideoOnsetIndices(x)-PreTriggerPts:VideoOnsetIndices(x)+PostTriggerPts);
end

writematrix(TrialEpochsCorr', OutFileMatrixPath)

% plot the data
% figure
% for x = 1:length(startbins)
%     plot(TimeAxis, TrialEpochsCorr(:,x)'), title (['CORRECTED - trial number:' num2str(x)]), pause(.1)
% end



% % now assign the conditions
% datfilemat = load(datfile);
% conditionvec = datfilemat(:, 4);
% 
% % average by condition
% matout = zeros(3501, 6);
% 
% for condition = 1:6
%     matout(:, condition) = mean(matcorr(:, conditionvec==condition), 2);
% end
% 
% eval(['save ' matfile '.pup.out matout -mat'])


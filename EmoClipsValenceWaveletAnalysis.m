% Get all field names in a cell array
fieldNames = fieldnames(dataStruct);
for i = 1:length(fieldNames)

    tempMatMeanFreq = mean(dataStruct.(fieldNames{i})(:,3000:11000,4:7), 3);

    tempMatMeanFreqTime = mean(tempMatMeanFreq, 2);

    SaveAvgFile([fieldNames{i} '.ar'], tempMatMeanFreqTime);

end

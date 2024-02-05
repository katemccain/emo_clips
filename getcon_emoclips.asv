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
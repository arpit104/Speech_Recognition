function [Filter,MelFrequencyVector] = exponential_filter(N,FrequencyVector,hWindow)
% N = number of filters
% FrequencyVector = input frequencies which needs to be rescaled
% hWindow = window to be used. default is triangle

%% Assign defaults
if nargin<3 || isempty(hWindow), hWindow = @triang; end

%%
MelFrequencyVector = exp(FrequencyVector/7000);   % Convert to exponential scale
MaxF = max(MelFrequencyVector);                 % 
MinF = min(MelFrequencyVector);                 %
MelBinWidth = (MaxF-MinF)/(N+1);                %
Filter = zeros([N numel(MelFrequencyVector)]);  % Predefine loop matrix

%% Construct filter bank
for i = 1:N
    iFilter = find(MelFrequencyVector>=((i-1)*MelBinWidth+MinF) & ...
                    MelFrequencyVector<=((i+1)*MelBinWidth+MinF));
    Filter(i,iFilter) = hWindow(numel(iFilter)); % Triangle window
end
% Filter = sparse(Filter);    % Reduce memory size

end
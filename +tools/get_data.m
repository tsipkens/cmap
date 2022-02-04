
% GET_DATA  Get data from files and write to CSV files.
% Author: Timothy Sipkens, 2019
%================================================================%

clear;

fn = dir(fullfile('','*.m'));

for ii=1:length(fn)
    if ~strcmp(fn(ii).name, 'cmap_sweep.m') % skip test data file
        % cmap_name = fn(ii).name(1:(end-4));
        cmap_name = fn(ii).name(1:(end-2));
        cm = eval([cmap_name, '([], "none")']);
        
        dlmwrite(['data/',cmap_name,'.csv'], cm, 'delimiter', ',', 'precision', 9);
    end
end


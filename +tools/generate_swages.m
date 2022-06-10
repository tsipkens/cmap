
% GENERATE_SWAGES  Generates swages for colormaps in the current directory. 
% These are incorporated into the README file.
% Author: Timothy Sipkens, 2019
%================================================================%

clear;

fn = dir(fullfile('','*.m'));

for ii=1:length(fn)
    if ~strcmp(fn(ii).name, 'cmap_sweep.m') % skip test data file
        % cmap_name = fn(ii).name(1:(end-4));
        cmap_name = fn(ii).name(1:(end-2));
        n = 425;
        cm = eval([cmap_name, '(', num2str(n), ')']);
        
        im = repmat(reshape(cm, [1,n,3]),[25,1,1]);
        
        imwrite(im, ...
            ['docs/',cmap_name,'.jpg']);
    end
end

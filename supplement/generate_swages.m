
% GENERATE_SWAGES  Generates swages for colormaps in the current directory. 
% These are incorporated into the README file.
% Author: Timothy Sipkens, 2019
%================================================================%

clear;

x = 0:255;
imagesc(x);
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gcf, 'Position',  [50, 150, 150, 20]);

fn = dir(fullfile('','*.m'));

for ii=1:length(fn)
    if ~strcmp(fn(ii).name, 'cmap_sweep.m') % skip test data file
        % cmap_name = fn(ii).name(1:(end-4));
        cmap_name = fn(ii).name(1:(end-2));
        cm = eval(cmap_name);
        colormap(cm);
        
        F = getframe(gca);
        imwrite(F.cdata,['docs/',cmap_name,'.jpg']);
    end
end


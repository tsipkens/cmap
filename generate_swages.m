
clear;

x = 0:255;
imagesc(x);
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gcf, 'Position',  [100, 300, 300, 40]);

fn = dir(fullfile('','*.mat'));

for ii=1:length(fn)
    if ~strcmp(fn(ii).name,'test_data.mat') % skip test data file
        cmap_name = fn(ii).name(1:(end-4));
        cm = load_cmap(cmap_name,255);
        colormap(cm);
        
        F = getframe(gca);
        imwrite(F.cdata,['docs/',cmap_name,'.jpg']);
    end
end


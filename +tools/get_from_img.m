
% specify image path as `fn` prior to running

i0 = imread(fn);

i1 = double(i0) ./ 255;
d1 = round(size(i1, 1) / 2);  % pull from middle
i2 = squeeze(i1(d1, :, :));
i3 = i2(1:5:end,:);

if sum(i3(1,:,:)) > sum(i3(end,:,:))
    i3 = flipud(i3);
end


% PLOT_CMAP  Plot a demonstration of a colormap.

function [] = plot_cmap(cm)

if ~exist('cm', 'var'); cm = []; end
if isempty(cm); cm = dense(255); end

figure(gcf);
set(gcf, 'Position', [570, 430, 400, 420]);

n = 500;  % number of points to plot in each dimension
L = peaks(n);  % a Matlab pre-computed curve

% Adjust so that peak and trough are the same magnitude.
L_avg = (max(max(L)) + min(min(L))) ./ 2;
L = L - L_avg;

% Modify to zero at edges (useful for diverging colormaps).
[i1, i2] = meshgrid(1:n, 1:n);
sigmoid = @(x, a, b) 1 ./ (1 + exp(1/b .* (x - a)));
mod = sigmoid(sqrt((i1 - n/2) .^ 2 + (i2 - n/2) .^ 2), ...
    n * 2 / 5, n / 25);
L = L .* mod;

% NaN outside ring.
mod = sqrt((i1 - n/2) .^ 2 + (i2 - n/2) .^ 2) > (n/2);
L(mod==1) = NaN;


surf(L);  % generate surface plot


% Apply colormap for shading.
colormap(cm);
shading interp;

% Adjust plot limits.
xlim([1, size(L,1)]);
ylim([1, size(L,2)]);
zlim([min(min(L)), max(max(L))]);

set(gca, 'View', [-20, 20]);

axis off;
axis square;

end

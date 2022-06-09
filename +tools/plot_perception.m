
% PLOT_PERCEPTION  Plot the LAB-based perception for a colormap.
%  
%  Top plot shows the colormap. 
%  Bottom plot shows the percieved lightness (top half) and a line
%  perception scale (bottom half). 

clear;
close all;

cm = viridis;

%{
load('fm.mat');
cm = cm ./ 255;
cm = flipud(cm);
%}

%{
% Option to correct perception.
n = 70;  % update above n to smaller number
cm = tools.perception_correction(cm, n);
%}

n = size(cm, 1);

lab = rgb2lab(cm);
l = lab(:,1)';
pu = linspace(min(l), max(l), n);

figure(1);
ax1 = subplot(2,1,1);
imagesc(1:n);
colormap(ax1, cm);

ax2 = subplot(2,1,2);
imagesc([l; pu]);
colormap(ax2, gray);

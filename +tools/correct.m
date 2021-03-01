
clear;
close all;
clc;

%-- "fblue" cmap --------------------------------------%
% r0 = fliplr([41,40,36,34,29,29,25,22,20,20])'./255;
% g0 = fliplr([165,149,134,119,105,91,76,62,46,31])'./255;
% b0 = fliplr([235,216,199,183,166,148,131,113,95,77])'./255;

%-- "forange" cmap --------------------------------------%
% r0 = fliplr([249,246,245,240,237,233,226,228,225,224])'./255;
% g0 = fliplr([222,207,192,179,166,151,134,121,109,93])'./255;
% b0 = fliplr([143,132,122,113,104,93,90,77,62,55])'./255;

%-- "fred" cmap --------------------------------------%
r0 = [36,56,76,97,117,137,157,178,196,219]'./255;
g0 = [15,18,21,22,22,24,25,26,28,28]'./255;
b0 = [61,67,70,71,78,80,83,85,89,92]'./255;

%-- "fgreen" cmap --------------------------------------%
r0 = [14,13,11,10,9,5,6,3,2,6]'./255;
g0 = [32,46,60,76,92,107,121,137,153,169]'./255;
b0 = [72,81,90,100,110,119,128,138,148,160]'./255;


%-- Linearize percieved brightness -------------------%
rgb0 = [r0,g0,b0];
hsv0 = rgb2hsv(rgb0);
hsl0 = rgb2hsl(rgb0);
hsl0(:,1:2) = hsv0(:,1:2);
n = length(hsl0(:,1));

pl_fun = @(rgb) sqrt(0.299.*rgb(:,1).^2 + ...
    0.587.*rgb(:,2).^2 + 0.114.*rgb(:,3).^2);
    % http://alienryderflex.com/hsp.html




%-- Extend colour map to brighter colours ------------%
pl0 = pl_fun(rgb0);
slope = (pl0(end)-pl0(1))/(length(pl0)-1);
coeffs = [slope,pl0(1)-slope];


coeff_h = polyfit(log(1:n),hsl0(:,1)',2);
coeff_s = polyfit(1:n,hsl0(:,2)',1);
coeff_l = polyfit(1:n,hsl0(:,3)',2);
for nn_new=n:(n+20)
    vt = polyval(coeff_l,nn_new);
    if vt>0.67; break; end
end
nn_new = max(nn_new-1,n);

hx = polyval(coeff_h,log((n+1):nn_new))';
sx = ones(nn_new-n,1).*hsl0(end,2);
lx = polyval(coeff_l,(n+1):nn_new)';
hsl0 = [hsl0;[hx,sx,lx]];
rgb0 = hsl2rgb(hsl0);
n = nn_new;


% for nn_low=1:-1:-20
%     vt = polyval(coeff_l,nn_low);
%     if vt<0.05; break; end
% end
% hx = polyval(coeff_h,log(nn_low:0))';
% sx = ones(1-nn_low,1).*hsl0(1,2);
% lx = polyval(coeff_l,nn_low:0)';
% hsl0 = [[hx,sx,lx];hsl0];
% rgb0 = hsl2rgb(hsl0);
% n = n-nn_low;
%-----------------------------------------------------%



pl_lin = polyval(coeffs,1:n)';

for ii=1:3
    rgb0(:,ii) = smooth(rgb0(:,ii));
end
hsv0 = rgb2hsv(rgb0);
hsl0 = rgb2hsl(rgb0);
pl0 = pl_fun(rgb0);

x1 = fminsearch(@(x) norm(...
    (pl_lin-pl_fun(hsv2rgb([hsv0(:,1),max(min(x.*hsv0(:,2),1),0),hsv0(:,3)])))...
    )^2,0.9.*ones(size(hsv0(:,3))));
% x1 = fminsearch(@(x) norm(...
%     (pl_lin-pl_fun(hsv2rgb([max(min(x.*hsv0(:,1),1),0),hsv0(:,2),hsv0(:,3)])))...
%     )^2,x1);


hsv1 = [hsv0(:,1),max(min(x1.*hsv0(:,2),1),0),hsv0(:,3)];
% hsv1 = [max(min(x1.*hsv0(:,1),1),0),hsv0(:,2),hsv0(:,3)];

rgb1 = hsv2rgb(hsv1);
for ii=1:3
    rgb1(:,ii) = smooth(smooth(rgb1(:,ii)));
end
pl1 = pl_fun(rgb1);


%-- Plot original and corrected percieved lightness --%
figure(1);
plot(pl0);
hold on;
plot(pl_lin);
plot(pl1);
hold off;


%-- Demonstrate new colormap -------------------------%
cm = rgb1;


figure(2);
L = 160*membrane(1,100);
contourf(L,50,'EdgeColor','none');
colormap(cm);

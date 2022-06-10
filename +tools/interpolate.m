
% INTERPOLATE  Interpolate colormaps to a given number of waypoints.
%  
%  NOTE: Interpolation can be done in hsv or lab space depending on OPT.
%  
%  AUTHOR: Timothy Sipkens, 2022-06-10

function cm = interpolate(cm, n, opt)

% by default, interpolate in rgb space
if ~exist('opt', 'var'); opt = []; end
if isempty(opt); opt = 'rgb'; end

p = size(cm,1); % default size of colormap
if strcmp(opt, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt, 'lab')
    lab = rgb2lab(cm);
    lab = interp1(1:p, lab, linspace(1,p,n), 'linear');
    cm = lab2rgb(lab);
    cm = min(max(cm, 0), 1);
elseif strcmp(opt, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

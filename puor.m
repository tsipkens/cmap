
function cm = PuOr(n, opt_interp)
% Colormap: PuOr
% Source:   colorbrewer2
% Authors:	Cynthia Brewer and Mark Harrower

%-- Parse inputs ---------------------------------------------------------%
if ~exist('n', 'var'); n = []; end
if isempty(n)
   f = get(groot,'CurrentFigure');
   if isempty(f)
      n = size(get(groot,'DefaultFigureColormap'),1);
   else
      n = size(f.Colormap,1);
   end
end

% by default, interpolate in rgb space
if ~exist('opt_interp','var'); opt_interp = []; end
if isempty(opt_interp); opt_interp = 'rgb'; end
%-------------------------------------------------------------------------%


% data for colormap
cm = [
    0.176471	0.000000	0.294118
    0.329412	0.152941	0.533333
    0.501961	0.670588	0.823529
    0.847059	0.854902	0.921569
    0.968627	0.968627	0.968627
    0.996078	0.878431	0.713725
    0.992157	0.721569	0.388235
    0.878431	0.509804	0.078431
    0.701961	0.345098	0.023529
    0.498039	0.231373	0.031373
   ];


%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp,'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end


end

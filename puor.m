
function cm = puor(n, opt_interp)
% Colormap: puor

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

% Data for colormap:
cm = [
	0.176471000	0.000000000	0.294118000
	0.329412000	0.152941000	0.533333000
	0.501961000	0.450980000	0.674510000
	0.698039000	0.670588000	0.823529000
	0.847059000	0.854902000	0.921569000
	0.968627000	0.968627000	0.968627000
	0.996078000	0.878431000	0.713725000
	0.992157000	0.721569000	0.388235000
	0.878431000	0.509804000	0.078431000
	0.701961000	0.345098000	0.023529000
	0.498039000	0.231373000	0.031373000
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

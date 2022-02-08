
function cm = gnbu(n, opt_interp)
% Colormap: gnbu

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
	0.031372549	0.250980392	0.505882353
	0.031372549	0.407843137	0.674509804
	0.168627451	0.549019608	0.745098039
	0.305882353	0.701960784	0.827450980
	0.482352941	0.800000000	0.768627451
	0.658823529	0.866666667	0.709803922
	0.800000000	0.921568627	0.772549020
	0.878431373	0.952941176	0.858823529
	0.968627451	0.988235294	0.941176471
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'hsv')
    hsl = rgb2hsl(cm);
    hsl = interp1(1:p, hsl, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsl);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

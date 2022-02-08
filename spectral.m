
function cm = spectral(n, opt_interp)
% Colormap: spectral

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
	0.619608000	0.003922000	0.258824000
	0.835294000	0.243137000	0.309804000
	0.956863000	0.427451000	0.262745000
	0.992157000	0.682353000	0.380392000
	0.996078000	0.878431000	0.545098000
	1.000000000	1.000000000	0.749020000
	0.901961000	0.960784000	0.596078000
	0.670588000	0.866667000	0.643137000
	0.400000000	0.760784000	0.647059000
	0.196078000	0.533333000	0.741176000
	0.368627000	0.309804000	0.635294000
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'lab')
    lab = rgb2lab(cm);
    lab = interp1(1:p, lab, linspace(1,p,n), 'linear');
    cm = lab2rgb(lab);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

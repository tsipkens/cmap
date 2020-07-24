
function cm = spectral(n, opt_interp)
% Colormap: spectral
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
    0.619608	0.003922	0.258824
    0.835294	0.243137	0.309804
    0.956863	0.427451	0.262745
    0.992157	0.682353	0.380392
    0.996078	0.878431	0.545098
    1.000000	1.000000	0.749020
    0.901961	0.960784	0.596078
    0.670588	0.866667	0.643137
    0.400000	0.760784	0.647059
    0.196078	0.533333	0.741176
    0.368627	0.309804	0.635294
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

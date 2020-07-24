
function cm = reds(n, opt_interp)
% Colormap: reds
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
    0.403922	0.000000	0.050980
    0.647059	0.058824	0.082353
    0.796078	0.094118	0.113725
    0.937255	0.231373	0.172549
    0.984314	0.415686	0.290196
    0.988235	0.572549	0.447059
    0.988235	0.733333	0.631373
    0.996078	0.878431	0.823529
    1.000000	0.960784	0.941176
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

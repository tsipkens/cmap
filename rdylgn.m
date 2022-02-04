
function cm = rdylgn(n, opt_interp)
% Colormap: rdylgn

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
	0.647059000	0.000000000	0.149020000
	0.843137000	0.188235000	0.152941000
	0.956863000	0.427451000	0.262745000
	0.992157000	0.682353000	0.380392000
	0.996078000	0.878431000	0.545098000
	1.000000000	1.000000000	0.749020000
	0.850980000	0.937255000	0.545098000
	0.650980000	0.850980000	0.415686000
	0.400000000	0.741176000	0.388235000
	0.101961000	0.596078000	0.313725000
	0.000000000	0.407843000	0.215686000
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

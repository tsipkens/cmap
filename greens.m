
function cm = greens(n, opt_interp)
% Colormap: greens

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
	0.000000000	0.266667000	0.105882000
	0.000000000	0.427451000	0.172549000
	0.137255000	0.545098000	0.270588000
	0.254902000	0.670588000	0.364706000
	0.454902000	0.768627000	0.462745000
	0.631373000	0.850980000	0.607843000
	0.780392000	0.913725000	0.752941000
	0.898039000	0.960784000	0.878431000
	0.968627000	0.988235000	0.960784000
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

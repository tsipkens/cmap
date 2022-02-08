
function cm = ylgnbu(n, opt_interp)
% Colormap: ylgnbu

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
	0.031373000	0.113725000	0.345098000
	0.145098000	0.203922000	0.580392000
	0.133333000	0.368627000	0.658824000
	0.113725000	0.568627000	0.752941000
	0.254902000	0.713725000	0.768627000
	0.498039000	0.803922000	0.733333000
	0.780392000	0.913725000	0.705882000
	0.929412000	0.972549000	0.694118000
	1.000000000	1.000000000	0.850980000
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


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
  	0.031373	0.113725	0.345098
  	0.145098	0.203922	0.580392
  	0.133333	0.368627	0.658824
  	0.113725	0.568627	0.752941
  	0.254902	0.713725	0.768627
  	0.498039	0.803922	0.733333
  	0.780392	0.913725	0.705882
  	0.929412	0.972549	0.694118
  	1	1	0.85098
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

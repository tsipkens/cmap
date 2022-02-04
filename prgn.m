
function cm = prgn(n, opt_interp)
% Colormap: prgn

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
	0.250980000	0.000000000	0.294118000
	0.462745000	0.164706000	0.513725000
	0.600000000	0.439216000	0.670588000
	0.760784000	0.647059000	0.811765000
	0.905882000	0.831373000	0.909804000
	0.968627000	0.968627000	0.968627000
	0.850980000	0.941176000	0.827451000
	0.650980000	0.858824000	0.627451000
	0.352941000	0.682353000	0.380392000
	0.105882000	0.470588000	0.215686000
	0.000000000	0.266667000	0.105882000
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

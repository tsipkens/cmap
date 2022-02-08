
function cm = bupu(n, opt_interp)
% Colormap: bupu

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
	0.301960784	0.000000000	0.294117647
	0.505882353	0.058823529	0.486274510
	0.533333333	0.254901961	0.615686275
	0.549019608	0.415686275	0.694117647
	0.549019608	0.588235294	0.776470588
	0.619607843	0.737254902	0.854901961
	0.749019608	0.827450980	0.901960784
	0.878431373	0.925490196	0.956862745
	0.968627451	0.988235294	0.992156863
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

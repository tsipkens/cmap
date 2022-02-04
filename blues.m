
function cm = blues(n, opt_interp)
% Colormap: blues

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
	0.031372549	0.188235294	0.419607843
	0.031372549	0.317647059	0.611764706
	0.129411765	0.443137255	0.709803922
	0.258823529	0.572549020	0.776470588
	0.419607843	0.682352941	0.839215686
	0.619607843	0.792156863	0.882352941
	0.776470588	0.858823529	0.937254902
	0.870588235	0.921568627	0.968627451
	0.968627451	0.984313725	1.000000000
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


function cm = puor(n, varargin)
% Colormap: puor

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
%-------------------------------------------------------------------------%

% Data for colormap:
cm = [
	0.176470588	0.000000000	0.294117647
	0.329411765	0.152941176	0.533333333
	0.501960784	0.450980392	0.674509804
	0.698039216	0.670588235	0.823529412
	0.847058824	0.854901961	0.921568627
	0.968627451	0.968627451	0.968627451
	0.996078431	0.878431373	0.713725490
	0.992156863	0.721568627	0.388235294
	0.878431373	0.509803922	0.078431373
	0.701960784	0.345098039	0.023529412
	0.498039216	0.231372549	0.031372549
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

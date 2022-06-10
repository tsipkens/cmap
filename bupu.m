
function cm = bupu(n, varargin)
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

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

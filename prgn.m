
function cm = prgn(n, varargin)
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

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

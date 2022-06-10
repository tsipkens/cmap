
function cm = reds(n, varargin)
% Colormap: reds

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
	0.403922000	0.000000000	0.050980000
	0.647059000	0.058824000	0.082353000
	0.796078000	0.094118000	0.113725000
	0.937255000	0.231373000	0.172549000
	0.984314000	0.415686000	0.290196000
	0.988235000	0.572549000	0.447059000
	0.988235000	0.733333000	0.631373000
	0.996078000	0.878431000	0.823529000
	1.000000000	0.960784000	0.941176000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

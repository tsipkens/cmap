
function cm = rdpu(n, varargin)
% Colormap: rdpu

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
	0.286275000	0.000000000	0.415686000
	0.478431000	0.003922000	0.466667000
	0.682353000	0.003922000	0.494118000
	0.866667000	0.203922000	0.592157000
	0.968627000	0.407843000	0.631373000
	0.980392000	0.623529000	0.709804000
	0.988235000	0.772549000	0.752941000
	0.992157000	0.878431000	0.866667000
	1.000000000	0.968627000	0.952941000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

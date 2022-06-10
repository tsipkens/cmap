
function cm = purples(n, varargin)
% Colormap: purples

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
	0.247059000	0.000000000	0.490196000
	0.329412000	0.152941000	0.560784000
	0.415686000	0.317647000	0.639216000
	0.501961000	0.490196000	0.729412000
	0.619608000	0.603922000	0.784314000
	0.737255000	0.741176000	0.862745000
	0.854902000	0.854902000	0.921569000
	0.937255000	0.929412000	0.960784000
	0.988235000	0.984314000	0.992157000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end


function cm = rdbu(n, varargin)
% Colormap: rdbu

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
	0.403922000	0.000000000	0.121569000
	0.698039000	0.094118000	0.168627000
	0.839216000	0.376471000	0.301961000
	0.956863000	0.647059000	0.509804000
	0.992157000	0.858824000	0.780392000
	0.968627000	0.968627000	0.968627000
	0.819608000	0.898039000	0.941176000
	0.572549000	0.772549000	0.870588000
	0.262745000	0.576471000	0.764706000
	0.129412000	0.400000000	0.674510000
	0.019608000	0.188235000	0.380392000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end


function cm = purd(n, varargin)
% Colormap: purd

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
	0.596078000	0.000000000	0.262745000
	0.807843000	0.070588000	0.337255000
	0.905882000	0.160784000	0.541176000
	0.874510000	0.396078000	0.690196000
	0.788235000	0.580392000	0.780392000
	0.831373000	0.725490000	0.854902000
	0.905882000	0.882353000	0.937255000
	0.968627000	0.956863000	0.976471000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

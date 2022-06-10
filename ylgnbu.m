
function cm = ylgnbu(n, varargin)
% Colormap: ylgnbu

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
	0.031373000	0.113725000	0.345098000
	0.145098000	0.203922000	0.580392000
	0.133333000	0.368627000	0.658824000
	0.113725000	0.568627000	0.752941000
	0.254902000	0.713725000	0.768627000
	0.498039000	0.803922000	0.733333000
	0.780392000	0.913725000	0.705882000
	0.929412000	0.972549000	0.694118000
	1.000000000	1.000000000	0.850980000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end


function cm = piyg(n, varargin)
% Colormap: piyg

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
	0.556863000	0.003922000	0.321569000
	0.772549000	0.105882000	0.490196000
	0.870588000	0.466667000	0.682353000
	0.945098000	0.713725000	0.854902000
	0.992157000	0.878431000	0.937255000
	0.968627000	0.968627000	0.968627000
	0.901961000	0.960784000	0.815686000
	0.721569000	0.882353000	0.525490000
	0.498039000	0.737255000	0.254902000
	0.301961000	0.572549000	0.129412000
	0.152941000	0.392157000	0.098039000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

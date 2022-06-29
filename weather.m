
function cm = weather(n, varargin)
% Colormap: weather

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
	0.0862745	0.3098039	0.3098039
    0.1882353	0.4078431	0.4509804
    0.4274510	0.6549020	0.6901961
    0.6078431	0.8039216	0.8117647
    0.9960784	0.9960784	0.9960784
    0.9215686	0.7921569	0.7490196
    0.7921569	0.5490196	0.4784314
    0.6235294	0.2627451	0.1725490
    0.5725490	0.1803922	0.1294118
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end


function cm = brbg(n, varargin)
% Colormap: brbg

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
	0.3294118	0.1882353	0.0196078
    0.5490196	0.3176471	0.0392157
    0.7490196	0.5058824	0.1764706
    0.8745098	0.7607843	0.4901961
    0.9647059	0.9098039	0.7647059
    0.9607843	0.9607843	0.9607843
    0.7803922	0.9176471	0.8980392
    0.5019608	0.8039216	0.7568627
    0.2078431	0.5921569	0.5607843
    0.0039216	0.4000000	0.3686275
    0.0000000	0.2352941	0.1882353
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

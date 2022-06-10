
function cm = pugnbu(n, varargin)
% Colormap: pugnbu

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
	0.003920000	0.274510000	0.211760000
	0.003920000	0.423530000	0.349020000
	0.007840000	0.505880000	0.541180000
	0.211760000	0.564710000	0.752940000
	0.403920000	0.662750000	0.811760000
	0.650980000	0.741180000	0.858820000
	0.815690000	0.819610000	0.901960000
	0.925490000	0.886270000	0.941180000
	1.000000000	0.968630000	0.984310000
];

% Modify the colormap by interpolation to match number of waypoints.
cm = tools.interpolate(cm, n, varargin{:});

end

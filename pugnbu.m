
function cm = pugnbu(n, opt_interp)
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

% by default, interpolate in rgb space
if ~exist('opt_interp','var'); opt_interp = []; end
if isempty(opt_interp); opt_interp = 'rgb'; end
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

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

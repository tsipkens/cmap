
function cm = fblue(n, opt_interp)
% Colormap: fblue

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
	0.000000000	0.063884000	0.331000000
	0.056699000	0.175945000	0.404130000
	0.000000000	0.202036000	0.478380000
	0.053521000	0.293868000	0.551760000
	0.052861000	0.351405000	0.625444000
	0.053808000	0.408988000	0.697508000
	0.000000000	0.443984000	0.768384000
	0.000000000	0.495669000	0.827150000
	0.128140000	0.586878000	0.872936000
	0.200116000	0.645932000	0.905294000
	0.291909000	0.700976000	0.925776000
	0.399050000	0.750753000	0.933726000
	0.505102000	0.795950000	0.940622000
	0.607839000	0.838115000	0.947526000
	0.708924000	0.877595000	0.954436000
	0.808261000	0.915060000	0.961350000
	0.907231000	0.950356000	0.968270000
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'lab')
    lab = rgb2lab(cm);
    lab = interp1(1:p, lab, linspace(1,p,n), 'linear');
    cm = lab2rgb(lab);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

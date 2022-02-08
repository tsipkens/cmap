
function cm = fred(n, opt_interp)
% Colormap: fred

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
	0.140093000	0.038191000	0.261400000
	0.232541000	0.039300000	0.282590000
	0.321704000	0.000000000	0.284157000
	0.409070000	0.016665000	0.289545000
	0.493682000	0.000000000	0.283621000
	0.576428000	0.000000000	0.283762000
	0.656818000	0.000000000	0.289311000
	0.739388000	0.000000000	0.291995000
	0.812372000	0.000000000	0.286445000
	0.870530000	0.077696000	0.328736000
	0.913148000	0.177303000	0.387123000
	0.942394000	0.270698000	0.440465000
	0.954946000	0.367560000	0.495066000
	0.962206000	0.454103000	0.551613000
	0.969754000	0.531159000	0.605729000
	0.977590000	0.602140000	0.659115000
	0.985523000	0.669758000	0.708849000
	0.993840000	0.733954000	0.759587000
];

%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp, 'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
elseif strcmp(opt_interp, 'hsv')
    hsl = rgb2hsl(cm);
    hsl = interp1(1:p, hsl, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsl);
elseif strcmp(opt_interp, 'none') % do nothing
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end

end

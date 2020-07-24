
function cm = fblue(n, opt_interp)
% Colormap: fblue
% Authors:	Timothy A. Sipkens

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


% data for colormap
cm = [
    0.000000	0.063884	0.331000
    0.056699	0.175945	0.404130
    0.000000	0.202036	0.478380
    0.053521	0.293868	0.551760
    0.052861	0.351405	0.625444
    0.053808	0.408988	0.697508
    0.000000	0.443984	0.768384
    0.000000	0.495669	0.827150
    0.128140	0.586878	0.872936
    0.200116	0.645932	0.905294
    0.291909	0.700976	0.925776
    0.399050	0.750753	0.933726
    0.505102	0.795950	0.940622
    0.607839	0.838115	0.947526
    0.708924	0.877595	0.954436
    0.808261	0.915060	0.961350
    0.907231	0.950356	0.968270
   ];


%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.
p = size(cm,1); % default size of colormap
if strcmp(opt_interp,'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');
    cm = hsv2rgb(hsv);
else
    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');
end


end

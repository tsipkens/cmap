
function cm = rdbu(n, opt_interp)
% Colormap: rdbu

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
  	0.019608	0.188235	0.380392
  	0.129412	0.4	0.67451
  	0.262745	0.576471	0.764706
  	0.572549	0.772549	0.870588
  	0.819608	0.898039	0.941176
  	0.968627	0.968627	0.968627
  	0.992157	0.858824	0.780392
  	0.956863	0.647059	0.509804
  	0.839216	0.376471	0.301961
  	0.698039	0.094118	0.168627
  	0.403922	0.000000	0.121569
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

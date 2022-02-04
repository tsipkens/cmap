
function cm = gnbu(n, opt_interp)
% Colormap: gnbu

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
  	0.031373	0.25098	0.505882
  	0.031373	0.407843	0.67451
  	0.168627	0.54902	0.745098
  	0.305882	0.701961	0.827451
  	0.482353	0.8	0.768627
  	0.658824	0.866667	0.709804
  	0.8	0.921569	0.772549
  	0.878431	0.952941	0.858824
  	0.968627	0.988235	0.941176
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

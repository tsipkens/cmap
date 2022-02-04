
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
  	0.140093	0.038191	0.2614
  	0.232541	0.0393	0.28259
  	0.321704	0.000000	0.284157
  	0.40907	0.016665	0.289545
  	0.493682	0.000000	0.283621
  	0.576428	0.000000	0.283762
  	0.656818	0.000000	0.289311
  	0.739388	0.000000	0.291995
  	0.812372	0.000000	0.286445
  	0.87053	0.077696	0.328736
  	0.913148	0.177303	0.387123
  	0.942394	0.270698	0.440465
  	0.954946	0.36756	0.495066
  	0.962206	0.454103	0.551613
  	0.969754	0.531159	0.605729
  	0.97759	0.60214	0.659115
  	0.985523	0.669758	0.708849
  	0.99384	0.733954	0.759587
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

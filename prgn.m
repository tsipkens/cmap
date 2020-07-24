
function cm = PrGn(n, opt_interp)
% Colormap: PrGn
% Source:   colorbrewer2
% Authors:	Cynthia Brewer and Mark Harrower

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
    0.250980	0.000000	0.294118
    0.462745	0.164706	0.513725
    0.600000	0.439216	0.670588
    0.760784	0.647059	0.811765
    0.905882	0.831373	0.909804
    0.968627	0.968627	0.968627
    0.850980	0.941176	0.827451
    0.650980	0.858824	0.627451
    0.352941	0.682353	0.380392
    0.105882	0.470588	0.215686
    0.000000	0.266667	0.105882
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

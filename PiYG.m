
function cm = PiYG(n, opt_interp)
% Colormap: PiYG
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
    0.556863	0.003922	0.321569
    0.772549	0.105882	0.490196
    0.870588	0.466667	0.682353
    0.945098	0.713725	0.854902
    0.992157	0.878431	0.937255
    0.968627	0.968627	0.968627
    0.901961	0.960784	0.815686
    0.721569	0.882353	0.525490
    0.498039	0.737255	0.254902
    0.301961	0.572549	0.129412
    0.152941	0.392157	0.098039
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


% LOAD_CMAP     Loads colormaps with the name corredponding
% Compiled by:  Timothy Sipkens
% Note:         Citations for colormaps can be found in the associated
%               README.md file.
%=========================================================================%

function cm = load_cmap(str,n,opt_interp)

data = load([str,'.mat']); % load corresponding colormap
cm = data.cm;

    
%-- Parse inputs ---------------------------------------------------------%
p = size(cm,1); % default size of colormap

if ~exist('n','var'); n = []; end
if isempty(n); n = 255; end % by default, output using 255 color

if ~exist('opt_interp','var'); opt_interp = []; end
if isempty(opt_interp); opt_interp = 'rgb'; end % by default, interpolate in rgb space
%-------------------------------------------------------------------------%


%-- Modify the colormap by interpolation ---------------------------------%
%   Note: Interpolation can be done in hsv or rgb space depending on
%   opt_interp.
if strcmp(opt_interp,'hsv')
    hsv = rgb2hsv(cm);
    hsv = interp1(1:p,hsv,linspace(1,p,n),'linear');
    cm = hsv2rgb(hsv);
else
    cm = interp1(1:p,cm,linspace(1,p,n),'linear');
end


end


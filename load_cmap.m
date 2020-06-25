
% LOAD_CMAP     Loads colormaps with the name corredponding
% Compiled by:  Timothy Sipkens
% Note:         Citations for colormaps can be found in the associated
%               README.md file.
%=========================================================================%

function cm = load_cmap(str,n,opt_interp)

load([str,'.mat']); % load corresponding colormap
    % colormaps are loaded as 'cm' variable into workspace

    
%-- Parse inputs ---------------------------------------------------------%
p = size(cm,1);
if ~exist('n','var'); n = []; end
if ~exist('opt_interp','var'); opt_interp = []; end

if isempty(n); n = p; end
if isempty(opt_interp); opt_interp = 'rgb'; end


%-- Modify the colormap, if n is specified -------------------------------%
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


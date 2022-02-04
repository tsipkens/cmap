
function cm = fgreen(n, opt_interp)
% Colormap: fgreen

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
  	0.035334	0.118855	0.30447
  	0.031343	0.180695	0.339215
  	0.030803	0.242783	0.374076
  	0.030519	0.30472	0.409037
  	0.034638	0.366239	0.444125
  	0.035727	0.426405	0.478862
  	0.034737	0.485539	0.512859
  	0.042595	0.544141	0.546644
  	0.047168	0.601405	0.57824
  	0.054824	0.658138	0.609158
  	0.077618	0.714024	0.640406
  	0.120622	0.768247	0.673075
  	0.173583	0.819322	0.706415
  	0.258701	0.865547	0.7445
  	0.364765	0.904825	0.784825
  	0.486317	0.936757	0.82707
  	0.619649	0.959624	0.870815
  	0.762028	0.979304	0.915633
  	0.911017	0.98711	0.960915
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

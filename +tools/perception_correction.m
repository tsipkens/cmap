
% PERCEPTION_CORRECTION  Roughly corrects produces colormap from set of colors.
%  Uses simple interpolation in LAB space, which may not always be
%  reliable. Users are encouraged to double check output. 
%  
%  CM - a set of input colors that act as waypoints
%  NNEW - the number of points in the new colormap
%  
%  AUTHOR: Timothy Sipkens, 2022-06-09

function cm = perception_correction(cm, nnew)

% Use LAB space for perception.
lab = rgb2lab(cm);
l = lab(:,1)';
a = lab(:,2)';
b = lab(:,3)';

% Original L positions for colors.
idx = round((l - min(l)) ./ (max(l) - min(l)) .* nnew);

% New position.
vecnew = 1:nnew;

% Perception based on new position.
pu = linspace(min(l), max(l), nnew);

% Interpolate for new colormap.
anew = interp1(idx, a, vecnew);
bnew = interp1(idx, b, vecnew);
cm = lab2rgb([pu', anew', bnew']);
cm = max(min(cm, 1), 0);

end


% RGB2HEX  Convert RGB coordinates into the corresponding HEX string.
%  Author: Timothy Sipkens, 2021-03-01

function [hex] = rgb2hex(rgb, f_one)

% If not supplied, assume RGB can be interpreting based on max value.
% If supplied, f_one=0 forces program to assume colours span 0->255.
% This may be is necessary to convert dark greys, 
% i.e., when [1,0,0] is off-black, not red. 
if ~exist('f_one', 'var'); f_one = []; end
if isempty(f_one); f_one = 1; end


% If max(rgb)<=1, then RGB is expected to be 0->1. 
% Convert to 0->255.
if and(max(rgb(:))<=1, f_one==1)
    rgb = rgb * 255;
end


% HEX requires rounded numbers.
rgb = round(rgb); 


% Convert to HEX.
hex = reshape(sprintf('#%02X%02X%02X', rgb'), 7, [])';
hex = num2cell(hex, 2);  % convert to cell for easier copying

end

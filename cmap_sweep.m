
% CMAP_SWEEP A function to set the color order of plot to sweep through n colors.
% Timothy Sipkens, 2020-06-26
%
% Inputs:
%   n         The number of lines that will be plotted / colors to sweep through.
%   cm        Colormap that is used to specify the ColorOrder.
%=========================================================================%

function [cm2] = cmap_sweep(n,cm)


if ~exist('cm','var'); cm = []; end
if isempty(cm); cm = colormap('gray'); end % by default use grayscale


% determine positions in colormap to use
n1 = floor(size(cm,1)/n); % interval between colormap indices
n2 = length(cm)-n*n1+1;   % starting index, i.e. mod(cm,n) does not always equal 0
cm2 = cm(n2:n1:end,:);    % adjust colormap to appropriate size


set(gca,'ColorOrder',cm2,'NextPlot','replacechildren');
    % set ColorOrder for current axis

    
if nargout==0; clear cm2; end % suppress output if none required

end


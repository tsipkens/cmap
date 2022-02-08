
% WRITE_CMAPS  Write MATLAB scripts.
% Note: Requires 'data' subfolder, containing colormap CSV, to work.
% Author: Timothy Sipkens, 2019
%================================================================%

clear;

fn = dir(fullfile('','data/*.csv'));

for ii=1:length(fn)
    if ~strcmp(fn(ii).name, 'cmap_sweep.m') % skip test data file
        % cmap_name = fn(ii).name(1:(end-4));
        cmap_name = fn(ii).name(1:(end-4));
        cm = csvread(['data/', cmap_name, '.csv']);
        
        txt = '\n';
        txt = strcat(txt, "function cm = ", cmap_name, "(n, opt_interp)\n");
        txt = strcat(txt, "%% Colormap: ", cmap_name, "\n\n");
        
        txt = strcat(txt, "%%-- Parse inputs ---------------------------------------------------------%%\n");
        txt = strcat(txt, "if ~exist('n', 'var'); n = []; end\n");
        txt = strcat(txt, "if isempty(n)\n");
        txt = strcat(txt, "   f = get(groot,'CurrentFigure');\n");
        txt = strcat(txt, "   if isempty(f)\n");
        txt = strcat(txt, "      n = size(get(groot,'DefaultFigureColormap'),1);\n");
        txt = strcat(txt, "   else\n");
        txt = strcat(txt, "      n = size(f.Colormap,1);\n");
        txt = strcat(txt, "   end\n");
        txt = strcat(txt, "end\n\n");

        txt = strcat(txt, "%% by default, interpolate in rgb space\n");
        txt = strcat(txt, "if ~exist('opt_interp','var'); opt_interp = []; end\n");
        txt = strcat(txt, "if isempty(opt_interp); opt_interp = 'rgb'; end\n");
        txt = strcat(txt, "%%-------------------------------------------------------------------------%%\n\n");
        
        txt = strcat(txt, "%% Data for colormap:\n");
        txt = strcat(txt, "cm = [\n\t");
        
        %== Format colormap data ===========================%
        a = mat2str(cm, 9);
        a(1) = [];
        a(end) = [];
        a = strrep(a, ';', ' ');
        
        % Split and append zeros.
        n = 11;  % number of total digits
        b = split(a);
        for jj=1:length(b)
            if length(b{jj}) == 1
                b{jj} = [b{jj}, '.', repmat('0', [1,n - 2])];
            elseif(length(b{jj}) <= 11)
                b{jj} = [b{jj}, repmat('0', [1,n - length(b{jj})])];
            end
        end
        b = reshape(b, [3, length(b)/3])';
        
        % Recompile into string.
        d = "";
        for jj=1:size(b, 1)
            d = strcat(d, b{jj,1}, "\t", b{jj,2}, "\t", b{jj,3}, "\n");
            if jj ~= size(b, 1); d = strcat(d, "\t"); end  % append spaces for next line
        end
        a = d;
        %===================================================%
        
        txt = strcat(txt, a);
        txt = strcat(txt, "];\n\n");
        
        txt = strcat(txt, "%%-- Modify the colormap by interpolation ---------------------------------%%\n");
        txt = strcat(txt, "%%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.\n");
        txt = strcat(txt, "p = size(cm,1); %% default size of colormap\n");
        txt = strcat(txt, "if strcmp(opt_interp, 'hsv')\n");
        txt = strcat(txt, "    hsv = rgb2hsv(cm);\n");
        txt = strcat(txt, "    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');\n");
        txt = strcat(txt, "    cm = hsv2rgb(hsv);\n");
        txt = strcat(txt, "elseif strcmp(opt_interp, 'lab')\n");
        txt = strcat(txt, "    lab = rgb2lab(cm);\n");
        txt = strcat(txt, "    lab = interp1(1:p, lab, linspace(1,p,n), 'linear');\n");
        txt = strcat(txt, "    cm = lab2rgb(lab);\n");
        txt = strcat(txt, "elseif strcmp(opt_interp, 'none') %% do nothing\n");
        txt = strcat(txt, "else\n");
        txt = strcat(txt, "    cm = interp1(1:p, cm, linspace(1,p,n), 'linear');\n");
        txt = strcat(txt, "end\n\n");

        txt = strcat(txt, "end\n");
        
        fid = fopen([cmap_name,'.m'], 'w');
        fprintf(fid, txt);
        fclose(fid);
    end
end


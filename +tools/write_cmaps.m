
% WRITE_CMAPS  Write MATLAB scripts
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
        txt = strcat(txt, "cm = ");
        
        % OPTION A: Using mat2str.
        a = mat2str(cm, 9);
        a = strrep(a, ';', '\n   ');
        a = strrep(a, '[', '[\n   ');
        a = strrep(a, ']', '\n];\n\n');
        a = strrep(a, ' 0', '\t0');
        a = strrep(a, ' 1', '\t1');
        a = strrep(a, '0\t', '0.000000\t');
        
        %{
        % OPTION B: Using num2str.
        a = num2str(cm);
        a = strcat(a, ';');
        a = a';
        a = a(:)';
        a = strrep(a, ';', '\n   ');
        a = ['[\n   ', a, '];\n\n'];
        a = strrep(a, '   ];', '];');
        %}
        
        txt = strcat(txt, a);
        
        txt = strcat(txt, "%%-- Modify the colormap by interpolation ---------------------------------%%\n");
        txt = strcat(txt, "%%   Note: Interpolation can be done in hsv or rgb space depending on opt_interp.\n");
        txt = strcat(txt, "p = size(cm,1); %% default size of colormap\n");
        txt = strcat(txt, "if strcmp(opt_interp, 'hsv')\n");
        txt = strcat(txt, "    hsv = rgb2hsv(cm);\n");
        txt = strcat(txt, "    hsv = interp1(1:p, hsv, linspace(1,p,n), 'linear');\n");
        txt = strcat(txt, "    cm = hsv2rgb(hsv);\n");
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


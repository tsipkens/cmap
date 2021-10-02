# Perceptually improved colormaps for MATLAB

This repository contains files for colormaps, mostly compiled from multiple, external sources (see [dedicated section below](#colormap-sources)), with some *custom* colormaps that are specific to this package. The first step in their use is to add the parent folder to the sample project, e.g., 

```Matlab
addpath cmap; % add cmap folder to the Matlab path
```

Then colormaps can be loaded by calling the functions that shares their name. For example, you can get the color data for the viridis colormap using, 

```Matlab
cm = viridis; % return colormap data to cm
```

or apply it to a plot using

```Matlab
colormap(viridis); % apply viridis to a plot
```

Optional arguments to these functions allow for changing the number of colors in the colormap. For example, getting the 100-color equivalent of viridis, 

```Matlab
viridis(100); % interpolate to 100 colors in RGB space
```

By default, this will use linear interpolation in RGB space. Alternatively, interpolation can be done in HSV space by appending `'hsv'` as an additional argument: 

```Matlab
viridis(100, 'hsv'); % interpolate to 100 colors in HSV space
```

Note that the *deep*, *dense*, *matter*, and *tempo* colormaps are reversed from their original order, such that the darker color is always first. The colormaps, and swages indicating their color progression, are included at the end of this README. 

## Colormap sources

Sources of these colormaps include:

### matplotlib/mpl
Colormaps designed by Stéfan van der Walt (https://github.com/stefanv) and Nathaniel Smith (https://github.com/njsmith). More information is available at https://bids.github.io/colormap/. Released under a [CCO license](https://creativecommons.org/about/cc0). You can learn more about the science behind the creation of these kinds of colormaps by watching their presentation of viridis: https://youtu.be/xAoljeRJ3lU. The cividis colormap is a variant of  ‘viridis’ developed by Jamie R. Nuñez, Christopher R. Anderton, and Ryan S. Renslow. 

### cmocean
More information is available at https://matplotlib.org/cmocean/. Released under a [MIT license](https://opensource.org/licenses/MIT). The colormaps are associated with: Kristen M. Thyng, Chad A. Greene, Robert D. Hetland, Heather M. Zimmerle, and Steven F. DiMarco. True colors of oceanography: Guidelines for effective and accurate colormap selection. Oceanography, September 2016. http://dx.doi.org/10.5670/oceanog.2016.66.

### colorbrewer2
Colormaps by Cynthia Brewer and Mark Harrower. More information available at http://colorbrewer2.org/. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt). 
    
### cmasher
A collection of scientific colormaps for making accessible, informative and *cmashing* plots in Python. More information available at https://github.com/1313e/CMasher and https://cmasher.readthedocs.io/. Released under a [BSD 3-Clause License](https://github.com/1313e/CMasher/blob/master/LICENSE).

### turbo
A. Mikhailov. Turbo, An Improved Rainbow Colormap for Visualization. More information is available at https://ai.googleblog.com/2019/08/turbo-improved-rainbow-colormap-for.html. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt). 

### seaborn

Originally for Python by [Michael Waskom](https://mwaskom.github.io/). For supporting discussion see README at https://github.com/mwaskom/seaborn and https://seaborn.pydata.org/tutorial/color_palettes.html. Released under a [BSD 3-Clause License](https://github.com/mwaskom/seaborn/blob/master/LICENSE). 

### custom
A set of custom colormaps specific to this package. 

## Sweep through colormap (cmap_sweep)

A function is also included to sweep through colors in a standard Matlab plot. To demonstrate we first generate some synthetic data with a set number of lines:

```Matlab
n_lines = 40; % number of lines to plot

addpath supplement; % add supplemental functions / scripts

% generate test data
y = test_data(round(n_lines*2.5), 300);
y = y(:, 1:n_lines);
```

Then, one can sweep through the viridis colormap using: 

```Matlab
figure(1);
cmap_sweep(n_lines, inferno); % set colororder for plot
plot(y); % plot data
```

A sample plot generated using this procedure (Sipkens et al., Submitted):

<img src="docs/cmap_sweep.jpg" width="350px">

------

### Sequential colormaps

Sequential colormaps have a monotonic change in perceived brightness. 

#### matplotlib/mpl

![cividis](docs/cividis.jpg) *cividis*

![inferno](docs/inferno.jpg) *inferno*

![magma](docs/magma.jpg) *magma*

![plasma](docs/plasma.jpg) *plasma*

![viridis](docs/viridis.jpg) *viridis*

#### cmocean

![deep](docs/deep.jpg) *deep*

![dense](docs/dense.jpg) *dense*

![haline](docs/haline.jpg) *haline*

![ice](docs/ice.jpg) *ice*

![matter](docs/matter.jpg) *matter*

![speed](docs/speed.jpg) *speed*

![tempo](docs/tempo.jpg) *tempo*

![thermal](docs/thermal.jpg) *thermal*

#### colorbrewer2

![blues](docs/blues.jpg) *blues*

![BuPu](docs/BuPu.jpg) *bupu*

![GnBu](docs/GnBu.jpg) *gnbu*

![greens](docs/greens.jpg) *greens*

![PuRd](docs/PuRd.jpg) *purd*

![purples](docs/purples.jpg) *purples*

![RdPu](docs/RdPu.jpg) *rdpu*

![reds](docs/reds.jpg) *reds*

![YlGnBu](docs/YlGnBu.jpg) *ylgnbu*

#### cmasher

![eclipse](docs/eclipse.jpg) *eclipse*

![ember](docs/ember.jpg) *ember*

![lavender](docs/lavender.jpg) *lavender*

![nuclear](docs/nuclear.jpg) *nuclear*

![ocean](docs/ocean.jpg) *ocean*

![rainforest](docs/rainforest.jpg) *rainforest*

#### seaborn

![rocket](docs/rocket.jpg) *rocket*

![mako](docs/mako.jpg) *mako*

![flare](docs/flare.jpg) *flare*

![crest](docs/crest.jpg) *crest*

#### custom (only approximately perceptually uniform):

![fblue](docs/fblue.jpg) *fblue*

![fgreen](docs/fgreen.jpg) *fgreen*

![fred](docs/fred.jpg) *fred*

![fred](docs/internet.jpg) *internet*

------

### Divergent colormaps

Divergent colormaps have the brightest or darkest color in the middle, with a monotonic change in perceived brightness in either direction. 

#### cmocean

![balanced](docs/balanced.jpg) *balanced* (originally balance, name conflict in Matlab)

![curl](docs/curl.jpg) *curl*

![delta](docs/delta.jpg) *delta*

#### colorbrewer2

![RdBu](docs/RdBu.jpg) *rdbu*

![RdYlGn](docs/RdYlGn.jpg) *rdylgn*

![PiYG](docs/PiYG.jpg) *piyg*

![PrGn](docs/PrGn.jpg) *prgn*

![PuOr](docs/PuOr.jpg) *puor*

![spectral](docs/spectral.jpg) *spectral*

------

### Rainbow colormaps

![turbo](docs/turbo.jpg) *turbo* (dedicated source)

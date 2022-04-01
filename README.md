
# Perceptually uniform colormaps for MATLAB

**NOTE**: All rights to the original authors. For licensing see information for individual sources in [Colormap sources](#colormap-sources). Custom colormaps new to this work are released under a [MIT License](https://opensource.org/licenses/MIT).

---

This repository contains files for colormaps, mostly compiled from multiple, external sources (see [dedicated section below](#colormap-sources)), with some _custom_ colormaps that are specific to this package. The first step in their use is to add the parent folder to the sample project, e.g.,

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

Note that the _deep_, _dense_, _matter_, and _tempo_ colormaps are reversed from their original order, such that the darker color is always first. The colormaps, and swages indicating their color progression, are included at the end of this README.

## Colormap sources

Sources of these colormaps include:

### matplotlib

Colormaps designed by Stéfan van der Walt (https://github.com/stefanv) and Nathaniel Smith (https://github.com/njsmith). More information is available at https://bids.github.io/colormap/. Released under a [CCO license](https://creativecommons.org/about/cc0). You can learn more about the science behind the creation of these kinds of colormaps by watching their presentation of viridis: https://youtu.be/xAoljeRJ3lU. The cividis colormap is a variant of ‘viridis’ developed by Jamie R. Nuñez, Christopher R. Anderton, and Ryan S. Renslow.

### cmocean

More information is available at https://matplotlib.org/cmocean/. Released under a [MIT license](https://opensource.org/licenses/MIT). The colormaps are associated with: Kristen M. Thyng, Chad A. Greene, Robert D. Hetland, Heather M. Zimmerle, and Steven F. DiMarco. True colors of oceanography: Guidelines for effective and accurate colormap selection. Oceanography, September 2016. http://dx.doi.org/10.5670/oceanog.2016.66.

### colorbrewer

Colormaps by Cynthia Brewer and Mark Harrower. More information available at http://colorbrewer2.org/. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt). For diverging colormaps, the order of colors was made consistent with the the colormap names. For sequential colormaps, orders were adjusted such that darkest colors appear first. Original colormaps can be restored by using MATLAB's built-in `flipud(...)` function of the altered colormaps. 

### cmasher

A collection of scientific colormaps for making accessible, informative and _cmashing_ plots in Python. More information available at https://github.com/1313e/CMasher and https://cmasher.readthedocs.io/. Released under a [BSD 3-Clause License](https://github.com/1313e/CMasher/blob/master/LICENSE).

### turbo

A. Mikhailov. Turbo, An Improved Rainbow Colormap for Visualization. More information is available at https://ai.googleblog.com/2019/08/turbo-improved-rainbow-colormap-for.html. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt).

### seaborn

Originally for Python by [Michael Waskom](https://mwaskom.github.io/). For supporting discussion see README at https://github.com/mwaskom/seaborn and https://seaborn.pydata.org/tutorial/color_palettes.html. Released under a [BSD 3-Clause License](https://github.com/mwaskom/seaborn/blob/master/LICENSE).

### scientific

A set of scientific colour maps by [Fabio Crameri](https://www.fabiocrameri.ch/colourmaps/). Released under an [MIT License](https://opensource.org/licenses/MIT). Citable at:

> Crameri, F. (2018). Scientific colour maps. Zenodo. http://doi.org/10.5281/zenodo.1243862

### custom

A set of custom colormaps specific to this package.The custom colormaps are only approximately perceptually uniform.

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

---

## Sequential colormaps

Sequential colormaps have a monotonic change in perceived brightness. 

### matplotlib

![cividis](docs/cividis.jpg) _cividis_

![inferno](docs/inferno.jpg) _inferno_

![magma](docs/magma.jpg) _magma_

![plasma](docs/plasma.jpg) _plasma_

![viridis](docs/viridis.jpg) _viridis_

### cmocean

![deep](docs/deep.jpg) _deep_

![dense](docs/dense.jpg) _dense_

![haline](docs/haline.jpg) _haline_

![ice](docs/ice.jpg) _ice_

![matter](docs/matter.jpg) _matter_

![speed](docs/speed.jpg) _speed_

![tempo](docs/tempo.jpg) _tempo_

![thermal](docs/thermal.jpg) _thermal_

### colorbrewer

![blues](docs/blues.jpg) _blues_

![BuPu](docs/BuPu.jpg) _bupu_

![GnBu](docs/GnBu.jpg) _gnbu_

![greens](docs/greens.jpg) _greens_

![PuGnBu](docs/pugnbu.jpg) _pugnbu_

![PuRd](docs/PuRd.jpg) _purd_

![purples](docs/purples.jpg) _purples_

![RdPu](docs/RdPu.jpg) _rdpu_

![reds](docs/reds.jpg) _reds_

![YlGnBu](docs/YlGnBu.jpg) _ylgnbu_

### cmasher

![eclipse](docs/eclipse.jpg) _eclipse_

![ember](docs/ember.jpg) _ember_

![lavender](docs/lavender.jpg) _lavender_

![nuclear](docs/nuclear.jpg) _nuclear_

![ocean](docs/ocean.jpg) _ocean_

![rainforest](docs/rainforest.jpg) _rainforest_

### seaborn

![crest](docs/crest.jpg) _crest_

![flare](docs/flare.jpg) _flare_

![mako](docs/mako.jpg) _mako_

![rocket](docs/rocket.jpg) _rocket_

### scientific

![acton](docs/acton.jpg) _acton_

![buda](docs/buda.jpg) _buda_

![devon](docs/devon.jpg) _devon_

![hawaii](docs/hawaii.jpg) _hawaii_

![imola](docs/imola.jpg) _imola_

![lajolla](docs/lajolla.jpg) _lajolla_

![oslo](docs/oslo.jpg) _oslo_

![tokyo](docs/tokyo.jpg) _tokyo_

### custom

![fblue](docs/fblue.jpg) _fblue_

![fgreen](docs/fgreen.jpg) _fgreen_

![fred](docs/fred.jpg) _fred_

![fred](docs/internet.jpg) _internet_

---

## Divergent colormaps

Divergent colormaps have the brightest or darkest color in the middle, with a monotonic change in perceived brightness in either direction.The colorbrewer colormaps are 

### cmocean

![balanced](docs/balanced.jpg) _balanced_ (originally balance, name conflict in Matlab)

![curl](docs/curl.jpg) _curl_

![delta](docs/delta.jpg) _delta_

### colorbrewer

![RdBu](docs/RdBu.jpg) _rdbu_

![RdYlGn](docs/RdYlGn.jpg) _rdylgn_

![PiYG](docs/PiYG.jpg) _piyg_

![PrGn](docs/PrGn.jpg) _prgn_

![PuOr](docs/PuOr.jpg) _puor_

![spectral](docs/spectral.jpg) _spectral_

### scientific

![cork](docs/cork.jpg) _cork_

![roma](docs/roma.jpg) _roma_

![vik](docs/vik.jpg) _vik_

---

## Cyclic/rainbow colormaps

### scientific

![bamo](docs/bamo.jpg) _bamo_

![corko](docs/corko.jpg) _corko_

![romao](docs/romao.jpg) _romao_

![viko](docs/viko.jpg) _viko_

### Other

![turbo](docs/turbo.jpg) _turbo_ (dedicated source)

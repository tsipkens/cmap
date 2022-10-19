
# Perceptually uniform colormaps for MATLAB

**NOTE**: All rights to the original authors. For licensing see information for individual sources in [Colormap sources](#colormap-sources). Custom colormaps new to this work are released under a [MIT License](https://opensource.org/licenses/MIT).

---

This repository contains files for colormaps, mostly compiled from multiple, external sources (see [dedicated section below](#colormap-sources)), with some _custom_ colormaps that are specific to this package. After making a copy of the folder locally, the next step in their use is to add the parent folder to the sample project, e.g., 

```Matlab
addpath cmap; % add cmap folder to the MATLAB path
```

Then colormaps can be loaded by calling the functions that share their name. For example, you can get the color data for the viridis colormap using,

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

Colormaps by Cynthia Brewer and Mark Harrower. More information available at http://colorbrewer2.org/. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt). For diverging colormaps, the order of colors was made consistent with the colormap names. For sequential colormaps, orders were adjusted such that darkest colors appear first. Original colormaps can be restored by using MATLAB's built-in `flipud(...)` function of the altered colormaps.

### cmasher

A collection of scientific colormaps for making accessible, informative and _cmashing_ plots in Python. More information is available at https://github.com/1313e/CMasher and https://cmasher.readthedocs.io/. Released under a [BSD 3-Clause License](https://github.com/1313e/CMasher/blob/master/LICENSE).

### turbo

A. Mikhailov. Turbo, An Improved Rainbow Colormap for Visualization. More information is available at https://ai.googleblog.com/2019/08/turbo-improved-rainbow-colormap-for.html. Released under an [Apache License](https://www.apache.org/licenses/LICENSE-2.0.txt).

### seaborn

Originally for Python by [Michael Waskom](https://mwaskom.github.io/). For supporting discussion see README at https://github.com/mwaskom/seaborn and https://seaborn.pydata.org/tutorial/color_palettes.html. Released under a [BSD 3-Clause License](https://github.com/mwaskom/seaborn/blob/master/LICENSE).

### scientific

A set of scientific colour maps by [Fabio Crameri](https://www.fabiocrameri.ch/colourmaps/). Released under an [MIT License](https://opensource.org/licenses/MIT). Citable at:

> Crameri, F. (2018). Scientific colour maps. Zenodo. http://doi.org/10.5281/zenodo.1243862

### custom

A set of custom colormaps specific to this package. The custom colormaps are only approximately perceptually uniform.

### Other resources

A catalogue of colormaps for Julia can be found here: [Catalogue of ColorSchemes](https://juliagraphics.github.io/ColorSchemes.jl/stable/catalogue).

## Sweep through colormap

The `cmap_sweep(n, cm)` function is also included to sweep through colours in a standard MATLAB plot. To demonstrate we first generate some synthetic data with a set number of lines:

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

# Catalogue

## Sequential colormaps

Sequential colormaps have a monotonic change in perceived brightness. Colormaps consistently proceed from the darkest to the lightest colour.

### matplotlib

<img src="docs/cividis.jpg" width="74%" height="25"> _cividis_

<img src="docs/inferno.jpg" width="74%" height="25"> _inferno_

<img src="docs/magma.jpg" width="74%" height="25"> _magma_

<img src="docs/plasma.jpg" width="74%" height="25"> _plasma_

<img src="docs/viridis.jpg" width="74%" height="25"> _viridis_

### cmocean

<img src="docs/deep.jpg" width="74%" height="25"> _deep_

<img src="docs/dense.jpg" width="74%" height="25"> _dense_

<img src="docs/haline.jpg" width="74%" height="25"> _haline_

<img src="docs/oxy.jpg" width="74%" height="25"> _oxy_

<img src="docs/ice.jpg" width="74%" height="25"> _ice_

<img src="docs/matter.jpg" width="74%" height="25"> _matter_

<img src="docs/speed.jpg" width="74%" height="25"> _speed_

<img src="docs/tempo.jpg" width="74%" height="25"> _tempo_

<img src="docs/thermal.jpg" width="74%" height="25"> _thermal_

### colorbrewer

<img src="docs/blues.jpg" width="74%" height="25"> _blues_

<img src="docs/BuPu.jpg" width="74%" height="25"> _bupu_

<img src="docs/GnBu.jpg" width="74%" height="25"> _gnbu_

<img src="docs/greens.jpg" width="74%" height="25"> _greens_

<img src="docs/pugnbu.jpg" width="74%" height="25"> _pugnbu_

<img src="docs/PuRd.jpg" width="74%" height="25"> _purd_

<img src="docs/purples.jpg" width="74%" height="25"> _purples_

<img src="docs/RdPu.jpg" width="74%" height="25"> _rdpu_

<img src="docs/reds.jpg" width="74%" height="25"> _reds_

<img src="docs/YlGnBu.jpg" width="74%" height="25"> _ylgnbu_

### cmasher

<img src="docs/eclipse.jpg" width="74%" height="25"> _eclipse_

<img src="docs/ember.jpg" width="74%" height="25"> _ember_

<img src="docs/lavender.jpg" width="74%" height="25"> _lavender_

<img src="docs/nuclear.jpg" width="74%" height="25"> _nuclear_

<img src="docs/ocean.jpg" width="74%" height="25"> _ocean_

<img src="docs/rainforest.jpg" width="74%" height="25"> _rainforest_

### seaborn

<img src="docs/crest.jpg" width="74%" height="25"> _crest_

<img src="docs/flare.jpg" width="74%" height="25"> _flare_

<img src="docs/mako.jpg" width="74%" height="25"> _mako_

<img src="docs/rocket.jpg" width="74%" height="25"> _rocket_

### scientific

<img src="docs/acton.jpg" width="74%" height="25"> _acton_

<img src="docs/buda.jpg" width="74%" height="25"> _buda_

<img src="docs/devon.jpg" width="74%" height="25"> _devon_

<img src="docs/hawaii.jpg" width="74%" height="25"> _hawaii_

<img src="docs/imola.jpg" width="74%" height="25"> _imola_

<img src="docs/lajolla.jpg" width="74%" height="25"> _lajolla_

<img src="docs/oslo.jpg" width="74%" height="25"> _oslo_

<img src="docs/tokyo.jpg" width="74%" height="25"> _tokyo_

### custom

<img src="docs/fblue.jpg" width="74%" height="25"> _fblue_

<img src="docs/fgreen.jpg" width="74%" height="25"> _fgreen_

<img src="docs/fred.jpg" width="74%" height="25"> _fred_

<img src="docs/fpurple.jpg" width="74%" height="25"> _fpurple_

<img src="docs/internet.jpg" width="74%" height="25"> _internet_

<img src="docs/fmviz.jpg" width="74%" height="25"> _fmviz_

## Divergent colormaps

Divergent colormaps have the brightest or darkest color in the middle, with a monotonic change in perceived brightness in either direction. Note that the colorbrewer colormaps are in the order of the characters (for example, _RdBu_ starts with red and goes to blue). The _balance_ colormap from cmocean has been renamed to _balanced_, to avoid a name conflict with a native MATLAB function.

### cmocean

<img src="docs/balanced.jpg" width="74%" height="25"> _balanced_

<img src="docs/curl.jpg" width="74%" height="25"> _curl_

<img src="docs/delta.jpg" width="74%" height="25"> _delta_

### colorbrewer

<img src="docs/brbg.jpg" width="74%" height="25"> _brbg_

<img src="docs/RdBu.jpg" width="74%" height="25"> _rdbu_

<img src="docs/RdYlGn.jpg" width="74%" height="25"> _rdylgn_

<img src="docs/PiYG.jpg" width="74%" height="25"> _piyg_

<img src="docs/PrGn.jpg" width="74%" height="25"> _prgn_

<img src="docs/PuOr.jpg" width="74%" height="25"> _puor_

<img src="docs/spectral.jpg" width="74%" height="25"> _spectral_

### scientific

<img src="docs/cork.jpg" width="74%" height="25"> _cork_

<img src="docs/roma.jpg" width="74%" height="25"> _roma_

<img src="docs/vik.jpg" width="74%" height="25"> _vik_

### custom

<img src="docs/weather.jpg" width="74%" height="25"> _weather_

### turbo

<img src="docs/turbo.jpg" width="74%" height="25"> _turbo_

## Cyclic colormaps

These colormaps start and end with the same colour.

### scientific

<img src="docs/bamo.jpg" width="74%" height="25"> _bamo_

<img src="docs/corko.jpg" width="74%" height="25"> _corko_

<img src="docs/romao.jpg" width="74%" height="25"> _romao_

<img src="docs/viko.jpg" width="74%" height="25"> _viko_

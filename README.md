# Perceptually improved colormaps for MATLAB

*Last updated: May 19, 2020*

These `.mat` files compile colormaps from multiple primary sources:

1. *matplotlib* - Colormaps designed by Stéfan van der Walt and
Nathaniel Smith. (More information is available at https://bids.github.io/colormap/).
2. *cmocean* - Kristen M. Thyng, Chad A. Greene, Robert D. Hetland, Heather M. Zimmerle,
and Steven F. DiMarco. True colors of oceanography: Guidelines for effective
and accurate colormap selection. Oceanography, September 2016.  
http://dx.doi.org/10.5670/oceanog.2016.66 (More information is available at
https://matplotlib.org/cmocean/).
3. *colorbrewer2* - Colormaps by Cynthia Brewer and Mark Harrower. (More information
    available at http://colorbrewer2.org/).
4. CMasher - A collection of scientific colormaps for making accessible, informative and *cmashing* plots in Python. (More information available at https://github.com/1313e/CMasher and https://cmasher.readthedocs.io/). 
5. *turbo* - A. Mikhailov. Turbo, An Improved Rainbow Colormap for Visualization.
    (More information is available at https://ai.googleblog.com/2019/08/turbo-improved-rainbow-colormap-for.html).

When loaded directly, the colormaps will appear as the variable `cm` in the
workspace. Otherwise `load_cmap` can be used to load the colormap specified
by a string, `str`, containing the colormap name. The function `load_cmap(str,n)`
also takes `n` as a second input, which can be used reduce or increase (by interpolation)
the number of colors in the colormap, while still respecting the color order.

It is also noted that the *deep*, *dense*, *matter*, and *tempo* colormaps
are reversed from their original order, such that the darker color is
always first.

The colormaps, and swages indicating their color progression, are included below. Custom colormaps are specific to this package. 

## Sequantial colormaps

##### From matplotlib/mpl colormaps:

![viridis](docs/viridis.jpg) *viridis*

![inferno](docs/inferno.jpg) *inferno*

![plasma](docs/plasma.jpg) *plasma*

![magma](docs/magma.jpg) *magma*

![cividis](docs/cividis.jpg) *cividis*

##### From cmocean:

![thermal](docs/thermal.jpg) *thermal*

![haline](docs/haline.jpg) *haline*

![ice](docs/ice.jpg) *ice*

![deep](docs/deep.jpg) *deep*

![dense](docs/dense.jpg) *dense*

![matter](docs/matter.jpg) *matter*

![tempo](docs/tempo.jpg) *tempo*

![speed](docs/speed.jpg) *speed*

##### From colorbrewer2:

![YlGnBu](docs/YlGnBu.jpg) *YlGnBu*

![GnBu](docs/GnBu.jpg) *GnBu*

![BuPu](docs/BuPu.jpg) *BuPu*

![RdPu](docs/RdPu.jpg) *RdPu*

![PuRd](docs/PuRd.jpg) *PuRd*

![purples](docs/purples.jpg) *purples*

![blues](docs/blues.jpg) *blues*

![greens](docs/greens.jpg) *greens*

![reds](docs/reds.jpg) *reds*

##### From CMasher:

![eclipse](docs/eclipse.jpg) *eclipse*

![rainforest](docs/rainforest.jpg) *rainforest*

![ember](docs/ember.jpg) *ember*

![nuclear](docs/nuclear.jpg) *nuclear*

![lavender](docs/lavender.jpg) *lavender*

![ocean](docs/ocean.jpg) *ocean*

##### Custom (only approximately perceptually uniform):

![fblue](docs/fblue.jpg) *fblue*

![fred](docs/fred.jpg) *fred*

![fgreen](docs/fgreen.jpg) *fgreen*

## Divergent colormaps

##### From cmocean:

![balance](docs/balance.jpg) *balance*

![delta](docs/delta.jpg) *delta*

![curl](docs/curl.jpg) *curl*

##### From colorbrewer2:

![PuOr](docs/PuOr.jpg) *PuOr*

![RdBu](docs/RdBu.jpg) *RdBu*

![PrGn](docs/PrGn.jpg) *PrGn*

![PiYG](docs/PiYG.jpg) *PiYG*

![RdYlGn](docs/RdYlGn.jpg) *RdYlGn*

![spectral](docs/spectral.jpg) *spectral*

## Rainbow colormaps

![turbo](docs/turbo.jpg) *turbo* (dedicated source)

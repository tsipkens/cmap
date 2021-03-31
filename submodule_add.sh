#!/bin/bash
#
# SUBMODULE_ADD
# A git routine for adding cmap as a submodule into a program.
# Author:  Timothy Sipkens, 2020-09-17
#===========================================================#

git submodule add -b master https://github.com/tsipkens/cmap cmap
git submodule init

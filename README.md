R4DataScience Repository
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

This repository includes a bunch of amound of codes learned from:

-   <https://r4ds.had.co.nz/data-visualisation.html>

Environment Installation
------------------------

About [Packrat](https://rstudio.github.io/packrat/), the walkthrough document seems the best document to follow after cloning: <https://rstudio.github.io/packrat/walkthrough.html>

Although I have set `Packrat` automatically snapshot changes, it seems that changes not updated into `packrat.lock` file as expectation.

If you load this repository as a R project into your R studio but not see packrat automatically restoring package dependencies, follow the commands below:

``` r
packrat::restore()
```

Once new packages installed,

``` r
packrat::snapshot()
```

Check and cleaning up actually unused package at the commit or push time,

``` r
packrat::status()

packrat::clean()
```

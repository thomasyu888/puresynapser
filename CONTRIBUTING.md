# Contributing Guide

## Development
The basic structure of this package is built off of [Best Practices for API packages]( https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html).

### package dependency
We use renv for development of this package.  Whenever a package is installed, be sure to run:
```
# Install package
renv::install(...)
# Snapshot
renv::snapshot()
```
More details on how to use [renv](https://rstudio.github.io/renv/articles/renv.html)

### Testing


### Documentation
We leverage roxygen2 to generate docs.  To generate docs, you will want to:

```
roxygen2::roxygenise()
```

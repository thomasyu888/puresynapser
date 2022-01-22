## Contributing

We welcome all contributions!  Please head to [issues](https://github.com/thomasyu888/puresynapser/issues) to either file any bugs/feature requests or find a task you want to assist with.  Make sure to assign yourself the task if you decide to work on it.

## The Development Life Cycle

### Fork and clone this repository

1. See the [Github docs](https://help.github.com/articles/fork-a-repo/) for how to make a copy (a fork) of a repository to your own Github account.
1. Then, [clone the repository](https://help.github.com/articles/cloning-a-repository/) to your local machine so you can begin making changes.
1. Add this repository as an [upstream remote](https://help.github.com/en/articles/configuring-a-remote-for-a-fork) on your local git repository so that you are able to fetch the latest commits.
1. On your local machine make sure you have the latest version of the `develop` branch:

    ```
    git checkout develop
    git pull upstream develop
    ```

### Install dependencies
We use renv for development of this package.  Make sure renv is installed and run this command to load the dependencies
```
renv::init()
```
More details on how to use [renv](https://rstudio.github.io/renv/articles/renv.html)


### Developing with GitHub

`puresynapser` follows the standard [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) development strategy.

> To ensure the most fluid development, try not to push to your `develop` or `main` branch.

1. (Assuming you have followed all 4 steps above in the "fork and clone this repository" section). Navigate to your cloned repository on your computer/server.
1. Make sure your `develop` branch is up to date with the `thomasyu888/puresynapser` `develop` branch.

    ```
    cd {your-github-username}/puresynapser
    git checkout develop
    git pull upstream develop
    ```

1. Create a feature branch which off the `develop` branch. If there is a GitHub/JIRA issue that you are addressing, name the branch after the issue with some more detail (like `{GH|JIRA}-123-add-some-new-feature`).

    ```
    git checkout develop
    git checkout -b GH-123-add-some-new-feature
    ```

1. At this point, you have only created the branch locally, you need to push this to your fork on GitHub.

    ```

    git push --set-upstream origin GH-123-add-some-new-feature
    ```

You should now be able to see the branch on GitHub. Make commits as you deem necessary. It helps to provide useful commit messages - a commit message saying 'Update' is a lot less helpful than saying 'Remove X parameter because it was unused'.

    ```
    git commit changed_file.txt -m "Remove X parameter because it was unused"
    git push
    ```

1. (Make sure you have follow instructions in "Install dependencies") Once you have made your additions or changes, make sure you write tests and run the test suite.  More information on testing below.

1. Once you have completed all the steps above, in Github, create a pull request from the feature branch of your fork to the `develop` branch of thomasyu888/puresynapser.

> *A code maintainer must review and accept your pull request.* A code review ideally happens with both the contributor and the reviewer present, but is not strictly required for contributing. This can be performed remotely (e.g., Zoom, Hangout, or other video or phone conference).

<!-- This package uses [semantic versioning](https://semver.org/) for releasing new versions. The version should be updated on the `develop` branch as changes are reviewed and merged in by a code maintainer. The version for the package is maintained in the [synapsemonitor/__version__.py](genie/__version__.py) file.  A github release should also occur every time `develop` is pushed into `main` and it should match the version for the package. -->


## Development of Package
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
This package will leverage `testthat` to test its functions.

### Documentation
We leverage roxygen2 to generate docs.  To generate docs, you will want to:

```
roxygen2::roxygenise()
```

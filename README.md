# puresynapser
This is an attempt at creating a pure Synapse R package

## usage

This is how you can install the package:
```
install.packages("./")
```

This package currently only works with the Synapse Personal Access token. You will have to set it as an environmental variable.
```
Sys.setenv(SYNAPSE_AUTH_TOKEN="tokenhere")
```

Try a command

```
library(puresynapser)
public_project = rest_GET("entity/syn7222066")
```

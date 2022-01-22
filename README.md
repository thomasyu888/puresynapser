# puresynapser
This is the Synapse R client.  There are other iterations of the client that can be found:

* [synapser](https://github.com/Sage-Bionetworks/synapser) - Official Synapse R package currently.
* [rSynapseClient](https://github.com/Sage-Bionetworks/rSynapseClient) - old pure R client. This package has been deprecated
* [synapserprototype](https://github.com/thomasyu888/synapserprototype) - This is a prototype of the client using reticulate + synapse python client.
* [synr-sdk-client](https://github.com/thomasyu888/synr-sdk-client) - This is an openAPI auto generated R client using the manually created [synapse openapi](https://github.com/Sage-Bionetworks/synapse-rest-openapi)

## usage

This is how you can install the package:
```
install.packages("./")
```

This package currently only works with the Synapse Personal Access token. You will have to set it as an environmental variable, or you can add this to your .Renviron file.
```
Sys.setenv(SYNAPSE_AUTH_TOKEN="tokenhere")
```

Try a command

```
library(puresynapser)
public_project = rest_GET("entity/syn7222066")
```

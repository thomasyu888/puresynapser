# puresynapser
This is a proof of concept Synapse R client.  There are other iterations of the client that can be found:

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

Currently you may pass in any of the `GET`, `PUT`, `DELETE`, `POST`, rest calls covered under this endpoint: https://repo-prod.prod.sagebase.org/repo/v1.  Some examples below.

```
library(stringi)
library(puresynapser)
# Create a project
project_name = paste0("test-project-", stringi::stri_rand_strings(1, 30))
project_resp = puresynapser::rest_POST("entity",
                                       body=list(name = project_name,
                                                 concreteType="org.sagebionetworks.repo.model.Project"))
# Get the project
project = rest_GET(paste0("entity/", project_resp$content$id))

# Create a folder in the project
folder = puresynapser::rest_POST("entity",
                                 body=list(name = "test-me-now",
                                           parentId=project$content$id,
                                           concreteType="org.sagebionetworks.repo.model.Folder"))

# Update the folder name
changed_entity = list(
  name = "change-my-name",
  parentId = folder$content$parentId,
  id = folder$content$id,
  etag = folder$content$etag,
  concreteType = folder$content$concreteType
)
changed_ent = puresynapser::rest_PUT(paste0("entity/", folder$content$id),
                                     body=changed_entity)
# Delete the project
changed_ent = puresynapser::rest_DELETE(
  paste0("entity/", project_resp$content$id)
)
```

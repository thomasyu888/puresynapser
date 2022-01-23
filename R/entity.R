new_entity <- function(
  name = character(),
  description = "",
  id = "",
  etag = "",
  createdOn = "",
  modifiedOn = "",
  createdBy = "",
  modifiedBy = "",
  parentId = "",
  concreteType = ""
) {
  # stopifnot(is.double(x))
  # units <- match.arg(units, c("secs", "mins", "hours", "days", "weeks"))

  structure(
    name,
    description = description,
    id = id,
    etag = etag,
    createdOn = createdOn,
    modifiedOn = modifiedOn,
    createdBy = createdBy,
    modifiedBy = modifiedBy,
    parentId = parentId,
    concreteType = concreteType,
    class = gsub("org.sagebionetworks.repo.model.", "", concreteType)
  )
}

validate_entity <- function(x) {
  values <- unclass(x)
  x
}

#' Folder Entity
#'
#' @param name
#' @param description
#' @param id
#' @param etag
#' @param parentId
#'
#' @return
#' @export
#'
#' @examples
folder <- function(
  name = "",
  description = "",
  id = "",
  etag = "",
  createdOn = "",
  modifiedOn = "",
  createdBy = "",
  modifiedBy = "",
  parentId = "",
  concreteType = ""
) {
  validate_entity(new_entity(
    name = name,
    description = description,
    id = id,
    etag = etag,
    createdOn = createdOn,
    modifiedOn = modifiedOn,
    createdBy = createdBy,
    modifiedBy = modifiedBy,
    parentId = parentId,
    concreteType = syn_global$concrete_types$FOLDER_ENTITY
  ))
}

errors <- function(x) attr(x, "errors")

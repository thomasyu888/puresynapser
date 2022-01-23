#' Entity object
#'
#' @param name Name of entity
#' @param description Description of entity
#' @param id Synapse Id of entity
#' @param etag Etag of entity
#' @param parentId Synapse Id of the container the entity is contained in.
#' @param createdOn Created on date
#' @param modifiedOn Modified on date
#' @param createdBy Created by date
#' @param modifiedBy modified by date
#' @param concreteType Concrete Type
#'
#' @return Entity Class
#'
#' @examples
#' new_entity("new_ent", name="entity_name", id="syn...")
new_entity <- function(
  x,
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
    x,
    name = name,
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

# validate_entity <- function(x) {
#   values <- unclass(x)
#   x
# }

get_syn_id <- function(x) attr(x, "id")

#' Get entity
#'
#' @param id_or_ent Synapse Id or Entity object
#'
#' @return Entity
#' @export
#'
#' @examples
#' get_entity("syn...")
get_entity <- function(id_or_ent) {
  if (inherits(id_or_ent, "Folder")) {
    syn_id = get_syn_id(id_or_ent)
  } else {
    syn_id = id_or_ent
  }
  ent_resp = rest_GET(sprintf("entity/%s", syn_id))
  ent_info = ent_resp$content
  new_entity(
    ent_info$name,
    name = ent_info$name,
    id = ent_info$id,
    etag = ent_info$etag,
    createdOn = ent_info$createdOn,
    modifiedOn = ent_info$modifiedOn,
    createdBy = ent_info$createdBy,
    modifiedBy = ent_info$modifiedBy,
    parentId = ent_info$parentId,
    concreteType = ent_info$concreteType
  )
}

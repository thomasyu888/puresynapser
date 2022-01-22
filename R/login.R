
#' Synapse login
#'
#' @param authtoken Synapse PAT
#'
#' @return None
#' @export
#'
#' @examples
#' login(authtoken="...")
#' login()
login <- function(authtoken=NULL) {
  if (is.null(authtoken)) {
    authtoken <- Sys.getenv("SYNAPSE_AUTH_TOKEN")
  }

  if (authtoken == "") {
    stop('SYNAPSE_AUTH_TOKEN environmental variable not set')
  }
  # Set global env
  syn_global$synapse_pat <- authtoken
  user = rest_GET("userProfile")
  if (user$content$ownerId[1] == "273950") {
    stop('The Synapse personal access token you set is invalid')
  } else {
    cat(sprintf("Welcome, %s", user$content$userName))
  }
}

# set a user agent
ua <- httr::user_agent("https://github.com/thomasyu888/puresynapser")
synapse_pat = Sys.getenv("SYNAPSE_AUTH_TOKEN")

#' Synapse REST GET command
#'
#' @param path Path to synapse endpoint
#'
#' @return Synapse API class
#' @importFrom httr modify_url GET http_type status_code
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @examples
#' rest_GET("entity/syn7222066")
rest_GET <- function(path) {
  url <- httr::modify_url("https://repo-prod.prod.sagebase.org/repo/v1",
                          hostname="repo-prod.prod.sagebase.org/repo/v1",
                          path = path)

  resp <- httr::GET(url, ua,
                    httr::add_headers(Authorization = paste0("Bearer ", synapse_pat)))
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  if (httr::status_code(resp) != 200) {
    stop(
      sprintf(
        "Synapse rest GET request failed [%s]\n%s\n<%s>",
        httr::status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }

  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "synapse_api"

  )
}

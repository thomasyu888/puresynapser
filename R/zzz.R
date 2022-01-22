.onLoad <- function(...) {
  # Set user agent on load
  syn_global$ua <- httr::user_agent("https://github.com/thomasyu888/puresynapser")
}

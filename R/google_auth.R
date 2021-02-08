#' @title google_auth
#'
#' @description Function to login and create a token to be used in all the funtions Reference: <https://developers.google.com/ads-data-hub/guides/quickstart-api>
#'
#' @param client_id Client ID
#' @param client_secret Client Secret
#'
#' @return Environment token that can be used in all other functions
#' @examples
#' \dontrun{
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' }
#' @export
#' @import httr
#' @seealso \url{https://developers.google.com/ads-data-hub/guides/quickstart-api}

google_auth <- function(client_id, client_secret) {
  app <- oauth_app(appname = "google", key = client_id, secret = client_secret)
  endpoint <- oauth_endpoints("google")
  scope <- "https://www.googleapis.com/auth/adsdatahub"
  token <- oauth2.0_token(endpoint = endpoint, app = app, scope = scope)
  return(token)
}

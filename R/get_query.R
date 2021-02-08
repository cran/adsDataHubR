#' @title get_query
#'
#' @description Retrieves the requested analysis query. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.analysisQueries/get>
#'
#' @param token Access token retrived from function google_auth()
#' @param query_name e.g.customers/123/analysisQueries/abcd1234
#'
#' @return A list of query details
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' get_query(query_name, token)
#' }
#' @export
#' @import httr


get_query <- function(query_name, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  url <- paste0("/v1/",query_name)
  resp <- GET(paste0(service_endpoint, url), config(token = token))
  query_details <- content(resp)

  return(query_details)
}

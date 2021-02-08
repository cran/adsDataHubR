#' @title validate_query
#'
#' @description Performs static validation checks on the provided analysis query. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.analysisQueries/validate>
#'
#' @param token Access token retrived from function google_auth()
#' @param customer_id ADH Customer ID e.g. customers/123
#' @param query_instance Query instance returned by create_query function
#'
#' @return If successful, the response body contains a validation queryPerformanceInfo object
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' validate_query(customer_id, query_instance, token)
#' }
#' @export
#' @import httr
#' @import jsonlite


validate_query <- function(customer_id, query_instance, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  url <- paste0("/v1/",customer_id,"/analysisQueries:validate")
  query_body <- list(
    "query" = query_instance
  )
  query_body <- toJSON(query_body, pretty = TRUE, auto_unbox = TRUE)
  resp <- POST(paste0(service_endpoint, url), config(token = token), body = query_body)
  query_validation <- content(resp)
  queryPerformanceInfo <- query_validation$queryPerformanceInfo

  return(queryPerformanceInfo)
}

#' @title create_query
#'
#' @description Creates an analysis query for later execution. No query validation is performed at this time. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.analysisQueries/create>
#'
#' @param token Access token retrived from function google_auth()
#' @param customer_id ADH Customer ID e.g. customers/123
#' @param query_title Query title, which is unique within a single Ads Data Hub customer and query type. e.g.RnF Analysis
#' @param query_text Query text written in Standard SQL.
#'
#' @return If successful, the response body contains a newly created instance of the query
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' create_query(customer_id, query_title, query_text, token)
#' }
#' @export
#' @import httr
#' @import jsonlite


create_query <- function(customer_id, query_title, query_text, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  query_object <- list(
    "title" = query_title,
    "queryText" = query_text
  )
  query_object <- toJSON(query_object, pretty = TRUE, auto_unbox = TRUE)

  url <- paste0("/v1/",customer_id,"/analysisQueries")
  resp <- POST(paste0(service_endpoint, url), config(token = token), body = query_object)
  query_instance <- content(resp)

  return(query_instance)
}

#' @title list_queries
#'
#' @description Lists links between the specified customer and other Google advertising entities. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.analysisQueries/list>
#'
#' @param token Access token retrived from function google_auth()
#' @param customer_id ADH Customer ID e.g. customers/123
#'
#' @return A list of analysis queries run on the ADH customer account.
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' total_customers <- get_customers(token)
#' customer_id <- "customers/123456"
#' list_queries(customer_id, token)
#' }
#' @export
#' @import httr


list_queries <- function(customer_id, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  selected_customer <- customer_id
  url <- paste0("/v1/",selected_customer,"/analysisQueries")
  resp <- GET(paste0(service_endpoint, url), config(token = token))
  list_of_analysis_queries <- content(resp)
  list_of_analysis_queries <- list_of_analysis_queries$queries
  return(list_of_analysis_queries)
}

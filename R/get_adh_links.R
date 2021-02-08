#' @title get_adh_links
#'
#' @description Lists links between the specified customer and other Google advertising entities.
#'
#' @param token Access token retrived from function google_auth()
#' @param customer_id ADH Customer ID e.g. customers/123
#'
#' @return A list of ad data links.
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' total_customers <- get_customers(token)
#' customer_id <- "customers/123456"
#' get_adh_links(customer_id, token)
#' }
#' @export
#' @import httr


get_adh_links <- function(customer_id, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  selected_customer <- customer_id
  url <- paste0("/v1/",selected_customer,"/adsDataLinks")
  resp <- GET(paste0(service_endpoint, url), config(token = token))
  list_of_links <- content(resp)
  list_of_links <- list_of_links$links
  return(list_of_links)
}

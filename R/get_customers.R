#' @title get_customers
#'
#' @description Fetch Ads Data Hub customers to which the current user has access. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.adsDataLinks/list>
#'
#' @param token Access token retrived from function google_auth()
#'
#' @return A dataframe of all customers along with IDs to which authenticated user has access
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' total_customers <- get_customers(token)
#' }
#' @export
#' @import httr


get_customers <- function(token){
  resp <- GET("https://adsdatahub.googleapis.com/v1/customers", config(token = token))
  list_of_customers <- content(resp)
  list_of_customers <- list_of_customers$customers
  customers_df <- do.call(rbind.data.frame, list_of_customers)
  return(customers_df)
}

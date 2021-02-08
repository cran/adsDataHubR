#' @title start_query
#'
#' @description Starts execution on a stored analysis query. The results will be written to the specified BigQuery destination table. The returned operation name can be used to poll for query completion status.. Reference: <https://developers.google.com/ads-data-hub/reference/rest/v1/customers.analysisQueries/start>
#'
#' @param token Access token retrived from function google_auth()
#' @param query_name e.g. customers/123/analysisQueries/abcd1234'
#' @param bq_destination_table  BigQuery destination table ID e.g. "project.dataset.table_name" If specified, the project must be explicitly whitelisted for the customer's ADH account. If project is not specified, uses default project for the provided customer. If neither project nor dataset is specified, uses the default project and dataset.
#' @param ads_data_customer_id #Enter the "From" ADH account on which we want to run the query
#' @param start_date Start Date e.g. 2021-01-31  format: YYYY-MM-DD
#' @param end_date End Date e.g. 2021-01-31 format: YYYY-MM-DD
#' @return If successful, the response body contains an instance of the submitted job.
#' @examples
#' \dontrun{
#' library(adsDataHubR)
#' token <- google_auth(client_id = client_id, client_secret=client_secret)
#' start_query(query_name, ads_data_customer_id, bq_destination_table, start_date, end_date, token)
#' }
#' @export
#' @import httr
#' @import jsonlite
#' @import lubridate


start_query <- function(query_name, ads_data_customer_id, bq_destination_table, start_date, end_date, token){
  service_endpoint <- "https://adsdatahub.googleapis.com"
  url <- paste0("/v1/", query_name, ":start")
  bq_destination_table <- bq_destination_table

  query_spec <- list(
    "spec" = list(
      "adsDataCustomerId" = ads_data_customer_id,
      "startDate" =  list("year" = year(start_date), "month" = month(start_date), "day" = day(start_date)),
      "endDate" =  list("year" = year(end_date), "month" = month(end_date), "day" = day(end_date))
    ),
    "destTable" = bq_destination_table
  )
  query_spec <- toJSON(query_spec, auto_unbox = TRUE)
  resp <- POST(paste0(service_endpoint, url), config(token = token), body = query_spec)
  job_instance <- content(resp)



  return(job_instance)
}

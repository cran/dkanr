#' get_resource_nids
#'
#' Returns all the resource node ids attached to a specific node id
#'
#' @param metadata list: Dataset level metadata
#'
#' @return character vector
#' @export
#'
#' @examples
#' \dontrun{
#' metadata <- retrieve_node(nid ='140177', as = 'list')
#' get_resource_nids(metadata)
#' }

get_resource_nids <- function(metadata) {

  # CHECK input
  assertthat::assert_that(
    is.list(metadata) == TRUE,
    msg = 'metadata must be a list. The dkanr::retrieve_node() function gives you the option
    retrieve metadata either as raw JSON or as a list. Make sure you specify the "as"
    argument as follows: retrieve_node(nid = xxxx, as = "list")'
  )
  assertthat::assert_that(
    metadata$type == "dataset",
    msg = 'This node is not of type "dataset". Resource nids are only available in dataset nodes'
  )

  out <- metadata[["field_resources"]][["und"]]
  out <- purrr::map_chr(out, ~ .x[["target_id"]])

  return(out)
}

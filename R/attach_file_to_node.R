#' attach_file_to_node
#'
#' Attach a file to an existing resource node
#'
#' @param nid character: DKAN resource node ID
#' @param url character: The DKAN site URL
#' @param credentials Optional list parameter. Default values are Cookie and Token generated by dkan_setup()
#' @param file_path character: path to file on local machine
#' @param attach numeric: Setting the attach parameter to 0 ensures that the file will replace any existing file on the resource. Setting it to 1 will result in a rejected request if the resource already has an attached file (but it will work if the resource file upload field is empty).
#'
#' @export
#'

attach_file_to_node <- function(nid,
                                url = get_url(),
                                credentials = list(
                                  cookie = dkanr::get_cookie(),
                                  token = dkanr::get_token()
                                ),
                                file_path,
                                attach = 1) {

  # construct the body of the POST request
  body <- list(
    "files[1]" = httr::upload_file(file_path),
    "field_name" = c("field_upload"),
    "attach" = attach
  )

  # build query
  path <- paste0("api/dataset/node/", nid, "/attach_file")
  url <- httr::modify_url(url, path = path)

  # Get credentials
  cookie <- credentials$cookie
  token <- credentials$token

  res <- httr::POST(
    url = url,
    httr::add_headers(.headers = c(
      "Content-Type" = "multipart/form-data",
      "Cookie" = cookie,
      "X-CSRF-Token" = token
    )),
    body = body
  )

  err_handler(res)
  httr::content(res, "text", encoding = "UTF-8")
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_nodes.R
\name{list_nodes}
\alias{list_nodes}
\title{list_nodes}
\usage{
list_nodes(url = get_url(), credentials = list(cookie =
  dkanr::get_cookie(), token = dkanr::get_token()), fields = NULL,
  filters = NULL, pagesize = NULL, page = NULL, as = "json", ...)
}
\arguments{
\item{url}{character: The DKAN site URL}

\item{credentials}{Optional list parameter. Default values are Cookie and Token generated by dkan_setup()}

\item{fields}{character vector: fields to be returned by the request}

\item{filters}{named character vector: filters to be applied to the search}

\item{pagesize}{numeric: Number of records to get per page (max = 20).}

\item{page}{numeric: The zero-based index of the page to get, defaults to 0.}

\item{as}{character: Output format. Options are: 'json', 'list', or 'df' (data frame)}

\item{...}{Other optional parameters to be passed to the underlying GET request}
}
\value{
json, dkan_node (list), or data frame
}
\description{
Returns list of nodes
}
\examples{
\dontrun{
list_nodes(url = "http://demo.getdkan.com")
list_nodes(url = "http://demo.getdkan.com",
               fields = c('nid', 'type', 'uri'),
               filters = c(type='resource'))
               }
}

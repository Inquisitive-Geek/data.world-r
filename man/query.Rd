% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query.R
\name{query}
\alias{query}
\title{execute a SQL or SPARQL query against a data.world client}
\usage{
query(connection, type, dataset, query, queryParameters = list(), ...)
}
\arguments{
\item{connection}{the connection to data.world}

\item{type}{the type of the query - either "sql" or "sparql"}

\item{dataset}{the "agentid/datasetid" for the dataset against which to execute the query}

\item{query}{the SQL or SPARQL query to run .}

\item{queryParameters}{Optional comma-separated ?name=value pairs}

\item{...}{additional param}
}
\value{
the query results as a data frame
}
\description{
execute a SQL or SPARQL query against a data.world client
}
\examples{
connection <- data.world(token = "YOUR_API_TOKEN_HERE")
query(connection, dataset="user/dataset",
      query="SELECT *
               FROM TableName
              LIMIT 10")

query(connection, dataset="user/dataset",
      query="SELECT *
               FROM TableName where `field1` = ? AND `field2` > ?
              LIMIT 10",
      queryParameters = list("value", 5.0))

query(connection, dataset="user/dataset", type="sparql",
      query="SELECT *
             WHERE {
               ?s ?p ?o.
             } LIMIT 10")

query(connection, dataset="user/dataset", type="sparql",
      query="SELECT *
             WHERE {
             [ :Year ?year ; :Region ?region ; :Indicator_Coverage_and_Disaggregation ?score ]
             FILTER(?score > $v1)
             } LIMIT 10",
             queryParameters = list("$v1"=5.5))

}
\seealso{
\code{\link{data.world}}
}

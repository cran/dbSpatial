## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
has_duckdb <- requireNamespace("duckdb", quietly = TRUE)
knitr::opts_chunk$set(
  eval = has_duckdb && !identical(Sys.getenv("NOT_CRAN"), "false")
)

## -----------------------------------------------------------------------------
# library(dbSpatial)
# 
# con <- DBI::dbConnect(duckdb::duckdb(), ":memory:")
# DBI::dbExecute(con, "SET threads = 1")
# coords <- data.frame(id = 1:3, x = c(0, 1, 2), y = c(0, 1, 2))
# 
# pts <- dbSpatial(
#   conn = con,
#   name = "class_structure_points",
#   value = coords,
#   x_colName = "x",
#   y_colName = "y",
#   overwrite = TRUE
# )
# 
# class(pts)
# pts
# 
# DBI::dbDisconnect(con, shutdown = TRUE)


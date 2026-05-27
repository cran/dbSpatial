## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
has_duckdb <- requireNamespace("duckdb", quietly = TRUE)
knitr::opts_chunk$set(eval = has_duckdb)

## ----setup--------------------------------------------------------------------
library(dbSpatial)
library(sf)
library(dplyr)

## -----------------------------------------------------------------------------
con <- DBI::dbConnect(duckdb::duckdb(), ":memory:")
DBI::dbExecute(con, "SET threads = 1")

# Sample points
df <- data.frame(id = 1:3, x = c(0, 10, 20), y = c(0, 10, 20))
pts <- dbSpatial(
  conn = con, name = "pts", value = df,
  x_colName = "x", y_colName = "y", overwrite = TRUE
)
pts

## -----------------------------------------------------------------------------
# Buffer
st_buffer(pts, dist = 5)

# Centroid
st_centroid(pts)

# Simplify
st_simplify(pts, dTolerance = 1)

## -----------------------------------------------------------------------------
# Bounding box
st_bbox(pts)

# Check validity
st_is_valid(pts)

## -----------------------------------------------------------------------------
# Self-join using intersection predicate (returns joined table)
st_join(pts, pts, join = st_intersects)

## -----------------------------------------------------------------------------
sf_pts <- st_as_sf(pts)
sf_pts

## ----cleanup, include=FALSE---------------------------------------------------
DBI::dbDisconnect(con, shutdown = TRUE)


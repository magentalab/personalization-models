

library(RODBC)
conn <- odbcConnect(dsn="hive_dsn",uid="ntid",pwd="xxxxx")


# Create blank test table with two columns of type int
create1 <- "create table explore.evantest1 (`mcvisid` int, `visit_num` int)"

# Create new test table by copying two columns from sitecat.hit_data filtered to one day
create2 <- "create table explore.evantest2 as select mcvisid, visit_num from sitecat.hit_data where src_file_date = '2018-02-21'"

# Select 1000 rows from evantest2 table to validate
testQ1 <- "select top 1000 * from explore.evantest2"

# Query and check time elapsed
start_time <- Sys.time()
testQR1 <- sqlQuery(conn,testQ1)
end_time <- Sys.time()
load_time <- end_time - start_time
load_time



library(RODBC)

conn <- odbcConnect(dsn="hive2",uid="ntid",pwd="xxxxx")

start_time <- Sys.time()
query1 <- "select top 100 * from sitecat.hit_data where src_file_date = '2018-01-03'"
queryReturn1 <- sqlQuery(conn,query1)
end_time <- Sys.time()
load_time <- end_time - start_time
load_time
View(queryReturn1)


start_time <- Sys.time()
query2 <- "select top 1000 * from sitecat.hit_data where src_file_date = '2018-02-25'"
queryReturn2 <- sqlQuery(conn,query2)
end_time <- Sys.time()
load_time <- end_time - start_time
load_time
View(queryReturn2)


query3 <- 
"select t.mcvisid, t.post_evar129, t.date_time
from sitecat.hit_data t
inner join (
  select mcvisid, max(date_time) as MaxTime
  from sitecat.hit_data
  group by mcvisid
) tm on t.mcvisid = tm.mcvisid and t.date_time = tm.MaxTime
where src_file_date = '2018-02-25'"


start_time <- Sys.time()
queryReturn3 <- sqlQuery(conn,query3)
end_time <- Sys.time()
load_time <- end_time - start_time
load_time





library(rJava)
library(RJDBC)
drv <- JDBC("org.apache.hive.jdbc.HiveDriver", "/Library/Java/Extensions/hive-jdbc.jar")

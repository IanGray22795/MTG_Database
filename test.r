library(DBI)

a <- seq(1,10000000)
b <- seq(10000001, 20000000)
data <- data.frame(a,b)

DB <- dbConnect(duckdb::duckdb(), dbdir = ":memory:", read_only = FALSE)

dbWriteTable(DB, "Dat", data, overwrite = TRUE)

con <- dbGetQuery(DB,"SELECT * FROM Dat")
print(con)

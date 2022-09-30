
install.packages("duckdb")
install.packages("tidyverse")
library("DBI")
library("tidyverse")

Magic_DB = dbConnect(duckdb::duckdb(), dbdir="MTG_Card.db", read_only = TRUE)

#table construction
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE set(id INTEGER PRIMARY KEY, Name VARCHAR, Release_Date DATE)")

dbExecute(Magic_DB, "INSERT INTO set VALUES(1,'Alpha', '1993-08-05')")

MTG_view = dbGetQuery(Magic_DB, "SELECT * FROM set")

View(MTG_view)

dbDisconnect(Magic_DB, shutdown=TRUE)

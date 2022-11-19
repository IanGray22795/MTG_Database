
install.packages('duckdb', repos=c('https://duckdb.r-universe.dev', 'https://cloud.r-project.org'))
install.packages("tidyverse")
library("DBI")
library("tidyverse")

Magic_DB <- dbConnect(duckdb::duckdb(), dbdir = ":memory:", read_only = FALSE)

dbExecute(Magic_DB, "INSTALL sqlite_scanner")
dbExecute(Magic_DB, "LOAD sqlite_scanner")

dbExecute(Magic_DB, "CALL sqlite_attach('../MTG_Database/data/sqllite_data/AllPrintings.sqlite.gz');")

# dbExecute(Magic_DB, "CREATE OR REPLACE TABLE set(id INTEGER PRIMARY KEY, 
#                                                  Name VARCHAR, 
#                                                  Release_Date DATE)")

# dbExecute(Magic_DB, "CREATE UNIQUE INDEX id ON set(id)")

# #transforming json file into table

# dbExecute(Magic_DB, "json(")

# dbExecute(Magic_DB, "CREATE OR REPLACE TABLE set(id INTEGER PRIMARY KEY, 
#                                                  Name VARCHAR, 
#                                                  Release_Date DATE)")
# dbExecute(Magic_DB, "Create OR RELACE TABLE card(id INTEGER PRIMARY KEY, 
#                                                  Name VARCHAR")

# dbExecute(Magic_DB, "INSERT INTO set VALUES (1,'Alpha', '1993-08-05'), 
#                                             (2, 'Beta', '1993-10-04'), 
#                                             (3, 'Unlimited', '1993-12-01')")



MTG_View <- dbGetQuery(Magic_DB, "SELECT * FROM set")

# View(MTG_View)

dbDisconnect(Magic_DB, shutdown = TRUE)


install.packages("duckdb")
install.packages("tidyverse")
library("DBI")
library("tidyverse")

Magic_DB <- dbConnect(duckdb::duckdb(), dbdir = "MTG_Card.duckdb", read_only = FALSE)

#table construction

# dbExecute(Magic_DB, "CREATE OR REPLACE TABLE set(id INTEGER PRIMARY KEY, 
#                                                  Name VARCHAR, 
#                                                  Release_Date DATE)")

# dbExecute(Magic_DB, "CREATE UNIQUE INDEX id ON set(id)")

#transforming json file into table

dbExecute(Magic_DB, "json(")

# dbExecute(Magic_DB, "Create OR REPLACE TABLE card(id INTEGER PRIMARY KEY, 
#                                                  Name VARCHAR")

# dbExecute(Magic_DB, "INSERT INTO set VALUES (1,'Alpha', '1993-08-05'), 
#                                             (2, 'Beta', '1993-10-04'), 
#                                             (3, 'Unlimited', '1993-12-01')")



MTG_View <- dbGetQuery(Magic_DB, "SELECT json_structure(j) FROM setlist")

View(MTG_View)

dbDisconnect(Magic_DB, shutdown = TRUE)

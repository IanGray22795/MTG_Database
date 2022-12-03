
install.packages('duckdb', repos=c('https://duckdb.r-universe.dev', 'https://cloud.r-project.org'))
install.packages("tidyverse")

library("DBI")
library("tidyverse")

Magic_DB <- dbConnect(duckdb::duckdb(), dbdir = ":memory:", read_only = FALSE)

dbExecute(Magic_DB, "CREATE SCHEMA IF NOT EXISTS MTG;")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Cards AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\cards.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Legalities AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\legalities.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Meta AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\meta.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Rulings AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\rulings.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Set_translations AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\set_translations.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Sets AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\sets.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Tokens AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\tokens.csv',SAMPLE_SIZE=-1);")

con <- dbGetQuery(Magic_DB, "SELECT * FROM MTG.Meta")

con_1 <- dbGetQuery(Magic_DB, "DESCRIBE MTG.Cards;")
print(con_1)
 
dbDisconnect(Magic_DB, shutdown = TRUE)

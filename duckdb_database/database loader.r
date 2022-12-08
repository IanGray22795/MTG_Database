
install.packages('duckdb', repos=c('https://duckdb.r-universe.dev', 'https://cloud.r-project.org'))
install.packages("tidyverse")

library("DBI")
library("tidyverse")

Magic_DB = dbConnect(duckdb::duckdb(), dbdir = ":memory:", read_only = FALSE)

dbExecute(Magic_DB, "CREATE SCHEMA IF NOT EXISTS MTG;")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Cards AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\cards.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Legalities AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\legalities.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Meta AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\meta.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Rulings AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\rulings.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Set_translations AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\set_translations.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Sets AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\sets.csv',SAMPLE_SIZE=-1);")
dbExecute(Magic_DB, "CREATE OR REPLACE TABLE MTG.Tokens AS SELECT * FROM read_csv_auto('..\\MTG_Database\\data\\sqllite_data\\AllPrintingsCSVFiles\\tokens.csv',SAMPLE_SIZE=-1);")

con <- dbGetQuery(Magic_DB, "SELECT * FROM MTG.Sets LIMIT 10")
View(con)
con_1 <- dbGetQuery(Magic_DB, "DESCRIBE MTG.Cards;")
View(con_1)
con_2 <- dbGetQuery(Magic_DB, "DESCRIBE MTG.Sets;")
View(con_2) 


con_3 <- dbGetQuery(Magic_DB, "SELECT s.code, c.rarity, s.name, c.name FROM MTG.Cards c JOIN MTG.Sets s ON c.setcode = s.code LIMIT 50")
View(con_3)
dbDisconnect(Magic_DB, shutdown = TRUE)

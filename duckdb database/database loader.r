
install.packages("duckdb")
install.packages("tidyverse")
library("DBI")
library("tidyverse")

Magic_DB = dbConnect(duckdb::duckdb())


 #table construction
 

dbExecute(Magic_DB, "CREATE TABLE items")

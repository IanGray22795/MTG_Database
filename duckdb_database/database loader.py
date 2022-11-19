# %%
import duckdb
import numpy as np
from pyarrow import json
import pandas as pd

# %%

con = duckdb.connect(database = ':memory:', read_only=False)

# %%

con.execute("CREATE OR REPLACE TABLE Cards AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\cards.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Legalities AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\legalities.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Meta AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\meta.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Rulings AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\\rulings.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Set_translations AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\set_translations.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Sets AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\sets.csv',SAMPLE_SIZE=-1);")
con.execute("CREATE OR REPLACE TABLE Tokens AS SELECT * FROM read_csv_auto('..\data\sqllite_data\AllPrintingsCSVFiles\\tokens.csv',SAMPLE_SIZE=-1);")

# %%

con.close()




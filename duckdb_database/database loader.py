#%%
import duckdb
# import numpy as np
from pyarrow import json
# import SparkSession as ps
import pandas as pd

#%%

# con = duckdb.connect(database = "../MTG_Card.duckdb", read_only=False)

#%%

# con.execute("SELECT * FROM set")
# print(con.fetchall())

#%%

# con.close()

#%%

df = json.read_json("C:/Users/Ian Gray/Documents/GitHub/github repositories/MTG_Database/json_data/setlist.json")

setlist.head(10)

#%%



# %%
import duckdb
import pandas as pd
# %%
con = duckdb.connect(database = "../MTG_Card.duckdb", read_only=False)
# %%
con.execute("SELECT * FROM set")
print(con.fetchall())

# %%

con.close()
# %%

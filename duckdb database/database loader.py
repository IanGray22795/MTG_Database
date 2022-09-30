# %%
import duckdb
import pandas as pd
# %%
con = duckdb.connect()

#con.execute("SELECT * FROM set")


# %%

con.close()
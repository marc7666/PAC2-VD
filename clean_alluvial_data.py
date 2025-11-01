import pandas as pd

# -------------------- Read original CSV --------------------
df = pd.read_csv("Raw datasets/MST_XWAP_SEX_AGE_CCT_NB_A-filtered-2025-10-31.csv") # Ref.1

# -------------------- Create a new DF with the needed columns and rename them --------------------
df_final = df[["ref_area.label", "sex.label", "classif1.label", "classif2.label", "obs_value"]].copy() # Ref.2
df_final.rename(columns={"ref_area.label": "country", "sex.label": "sex", "classif1.label": "age",
                                  "classif2.label": "citizenship", "obs_value": "value"}, inplace=True) # Ref.3

# -------------------- Clean data --------------------
print(df_final.columns[df_final.isnull().any()]) # Nulls a value -- Esborrar linies amb value = null -- Ref.4 i Ref.5
df_final = df_final.dropna(subset=["value"]) # subset -- Columnes a mirar pero esborra tota la fila -- Ref.6
df_final["age"] = df_final["age"].str.replace("Age (Aggregate bands): ", "") # Ref.7
df_final["citizenship"] = df_final["citizenship"].str.replace("Citizenship: ", "") # Ref.7
df_final["value"] = (df_final["value"] * 1000).astype(int) # La columna del valor esta agregada -- El dataset està en thousands

# -------------------- Save df into CSV --------------------
df_final.to_csv("Alluvial_data_cleaned.csv", index=False) # Ref.8
import pandas as pd

df = pd.read_csv("data_science_student_marks.csv")
df_filtered = df[df["location"] == "Toronto"]
df_filtered.rename(columns={"location": "Location", "age":"Age"})
df_filtered.to_csv("Violin_data_cleaned.csv", index=False)

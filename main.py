import src.extraction as extract
import src.cleaning as clean
import pandas as pd
import warnings
warnings.filterwarnings('ignore')

df_1 = extract.open_csv('nutrition_activity_obesity')
df_2 = extract.open_csv('heart_disease')

df_1_clean = clean.basic_cleaning_DB1(df_1)
df_2_clean = clean.basic_cleaning_DB2(df_2)

Models = clean.ML_models(df_2)
GB_model = clean.Gradient_booster_model(df_2)

clean.save_DB1(df_1_clean)
clean.save_DB2(df_2_clean)
clean.save_model(GB_model)
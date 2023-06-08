import os
import pandas as pd
import requests

def open_csv (name):
       
    # 1. Establish variables
    path = f"data/{name}.csv"
      
    # 2. We read from the path
    df = pd.read_csv(path)
    
    return df
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import GradientBoostingClassifier

from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix
from sklearn.metrics import precision_score
from sklearn.metrics import accuracy_score
from sklearn.metrics import recall_score
from sklearn.metrics import f1_score

from imblearn.under_sampling import RandomUnderSampler

import joblib
import pickle


# Clean de databases

def basic_cleaning_DB1 (df):
    
    df.columns = df.columns.str.strip()
    df.dropna(axis=1, how='all', inplace = True)
    columns_with_one_unique_value = []
    for column in df.columns:
        if df[column].nunique() == 1:
            columns_with_one_unique_value.append(column)
    df.drop(columns_with_one_unique_value, axis=1, inplace = True)
    df.drop(columns = ['YearEnd', 'Data_Value_Alt'], axis=1, inplace = True)
    df['Physical_activity'] = 'no'
    df.loc[df['QuestionID'].isin(['Q043', 'Q044', 'Q045', 'Q046']), 'Physical_activity'] = 'yes'
    df[['latitude', 'longitude']] = df['GeoLocation'].str.strip('()').str.split(', ', expand=True)

    return df


def basic_cleaning_DB2 (df):
    
    df.drop_duplicates(inplace=True)
    label=LabelEncoder()
    for col in df:
        df[col]=label.fit_transform(df[col])

    return df



# Create the models:

    X = df.drop("HeartDisease", axis=1)
    y = df.HeartDisease

    X_train, X_test, y_train, y_test = train_test_split(X, y)

    rus = RandomUnderSampler(random_state=42)
    X_train_resampled, y_train_resampled = rus.fit_resample(X_train, y_train)


def ML_models (df, X_test, y_test, X_train_resampled, y_train_resampled):

    models = {
    "logistic_reg": LogisticRegression(),
    "disc_analysis": LinearDiscriminantAnalysis(),
    "knc": KNeighborsClassifier(),
    "GaussianNB": GaussianNB(),
    "DecisionTreeClassifier": DecisionTreeClassifier(),
    "svc": SVC(),
    "RandomForestClassifier": RandomForestClassifier()
}
    for name, model in models.items():
        print(f"Training: {name}")
        model.fit(X_train_resampled, y_train_resampled)

    for name, model in models.items():
        print(f"------------------")
        print(model)
        y_pred = model.predict(X_test)
        print(f"Accuracy: {accuracy_score(y_test, y_pred)}")
        print(f"Precision: {precision_score(y_test, y_pred)}")
        print(f"Recall: {recall_score(y_test, y_pred)}")
        print(f"F1 score: {f1_score(y_test, y_pred)}")



def Gradient_booster_model (df, X_test, y_test, X_train_resampled, y_train_resampled):

    model = GradientBoostingClassifier(
    n_estimators=1000,
    learning_rate=0.1,
    max_depth=3,
    random_state=42)

    model.fit(X_train_resampled, y_train_resampled)

    y_pred = model.predict(X_test)

    print(f"Accuracy: {accuracy_score(y_test, y_pred)}")
    print(f"Precision: {precision_score(y_test, y_pred)}")
    print(f"Recall: {recall_score(y_test, y_pred)}")
    print(f"F1 score: {f1_score(y_test, y_pred)}")

    return model


# Save the databases, model and features:

def save_DB1 (df):
    df_activity = df[df['Class'] == 'Physical Activity']
    df_obesity = df[df['Class'] == 'Obesity / Weight Status']
    df_nutrition = df[df['Class'] == 'Fruits and Vegetables']
    df_obesity_states = df_obesity[df_obesity['QuestionID']=='Q036'].groupby(['LocationDesc'])['Data_Value'].mean().sort_values().to_frame().reset_index()

    df_activity.to_csv(r'data\data_clean\data_subsets\physical_activity_clean.csv', index=False)
    df_obesity.to_csv(r'data\data_clean\data_subsets\obesity_clean.csv', index=False)
    df_nutrition.to_csv(r'data\data_clean\data_subsets\nutrition_clean.csv', index=False)
    df_obesity_states.to_csv(r'data\data_clean\data_subsets\obesity_states_clean.csv', index=False)


def save_DB2 (df):
    df.to_csv(r'data\data_clean\heart_disease_clean.csv', index=False)


def save_model (model):
    with open('model/modelo.pkl', 'wb') as modelo:
    pickle.dump(model, modelo)
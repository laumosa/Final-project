import streamlit as st
import pandas as pd
import pickle
from sklearn.preprocessing import LabelEncoder

data_path = "data/data_clean/heart_disease_clean.csv"
model_path = "model/modelo.pkl"

def load_dataset() -> pd.DataFrame:
    df = pd.read_csv(data_path)
    return df

data = load_dataset()

st.set_page_config(page_title="Heart Disease",
        page_icon="images/streamlit_icon.png")

st.title("Heart Disease Prediction")
st.subheader("Welcome to the Heart Disease Predictor App!")

col1, col2 = st.columns([1, 3])

with col1:
        st.image("images/streamlit_icon.png")
        submit = st.button("Predict")

with col2:  
        st.markdown("""In this app, we aim to predict the likelihood of an individual having heart disease based on various factors related to their health and lifestyle. The data used for this prediction comes from a reliable source - the Centers for Disease Control and Prevention (CDC) - specifically from the Behavioral Risk Factor Surveillance System (BRFSS). The BRFSS conducts annual telephone surveys across all 50 states, the District of Columbia, and three US territories to gather information on the health status of adults in the United States.
The database used in this app includes the 2020 annual survey data related to adult health status.""")

st.markdown("""_The app should not replace consulting a medical professional. If there are any doubts or concerns, it is crucial to seek advice from a qualified healthcare provider for a thorough evaluation and personalized care._""")

st.sidebar.title("Feature Selection")

def user_input_features() -> pd.DataFrame:
    bmi = st.sidebar.selectbox("BMI", options=(bmi for bmi in data.BMI.unique()))
    smoking = st.sidebar.selectbox("Have you smoked at least 100 cigarettes in your entire life (approx. 5 packs)?)", options=("No", "Yes"))
    alcohol_drink = st.sidebar.selectbox("Do you have more than 14 drinks of alcohol (men) or more than 7 (women) in a week?", options=("No", "Yes"))
    stroke = st.sidebar.selectbox("Did you have a stroke?", options=("No", "Yes"))
    phys_health = st.sidebar.number_input("For how many days during the past 30 days was your physical health not good?", 0, 30, 0)
    ment_health = st.sidebar.number_input("For how many days during the past 30 days was your mental health not good?", 0, 30, 0)
    diff_walk = st.sidebar.selectbox("Do you have serious difficulty walking or climbing stairs?", options=("No", "Yes"))
    sex = st.sidebar.selectbox("Sex", options=(sex for sex in data.Sex.unique()))
    age_cat = st.sidebar.selectbox("AgeCategory", options=(age_cat for age_cat in data.AgeCategory.unique()))
    race = st.sidebar.selectbox("Race", options=(race for race in data.Race.unique()))
    diabetic = st.sidebar.selectbox("Have you ever had diabetes?", options=(diabetic for diabetic in data.Diabetic.unique()))
    phys_act = st.sidebar.selectbox("Have you played any sports (running, biking, etc.) in the past month?", options=("No", "Yes"))
    gen_health = st.sidebar.selectbox("How can you define your general health?", options=(gen_health for gen_health in data.GenHealth.unique()))
    sleep_time = st.sidebar.number_input("How many hours on average do you sleep?", 0, 24, 7)   
    asthma = st.sidebar.selectbox("Do you have asthma?", options=("No", "Yes"))
    kid_dis = st.sidebar.selectbox("Do you have kidney disease?", options=("No", "Yes"))
    skin_canc = st.sidebar.selectbox("Do you have skin cancer?", options=("No", "Yes"))

    features = pd.DataFrame({
            "BMI": [bmi],
            "Smoking": [smoking],
            "AlcoholDrinking": [alcohol_drink],
            "Stroke": [stroke],
            "PhysicalHealth": [phys_health],
            "MentalHealth": [ment_health],
            "DiffWalking": [diff_walk],
            "Sex": [sex],
            "AgeCategory": [age_cat],
            "Race": [race],
            "Diabetic": [diabetic],
            "PhysicalActivity": [phys_act],
            "GenHealth": [gen_health],
            "SleepTime": [sleep_time],
            "Asthma": [asthma],
            "KidneyDisease": [kid_dis],
            "SkinCancer": [skin_canc]
        })

    return features

input_df = user_input_features()
df = pd.concat([input_df, data], axis=0)
df = df.drop(columns=["HeartDisease"])

cat_cols = ["BMI", "Smoking", "AlcoholDrinking", "Stroke", "DiffWalking",
                "Sex", "AgeCategory", "Race", "Diabetic", "PhysicalActivity",
                "GenHealth", "Asthma", "KidneyDisease", "SkinCancer"]

label=LabelEncoder()
for col in cat_cols:
    df[col]=label.fit_transform(df[col])


if submit:
        with open(model_path, 'rb') as file:
            test = pickle.load(file)
        
        prediction_prob = test.predict_proba(df)

        st.markdown(f"The probability that you'll have heart disease is {round(prediction_prob[0][1] * 100, 2)}%.")

# Heart Disease Prediction 
![readme_image](https://github.com/laumosa/Final-project/assets/83134591/e72b7e4e-5d00-4f21-81b5-daa8a9252123)


## Introduction:

Heart disease is a major cause of death in the United States, as reported by the Centers for Disease Control and Prevention (CDC). Detecting and preventing the key factors that contribute to heart disease is crucial for improving healthcare outcomes. 

This project aims to implement a machine learning model that can predict an individual's likelihood of developing heart disease and identify the most influential variables in making this prediction.

In order to gain insights into the health factors, we will conduct a descriptive analysis of the US population, focusing on three key factors: obesity, physical activity, and nutrition.

In the upcoming sections, we will discuss the methodology employed, the datasets used for analysis, and the implementation of the machine learning model.

## Tools

The programming language and data visualization tools used for the present analysis are the following: 
- <ins>Phyton</ins>: to explore and clean the data, as well as develop the machine learning model
- <ins>MySQL</ins>: to explore and summarize the data to gain a comprehensive understanding of the dataset and extract relevant information.
- <ins>Tableau</ins>: to visually represent the data.

## Methodology

```Exploratory data analysis (EDA)```

Prior to creating any visualizations, we conducted an exploratory data analysis in Python, aiming to achieve the following objectives:
Understand the dataset's structure, including how the data is organized and the information it encompasses. This involved examining the various variables present in the dataset and their respective types.
Identify any missing, duplicated, or erroneous data. We carefully searched for incomplete or inaccurate information within the dataset.

```MySQL Queries```

After cleaning the data, we proceeded to generate SQL queries for each database in order to explore the data and provide contextual insights.

```Tableau visualization```

After conducting data exploration, our next step involved creating various types of plots to provide visual insights for the understanding of the data. These visualizations include line plots, bar plots, maps, and other informative graphics.

```Machine learning```

Our objective is to predict the likelihood of individuals having a heart disease based on the remaining variables in Database 2. As 'HeartDisease' is a categorical variable, we have trained multiple classification models to evaluate the performance metrics of each one. This analysis will help us determine the best model to use for accurate predictions.

## Descriptive analysis - DataBase 1

```DataBase source```

Nutrition, Physical Activity, and Obesity - The dataset comes from the CDC and is a major part of the Behavioral Risk Factor Surveillance System (BRFSS), which conducts annual telephone surveys to gather data on the health status of US

```DataBase characteristics```

This Database includes data on adult's diet, physical activity, and weight status. It consists of 88.629 rows, where each row represents a sample of individuals, and 33 columns. The description of the columns used for the analysis is shown in the following table:
| Feature       | Type           | Description |
| :------------ |:---------------|:------------|
| YearStart     | Integer        | 2011-2021 |
| LocationDesc  | String         | 50 US states as well as the District of Columbia and three US territories |
| Class         | String         | Nutrition, Physical Activity or Obesity |
| Question ID   | String         | ***see table below***** |
| Question      | String         | ***see table below***** |
| Data_Value    | Float          |  Percentage of the sample of individuals that meets each question |

The table below contains the ID and corresponding questions asked in the survey.
| QuestionID      | Question           |
| :----------------|:---------------|
| Q043             | Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination) |
| Q044             | Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic physical activity and engage in muscle-strengthening activities on 2 or more days a week |
| Q045             | Percent of adults who achieve at least 300 minutes a week of moderate-intensity aerobic physical activity or 150 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination) |
| Q046             | Percent of adults who engage in muscle-strengthening activities on 2 or more days a week |
| Q047             | Percent of adults who engage in no leisure-time physical activity |
| Q037             | Percent of adults aged 18 years and older who have an overweight classification |
| Q036             | Percent of adults aged 18 years and older who have obesity |
| Q018             | Percent of adults who report consuming fruit less than one time daily |
| Q019             | Percent of adults who report consuming vegetables less than one time daily |

```DataBase Description - Obesity```

The data shows a trend of increasing obesity rates from 2011 to 2021. In 2011, the lowest sample had less than 1% of obese individuals, whereas in 2021, the lowest sample was over 6%.

When examining the samples with the highest obesity rates, we notice that each year, there is at least one sample where the percentage of obese individuals falls between 55% and 60%. However, it is evident that the number of individuals within this range increases as the years progress.

![DB1_evolution_obesity](https://github.com/laumosa/Final-project/assets/83134591/fdf734a6-d5de-451d-a6ce-e790be657411)

The map below displays the percentage of obese population in each US state, revealing a distinct difference between the eastern and western sides of the country. The western side generally exhibits a lower obesity rate compared to the eastern side.

![DB1_states_obesity](https://github.com/laumosa/Final-project/assets/83134591/84eeb6d5-08e7-4025-8de5-a7e4f7550674)

The plot below displays the percentage of obese population in the top and bottom 5 states. West Virginia emerges as the state with the highest percentage of obese population, closely followed by Mississippi. In contrast, Colorado stands out as the state with the lowest percentage of obese population.

![DB1_evolution_state_ranking](https://github.com/laumosa/Final-project/assets/83134591/c546caba-04f4-4430-9d78-a32aaa432391)

```DataBase Description - Nutrition```

When examining the nutrition indicators, it becomes apparent that, on average, a greater proportion of individuals consume fruit less than once a day compared to those who consume vegetables less than once a day. Specifically, the percentage of fruit consumption is twice that of vegetable consumption.

Looking at the trend, we can observe a slight increase in the percentage of individuals consuming fruit or vegetables less than once a day. However, from 2019 to 2021, the proportions remain almost the same.

![DB1_evolution_nutition](https://github.com/laumosa/Final-project/assets/83134591/493b2fcc-cc24-4263-ae32-56016f16b759)

```DataBase Description - Physical activity```

When analyzing the percentage of individuals engaged in physical activity compared to those who are not, on average, a higher proportion of individuals participate in some form of physical activity. However, there is an exception for those individuals who engage in both muscle-strengthening and aerobic physical activities, as the percentage is relatively lower in this specific category.

![DB1_physical_activity](https://github.com/laumosa/Final-project/assets/83134591/c4deec32-31e3-4133-aa42-6dce704b298f)

## Descriptive analysis - DataBase 2

```DataBase source```

Key Indicators of Heart Disease - The dataset comes from the CDC and is a major part of the Behavioral Risk Factor Surveillance System (BRFSS), which conducts annual telephone surveys to gather data on the health status of US in all 50 states as well as the District of Columbia and three US territories.

```DataBase characteristics```

This Database includes 2020 annual survey data related to adult health status. It consists of 319.795 rows and 18 columns. The description of the columns used for the analysis is the following:

| Feature            | Type           | Description |
| :----------------- |:---------------|:------------|
| HeartDisease       | Boolean        | Individuals that have ever reported having coronary heart disease (CHD) or myocardial infarction (MI) - (Yes/No) |
| BMI                | Float          | Body Mass Index |
| Smoking            | Boolean        | Individuals that smoked at least 100 cigarettes in their entire life - (Yes/No) |
| AlcoholDrinking    | Boolean        | Adult men having more than 14 drinks per week and adult women having more than 7 drinks per week (Yes/No) |
| Stroke             | Boolean        | Individuals that were told they had a stroke - (Yes/No) |
| PhysicalHealth     | Float          | Number of days during the past 30 where individuals have had any physical illness or injury |
| MentalHealth       | Float          | Number of days during the past 30 where individuals have felt their mental health was not good |
| DiffWalking        | Boolean        | Individuals with serious difficulty walking or climbing stairs (Yes/No) |
| Sex                | Boolean        | (Female/Male) |
| AgeCategory        | String         | (18-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50-54, 55-59, 60-64, 65-69, 70-74, 75-79, 80 or older) |
| Race               | String         | (White, Black, Asian, American Indian/Alaskan Native, Other, Hispanic) |
| Diabetic           | Boolean        | Individuals that were told they had diabetes (Yes/No) |
| PhysicalActivity   | Boolean        | Individuals who reported doing physical activity or exercise during the past 30 days other than their regular job (Yes/No) |
| GenHealth          | String         | Individuals valoration of their health - (Excellent, Very good, Good, Fair or Poor) |
| SleepTime          | Float          | Quantity of sleep hours do individuals get in a 24-hour period, on average |
| Asthma             | Boolean        | Individuals that were told they had asthma - (Yes/No) |
| KidneyDisease      | Boolean        | Individuals that were told they had kidney disease, not including kidney stones, bladder infection or incontinence - (Yes/No) |
| SkinCancer         | Boolean        | Individuals that were told they had skin cancer - (Yes/No) |

```DataBase Description - continuous variables```

<ins>BMI, sex, heart disease</ins>

The plot below illustrates the distribution of body mass index (BMI) categorized by sex and the presence of heart disease. There is a distinct distribution of BMI between females and males, due to their different body morphologies.
When examining men, 50% of individuals fall within a broader range compared to women, and the maximum and minimum values are more widely dispersed, indicating a greater diversity in male body morphologies. Both women and men exhibit outliers at the upper end of the BMI scale. Interestingly, it is observed that outliers tend to be more extreme among individuals without a history of heart disease compared to those who have experienced it. However, it is worth noting that the median BMI range for the general population is slightly higher than that of individuals without a history of heart disease.

![DB2_BMI](https://github.com/laumosa/Final-project/assets/83134591/3c247101-8d33-4b02-bf7e-4c3355a6c844)

<ins>Physical and mental health, grouped age, heart disease</ins>

According to the source database, the questions regarding physical and mental health are defined as follows:
Physical Health: number of days during the past 30 where individuals have had any physical illness or injury 
Mental Health: number of days during the past 30 where individuals have felt their mental health was not good - Float

The graph below illustrates the average trends observed in physical and mental health over the life of individuals. There is a clear pattern indicating a decline in physical health for older individuals, as they tend to report a higher number of physical illnesses or injuries. On the other hand, mental health demonstrates a significant improvement on average for older people.

When considering the factor of heart disease, it becomes evident that individuals who reported having a heart disease experience poorer physical and mental health compared to those who do not have it. This difference is particularly pronounced among individuals between the ages of 35 and 64.

![DB2_health](https://github.com/laumosa/Final-project/assets/83134591/3939da36-a531-4c49-b248-64f5cfd049f1)

<ins>Sleep hours, grouped age</ins>

In the graph below, a strong correlation between the occurrence of heart disease and sleep time is evident. Specifically, individuals who sleep fewer hours on average are more likely to experience heart disease. However, this correlation does not hold true for individuals between the ages of 18 and 24. Additionally, beyond the age of 75, the difference in sleep duration between individuals with and without heart disease becomes nearly imperceptible.

![DB2_sleep](https://github.com/laumosa/Final-project/assets/83134591/bc5b9d3f-27e9-4dc2-a35b-56cad9c962bc)

```DataBase Description - categorical variables```

The following plots show the proportion of individuals that have had some heart disease and those who not for each categorical variable in the database. it is necessary to emphatyse the categorical variables are filtered by boolean option ‘yes’ (eg. individuals that smoke, drink alcohol, suffer from skin cancer, etc.). We observe that those variables with a higher proportion of heart disease are

![DB2_categorical_1](https://github.com/laumosa/Final-project/assets/83134591/d7b6c2e6-15ee-480b-869a-58a6240ac144) ![DB2_categorical_2](https://github.com/laumosa/Final-project/assets/83134591/7f7d22a0-5227-434e-9009-f73c96a01b70)

## Machine learning

The goal is to develop and compare different classification models to predict the presence or absence of heart disease based on the given features. 

Since the predicted feature is heavily imbalanced (see the plot below), the code incorporates undersampling to balance the training data. This technique helps prevent biased predictions that may favor the majority class.

![DB2_heart_disease](https://github.com/laumosa/Final-project/assets/83134591/a1470c17-0151-41fe-bb6a-473297b7e96b)

We have trained several popular classification models and evaluated their performance. The table below displays the metrics for each of the models.

| Model                        | Accuracy | Precision | Recall   | F1 score | 
| :--------------------------- |:---------|:----------|:---------|:---------|
| Logistic Regression          |  0.70    | 0.19      |  0.75    |  0.31    |
| Linear Discriminant Analysis |  0.73    | 0.21      |  0.76    |  0.33    |
| K-Nearest Neighbors          |  0.66    | 0.16      |  0.69    |  0.26    |
| Gaussian Naive Bayes         |  0.79    | 0.23      |  0.58    |  0.33    |
| Decision Tree Classifier     |  0.67    | 0.16      |  0.65    |  0.26    |
| Support Vector Classifier    |  0.73    | 0.15      |  0.45    |  0.23    |
| Random Forest Classifier     |  0.72    | 0.20      |  0.77    |  0.32    |

Although accuracy seems to be pretty high for each model, almost over 0.70, we are not going to stick to this metric since our data is highly imbalanced,  so this may lead to make a bad model appear to be much better than it is. going to the next metric we can observe that neither of the trained models are very precise, meaning that of everything that the algorithm predicted as positive, a low percentage of times it was true. while looking at the recall metric we observe that the models are highly likely to identify the truth, except for Support Vector Classifier. F1 combines both precision and recall, we observe that this metric is not very good for our analysis.

Although the accuracy of each model appears to be relatively high, exceeding 0.70, we should not only rely on this metric due to the highly imbalanced nature of our data. This imbalance can result in a misleadingly positive evaluation of a model's performance. Moving on to other metrics, we find that none of the trained models demonstrate a high level of precision, meaning that a low percentage of the positive predictions made by the algorithm are actually true. On the other hand, when examining the recall metric, we observe that the models generally correctly identify true positives, with the exception of the Support Vector Classifier. Considering the F1 score, which combines precision and recall, we find that this metric does not generate satisfactory results for our analysis.

Therefore we have used an open-source machine learning platform called H2O to identify the top 20 models that effectively predict the presence or absence of heart disease. We have found out that the model that predicts the best is the Gradient Boosting Classifier. 

Gradient Boosting Classifier models are known for their ability to handle complex relationships and capture non-linear patterns in the data. They can effectively handle both numerical and categorical features. The model works by combining multiple "weak" prediction models, usually decision trees, to create a strong predictive model. It does this by training each new decision tree to correct the mistakes made by the previous trees in the sequence. The metrics for this model  are the following: 

Taking a look a the importance of features we observe that 

![DB2_importance_features](https://github.com/laumosa/Final-project/assets/83134591/0c2e3491-b0f2-4bbc-9596-ecfb415f8916)









# Final-project 
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

<ins>Exploratory data analysis (EDA)</ins>

Prior to creating any visualizations, we conducted an exploratory data analysis in Python, aiming to achieve the following objectives:
Understand the dataset's structure, including how the data is organized and the information it encompasses. This involved examining the various variables present in the dataset and their respective types.
Identify any missing, duplicated, or erroneous data. We carefully searched for incomplete or inaccurate information within the dataset.

<ins>MySQL Queries</ins>

After cleaning the data, we proceeded to generate SQL queries for each database in order to explore the data and provide contextual insights.

<ins>Tableau visualization</ins>

After conducting data exploration, our next step involved creating various types of plots to provide visual insights for the understanding of the data. These visualizations include line plots, bar plots, maps, and other informative graphics.

<ins>Machine learning</ins>

Our objective is to predict the likelihood of individuals having a heart disease based on the remaining variables in Database 2. As 'HeartDisease' is a categorical variable, we have trained multiple classification models to evaluate the performance metrics of each one. This analysis will help us determine the best model to use for accurate predictions.

## Descriptive analysis - DataBase 1

<ins>DataBase source</ins>

Nutrition, Physical Activity, and Obesity - The dataset comes from the CDC and is a major part of the Behavioral Risk Factor Surveillance System (BRFSS), which conducts annual telephone surveys to gather data on the health status of US

<ins>DataBase characteristics</ins>

This Database includes data on adult's diet, physical activity, and weight status. It consists of 88.629 rows, where each row represents a sample of individuals, and 33 columns. The description of the columns used for the analysis:
Year: 2011-2021
Location: 50 US states as well as the District of Columbia and three US territories.
Class: Nutrition, Physical Activity or Obesity
Question ID and Question:
['Q043'] Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination)
['Q044'] Percent of adults who achieve at least 150 minutes a week of moderate-intensity aerobic physical activity or 75 minutes a week of vigorous-intensity aerobic physical activity and engage in muscle-strengthening activities on 2 or more days a week.
['Q045'] Percent of adults who achieve at least 300 minutes a week of moderate-intensity aerobic physical activity or 150 minutes a week of vigorous-intensity aerobic activity (or an equivalent combination)
['Q046'] Percent of adults who engage in muscle-strengthening activities on 2 or more days a week
['Q047'] Percent of adults who engage in no leisure-time physical activity
['Q037'] Percent of adults aged 18 years and older who have an overweight classification
['Q036'] Percent of adults aged 18 years and older who have obesity
['Q018'] Percent of adults who report consuming fruit less than one time daily
['Q019'] Percent of adults who report consuming vegetables less than one time daily
Data value: percentage of the sample of individuals that meets each question

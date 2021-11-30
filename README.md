# RYERSON DATA CAPSTONE PROJECT
Capstone Project for Ryerson's Data Analytics, Big Data and Predictive Analytics Program
This project is focused on identifying patterns and trends in ridership and usage behaviour as well as predict future demand using Bike Share Toronto ridership data from 2018-2020.
Dependencies:
Python (Numpy, Pandas, Matplotlib, Seaborn, Geopy,gmaps)
R (dplyr, forecast)

Methodology
This project was undertaken  in 4 stages, with each stage involving a set of key processes, as discussed in more detail in the section below:

1. Data Preparation
This first step involved acquiring all the relevant datasets from source. These were  loaded into  Pandas, a Python data analysis library and then merged into a single dataframe. From  here, the data was cleansed by identifying both missing data and outliers and addressing them accordingly. The final task in this stage was reformatting the data by converting relevant columns into more appropriate data types, as well as adding additional columns that were relevant for the  effective analysis of the data.

2. Data Analysis
This stage was key to the “knowledge discovery” process and involved analyzing the dataset by building visualizations using tools like Matplotlib and Seaborn. Utilizing a variety  of charts and  graphs, this section not only helped answer some of the key research questions, but revealed further patterns, relationships and insights from the data.

3. Predictive modelling  
This stage was primarily concerned with the task of building machine learning models to forecast Toronto Bike Share demand. A total  of 5 different  time series models were built using R’s Forecast module. These included a Seasonal Naive model, a DSHW Model, SARIMAX model, TBATS model and an Artificial Neural Network model. For validation  purposes, the data was split into two  parts,  a train set for training our models, and a validation set for testing the models. After fitting the models,  three different metrics were employed for testing their accuracy and performance. These include the Mean Absolute Percentage Error (MAPE),  R-squared (R2) and Root Mean Squared Error (RMSE).

4. Reporting
As the final stage of the project, this mostly involved discussing the final results, finalizing the project report, and communicating the findings through a powerpoint presentation.




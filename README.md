# F1_Tableau Dashboard
------------------------------------------------
Formula 1 (F1) is the pinnacle of motorsport, known for its high-speed races, cutting-edge technology, and global appeal. It is a premier single-seater racing championship governed by the Fédération Internationale de l'Automobile (FIA). Since its inaugural season in 1950, F1 has grown into a multi-billion-dollar global spectacle, captivating millions of fans worldwide.

---------------------------------------------------------
[Tableau Dashboard](https://public.tableau.com/app/profile/jesslyn.lee/viz/f1tableau/Performance?publish=yes)


# Dashboard Preview 
<img width="977" alt="Screenshot 2025-01-18 at 10 24 54 PM" src="https://github.com/user-attachments/assets/ada98e41-c7f1-4dcb-91d1-28ddf40ed4fb" />
<img width="985" alt="Screenshot 2025-01-18 at 10 25 22 PM" src="https://github.com/user-attachments/assets/9fe0da02-d971-4dd7-8cc0-d60fd3945a51" />



## Project Structure

    ├── LICENSE
    ├── README.md          <- README for using this project.
    │   │
    │   └── f1_cleaned.sql       <- DB creation.
    
    ├── data           <- Datasets used and collected for this project.


# Data Set Overview
Kaggle : https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

Some of the datasets from converted from csv to json due to issues with readibility in SQL. 
Not all data sets were used, only those that were uploaded into the data file. 

Note: Some Years have different number of rounds, with the older years having fewer rounds due to changes in F1 Regulations. Additionally, certain drivers have raced for more than 1 team a season due to being a reserve/test driver. 


# Analysis

1. Driver Performance Analysis
Qualifying vs. Race Performance: Compare qualifying positions with race results to identify drivers who outperform or underperform in races.
Consistency: Compare driver's performance over time, across several years
Race Stats: Calculate the number of races raced, including podiums and championships won (if any)

2. Team Performance Analysis 
Constructor Standings: Track changes in team rankings across seasons.
Points per Race: Analyze which teams maximize points efficiency per race.
Comparison Between Drivers : Examine which driver has been more successful within each team.

# Summary Of Findings

In 2024 this year, Mclaren won constructor's standings after being dominated by Redbull for the past 2 years. 

Drivers under Mclaren were : Lando Norris and Oscar Piastri. Lando Norris performed significantly better than his team mate in 2024. 

Lewis Hamilton has the most wins in history and number of championships in Formula 1 History. His Prime was around 2013 - 2019, however his performance has been decreasing in the recent few years. 

Max Verstappen and Sergio Perez were performing on par in the first few rounds of 2024, however Sergio Perez's performance fell extremely short after the first 5 rounds. 















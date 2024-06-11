# Bellabeat - Google Data Analytics Capstone Case Study

## Table of Contents

- [Introduction](#introduction)
- [Dataset Overview](#dataset-overview)
- [Objective](#objective)
- [Data Analysis Process](#data-analysis-process)
- [Contents](#Contents)
- [Key Findings](#key findings)
- [Conclusion](#conclusion)


## Introduction

This README provides an overview of the Bellabeat Google Data Analytics Capstone Case Study. Bellabeat is a technology-driven wellness company that focuses on developing cutting-edge products that enable women to live more balanced, healthier lives. Bellabeat, which was founded in 2014 by Urska Srsen and Sandro Mur, rose to fame with its main offering, the Bellabeat Leaf, a wearable that monitors women's stress levels, sleep patterns, and menstrual cycles.The goal of the organization is to use technology to support holistic wellbeing, with an emphasis on women's health in particular. Bellabeat's products are renowned for their sophisticated designs that easily integrate into commonplace accessories like jewelry or clips, giving them a dual purpose of being fashionable and functional.


## Dataset Overview

The dataset used in this case study includes anonymized data from Bellabeat's fitness tracker, called the "FitBit". The dataset contains information about daily activity, sleep patterns, and stress levels recorded by FitBit devices worn by Bellabeat users. It also includes demographic data, such as age, gender, and location. The dataset is provided in the form of a CSV file.

## Objective

The key objective is to analyze user data to understand engagement patterns, track health metrics, and optimize features. By evaluating user demographics, retention rates, and market trends, Bellabeat aims to enhance its products, improve user satisfaction, and drive business growth through data-driven insights.


## Data Analysis Process
The following steps are involved in the data analysis process for this case study:

1. **Data Gathering**: Compile the FitBit dataset from Kaggle provided by Bellabeat, which contains demographic data and data on daily activity, sleep, and stress.
2. **Data Cleaning**: This process involves resolving any formatting problems or inconsistencies, handle missing values, and purge duplicates from the dataset.
3. **Data Exploration**: Examine the dataset to learn about the variables, spot trends, and gain understanding of user preferences and behavior.
4. **Data Analysis**: To extract valuable insights from the dataset, apply statistical analysis and data visualization tools.
5. **Recommendations**: Provide Bellabeat data-driven recommendations based on the analysis's findings, including possible enhancements to the functionality of the product and marketing tactics.


The following technologies were used in this case study:

- R: R programming language was used for data analysis, cleaning, and visualization.
- RMarkdown: RMarkdown was used as the tool to create dynamic and reproducible reports.
- tidyverse: The tidyverse package, including dplyr and ggplot2, was used for data manipulation and visualization.

## Contents

The case study includes the following files:

1. **README.md**: The file you are currently reading, providing an overview of the case study.
2. **Data**: The dataset folder containing FitBit user data for analysis.
3. **output graphs**: A folder that contains the graph outputs used for analysis.
4. **_bellabeat.Rmd**: RMarkdown file containing the R code and analysis for the case study.
5. **_bellabeat.html**: The HTML report generated from the RMarkdown file, summarizing the analysis findings and recommendations.
6. **case_study_bellabeat**: R source file containing the R code and analysis for the case study


To run the analysis and explore the case study, follow these steps:

1. Ensure R and RStudio are installed on your system.
2. Clone the repository or download the files to your local machine.
3. Open RStudio and set the working directory to the location of the case study files.
4. Open the `_bellabeat.Rmd` file in RStudio to view and run the analysis code.
5. Knit the RMarkdown file to generate the HTML report (`_bellabeat.html`) summarizing the analysis findings and recommendations.

## Key Findings

* Total Steps and Calories have a positive relationship; most individuals are somewhat active. 
* Total Time in Bed and Total Minutes Asleep have a favorable relationship. 
* The hours of 5 and 7 pm are when people are most active. 
* There is a negative correlation between sleep duration and sedentary minutes.    

Since its launch, Bellabeat has empowered women by offering information about their levels of activity, sleep, stress, hydration, and reproductive health. Bellabeat's growth can be encouraged by making recommendations based on an analysis of Fitbit users' behavior and feature responses.

The Bellabeat app needs to be entirely redesigned and updated. Instead of only offering health statistics, the app ought to motivate users to achieve their fitness objectives and function as a social media hub.

## Conclusion

This case study aimed to analyze Fitbit users' smart device usage in order to pinpoint possible areas of growth for Bellabeat, a wellness brand, and enhance their marketing approach. It can be inferred from the data that most users of fitness smart devices are employed individuals who are unable to fit in the prescribed number of active minutes because of their hectic schedules. It is therefore advised that Bellabeat target working professionals with its marketing strategy and product offerings by offering customized exercise plans and introducing mild inactivity alarms. Furthermore, because sleep has so many advantages, it is advised to highlight how important it is. These suggestions and findings stem from the Fitbit data analysis. However, further analysis into other smart device companies such as the Apple Watch or Garmin is advised to support these results and provide additional insight into Bellabeat’s strategies.


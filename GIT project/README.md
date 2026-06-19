# **# Transactional Fraud Detection Analysis**



### Project Overview

Financial fraud is a multi-billion dollar problem that erodes customer trust and causes significant losses for companies.The challenge of this project is to distinguish fraudulent transactions from legitimate ones, which are often hidden within millions of daily transactions. This analysis involves processing historical financial records to identify patterns of fraud and build a baseline predictive model to flag suspicious activities in real-time.



# Tech Stack

 Database: MySQL (Data Extraction \& Profiling)

 Core Language: Python (Jupiter Notebook)

 Libraries : Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn 

 Reporting: Power BI / Tableau 





## Development Phases & Milestones



## 1: Data Preparation and Initial Exploration

In this phase, the primary focus was establishing the database environment, successfully extracting the transaction history, and conducting initial data profiling.



 1. Database Setup & Data Loading

A local schema was initialized, and the historical dataset containing 284,807 transactions was imported into a structured table with the help of the import wizard.




 2. Data Loading & Profiling

the dataset was loaded directly into a Python environment using Pandas to execute data profiling, cleaning, and an assessment of class imbalances.

The dataset containing 284,807 transactional records was loaded into a Jupyter Notebook using `pd.read_csv()`. Initial structural profiling was completed using baseline Pandas functions:
 `df.info()`: Confirmed data types consist entirely of numerical data (`float64` and `int64`).
 `df.describe()`: Evaluated baseline means, minimums, maximums, and standard deviations for transaction amounts and elapsed times.

 3. Data Cleaning & Integrity Check
A programmatic null-value check was performed across all 31 features using `df.isnull().sum()`. 
#Result-- 0 missing or null values were identified, confirming total data integrity. No row dropping or imputation was necessary.

 4. Class Imbalance Evaluation
Using `df['Class'].value_counts()`, an extreme class imbalance was observed:
* Legitimate Transactions (Class 0): 284,315 entries (~99.83% of the dataset)
* Fraudulent Transactions (Class 1): 492 entries (~0.17% of the dataset)

*Conclusion: Because fraud represents less than 1% of total transaction volumes, standard model evaluation metrics like "Accuracy" will be completely deceptive . The baseline model must be evaluated very strictly.

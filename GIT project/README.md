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




 Task 2: Exploratory Data Analysis (EDA)
In this phase, analysis was conducted via Excel to visually map transaction attributes and isolate core markers of fraud.

1. Hypothesis 1 Testing: Amount vs. Class
Finding: Fraudulent transactions demonstrate a vastly restricted distribution shape compared to standard commercial traffic. While legitimate charges contain extreme luxury outliers, fraud focuses heavily on medium-sized amounts designed to bypass automated security limits.

 2. Hypothesis 2 Testing: Temporal Analysis
Finding: Legitimate consumer purchasing plummets by over 70% during standard resting hours (12 AM – 5 AM). Conversely, fraudulent transaction density spikes sharply during these exact hours, validating that bad actors deliberately exploit off-peak operational monitoring gaps.

 3. Top Core Statistical Indicators
Using Excel's Data Analysis Correlation Toolpak, the masked features demonstrating the absolute strongest mathematical relationship with a fraud signal (class) were identified:
Top Positive Drivers
Top Negative Drivers



📊 Task 3: Feature Engineering & Baseline Modeling (Week 3 Summary) 
In this phase, the project shifted from exploratory analysis to preparing data for machine learning, establishing a robust baseline classifier, and handling severe class imbalance

🛠️  Implementation 

1.Feature Engineering: - Applied a log transformation (`Log_Amount = ln(Amount + 1)`) to the transaction amounts. This normalized the heavily right-skewed feature distribution and stabilized variance across standard operations. 

2. Stratified Train-Test Split: - Isolated predictors from the target variable (`Class`) Conducted a 70/30 stratified split using `train_test_split(stratify=y). Stratification ensures both training and testing datasets contain the exact same minority-to-majority class ratio, preventing evaluation bias. 

3. Feature Scaling:- Used `Standard Scaler` to normalize features to a uniform scale (mean = 0, variance = 1). This optimization step is critical to prevent features with naturally larger ranges from dominating the Logistic Regression algorithm. 

4. Handling Severe Class Imbalance: - Standard classifiers optimize for overall accuracy, which fails on fraud datasets. To address this, the model was trained using `class_weight='balanced'. This mathematically penalizes misclassifications of the minority (fraud) class much more heavily during training. 

5. Baseline Model Training - Implemented a standardized Logistic Regression classifier to establish a baseline performance benchmark.


--- ### 📈 Model Evaluation Metrics Because accuracy is misleading for fraud detection, high-value financial evaluation metrics were leveraged:
 | Metric | Score | Analytical Interpretation ROC-AUC-0.9416 | Indicates exceptional predictive power and class separation capability across all decision thresholds. 
| | Recall (Class 1 - Fraud) - 0.91 | Primary Success Metric: The baseline model successfully caught 91% of all actual fraudulent transactions, significantly minimizing potential financial exposure
 | | Precision (Class 1 - Fraud) - 0.06 | Out of all transactions flagged as suspicious by the model, 6% were true positives. While this introduces false positives, it is an expected operational trade-off to ensure a high catch rate in baseline systems.
 | | F1-Score (Class 1 - Fraud) -0.11** | The harmonic mean balancing precision and recall under extreme class imbalance constraints. |


 ---## 🔍 Top Key Risk Indicators By extracting the baseline model's internal feature coefficients, the variables that provide the strongest statistical signal for flagging fraudulent behavior were identified
1. Feature `V4`(Coefficient: `1.1578`) – The most powerful positive indicator of fraud in the dataset. Higher values in this component strongly escalate the transaction risk profile. 
2. Feature `V11`(Coefficient: `0.7937`) – Acted as a secondary positive driver of suspicious transaction markers. 
3. Feature `V14`(Coefficient: `-1.7135`) & `V12`(Coefficient: `-1.2185`) – Showed strong negative correlation coefficients, meaning significant drops in these specific values are highly descriptive of fraudulent activities.

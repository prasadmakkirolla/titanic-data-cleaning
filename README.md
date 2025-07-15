# Titanic Data Cleaning & Feature Engineering 🛳️

This project is part of my apprenticeship-readiness sprint — focused on mastering real-world data cleaning and feature engineering using `pandas`.

## 📂 Dataset

Original: [Kaggle Titanic Dataset](https://www.kaggle.com/c/titanic/data)  
Cleaned version: `titanic_cleaned.csv` (891 rows × 14 columns)

## 🧼 Cleaning Steps

- Handled missing values (`Age`, `Embarked`, `Cabin`)
- Converted categorical fields to consistent formats
- Extracted features from Name and Family Size
- Created `IsAlone` flag
- Categorized passengers into `AgeGroup` buckets

## 🔍 Features Added

| Feature     | Description                                 |
|-------------|---------------------------------------------|
| `IsAlone`   | 1 if no family onboard (SibSp + Parch = 0)  |
| `AgeGroup`  | Binned ages into Child, Adult, Senior       |

## 📈 Next Steps

This cleaned dataset will be used for:

- Exploratory Data Analysis (EDA)
- Logistic Regression model (predict survival)
- Dashboarding with Power BI

## 🛠️ Tools Used

- Python (pandas, numpy)
- Jupyter Notebook

## 📬 Contact

Made by [Prasad Makkirolla](https://github.com/prasadmakkirolla)  

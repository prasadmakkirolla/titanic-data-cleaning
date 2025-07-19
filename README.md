# Titanic Data Cleaning & Feature Engineering 🛳️

This project is part of my apprenticeship-readiness sprint — focused on mastering real-world data cleaning, feature engineering, and SQL for analytics.

---

## 📂 Dataset
- **Original dataset**: `train.csv` from the [Kaggle Titanic Challenge](https://www.kaggle.com/competitions/titanic/data)
- **Cleaned version**: `titanic_cleaned.csv` (891 rows × 14 columns)

---

## 🧼 Day 1: Python Cleaning in Pandas

📘 Notebook: [`notebooks/day1.ipynb`](notebooks/day1.ipynb)

Steps:
- Loaded raw Titanic CSV into pandas
- Explored missing values (`Age`, `Cabin`, `Embarked`)
- Filled missing values using strategy:
  - `Age`: median
  - `Embarked`: mode
- Created new features:
  - `IsAlone`: 1 if `SibSp + Parch == 0`
  - `FamilySize`: `SibSp + Parch + 1`
  - `AgeGroup`: Child, Adult, Senior
- Saved cleaned output as `titanic_cleaned.csv`

---

## 🧮 Day 2: SQL Cleaning with DuckDB

📘 Notebook: [`notebooks/day2.ipynb`](notebooks/day2.ipynb)  
💾 SQL Pipeline: [`sql/titanic_cleaning_pipeline.sql`](sql/titanic_cleaning_pipeline.sql)

Steps:
- Loaded raw CSV into DuckDB using SQL
- Handled NULLs (`Age`, `Embarked`) with `COALESCE` and CASE statements
- Engineered features:
  - `FamilySize`, `IsAlone`, `AgeGroup`
  - Normalized `Sex` column
- Created SQL views for clean modular queries
- Enriched `Embarked` column with port names & countries
- Exported final cleaned data as `titanic_cleaned.csv`

---

## 🧠 Features Added
| Feature       | Description                                  |
|---------------|----------------------------------------------|
| `IsAlone`     | 1 if no family onboard (`SibSp + Parch = 0`) |
| `AgeGroup`    | Binned `Age` into Child, Adult, Senior        |
| `FamilySize`  | Total number of people in a family (incl. self) |
| `Port_Name`   | Mapped `Embarked` code to real port names     |
| `Country`     | Country of port of embarkation                |

---

## 📊 Next Steps
This cleaned dataset will be used for:

- Day 3: Exploratory Data Analysis (EDA) in SQL
- Day 4: Basic Logistic Regression (in Python)
- Day 5+: Dashboarding with Power BI

---

## 🛠️ Tools Used
- Python (`pandas`, `numpy`)
- SQL (DuckDB)
- Jupyter Notebook
- GitHub

---

## 📬 Contact
Made by **Prasad Makkirolla**  

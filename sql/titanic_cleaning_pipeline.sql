
-- Load the Titanic CSV file
CREATE OR REPLACE TABLE titanic AS
SELECT * FROM read_csv_auto('data/train.csv');

-- Handle missing Age with median
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Age) AS median_age
FROM titanic WHERE Age IS NOT NULL;

-- Create titanic_features table with cleaned fields
CREATE OR REPLACE TABLE titanic_features AS
SELECT 
    PassengerId,
    Name,
    Sex,
    COALESCE(Age, 28.0) AS Age,
    CASE 
        WHEN Age < 18 THEN 'Child'
        WHEN Age < 60 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup,
    SibSp,
    Parch,
    (SibSp + Parch) AS FamilySize,
    CASE 
        WHEN (SibSp + Parch) = 0 THEN 1
        ELSE 0
    END AS IsAlone,
    Fare,
    COALESCE(Embarked, 'S') AS Embarked,
    Cabin,
    Pclass
FROM titanic;

-- Enrich port info using VALUES
CREATE OR REPLACE VIEW titanic_features_enriched AS
SELECT 
    tf.*,
    t.Port_name,
    t.Country
FROM titanic_features tf
LEFT JOIN (
    VALUES 
        ('S', 'Southampton', 'UK'),
        ('C', 'Cherbourg', 'France'),
        ('Q', 'Queenstown', 'Ireland')
) AS t(Embarked, Port_name, Country)
ON tf.Embarked = t.Embarked;

-- Export cleaned data
COPY (
    SELECT * FROM titanic_features_enriched
)
TO 'data/titanic_cleaned.csv'
WITH (HEADER, DELIMITER ',');

# Predicting Early Functional Decline from Longitudinal Biomarker Trajectories

This repository contains code accompanying the AMIA submission:

**Predicting Early Functional Decline from Longitudinal Laboratory and Vital Sign Trajectories**

## Overview

Functional decline in older adults is often detected only after observable gait impairment or a fall. This project investigates whether **longitudinal trajectories of routine laboratory values and vital signs** can identify patients at risk earlier.

Using data from the **All of Us Research Program**, we derived temporal features from routine biomarkers and trained machine learning models to predict mobility decline.

---

## Dataset

Data used in this study come from the **All of Us Research Program Controlled Tier Dataset (v8)**.

Because these data contain protected health information, **patient-level data cannot be shared in this repository**.

This repository therefore includes **code and SQL queries only**.

Researchers wishing to reproduce the analysis should obtain access through the **All of Us Researcher Workbench** or apply the provided queries to their own **OMOP Common Data Model database**.

---

## Biomarkers Used

The following biomarkers were extracted from the OMOP `measurement` table using standard concept identifiers.

| Biomarker                | OMOP Concept ID   |
| ------------------------ | ----------------- |
| Albumin                  | 3024561           |
| BMI                      | 3038553           |
| Creatinine               | 3016723           |
| Diastolic Blood Pressure | 3012888           |
| HbA1c                    | 3004410, 3005673  |
| Hemoglobin               | 40795725          |
| Sodium                   | 3019550           |
| Systolic Blood Pressure  | 3004249           |
| Vitamin D                | 3020149, 40765040 |

Physiologically implausible values were removed using predefined ranges as described in the manuscript.

---

## Outcome Definition

Mobility decline cases were identified using ICD-10 codes recorded in the OMOP `condition_occurrence` table.

| ICD-10 Code | Description                      |
| ----------- | -------------------------------- |
| R26.2       | Difficulty in walking            |
| R26.81      | Unsteadiness on feet             |
| R26.9       | Abnormality of gait and mobility |
| Z74.09      | Other reduced mobility           |
| M62.81      | Muscle weakness                  |
| W19         | Unspecified fall                 |

The earliest qualifying diagnosis was treated as the **index date**.

---

## Feature Engineering

For each biomarker we computed longitudinal trajectory descriptors:

* mean
* standard deviation
* delta (last − first)
* slope (linear trend)
* measurement count

These features summarize the **temporal dynamics of biomarker measurements** in the three-year pre-index window.

---

## Models Evaluated

The following machine learning models were evaluated:

* Logistic Regression
* Random Forest
* XGBoost
* LightGBM

Evaluation metrics included:

* AUROC
* AUPRC
* DeLong statistical comparison
* SHAP interpretability
* calibration analysis

---

## Repository Structure

```
sql/
    extract_biomarkers.sql
    extract_mobility_decline.sql
    extract_demographics.sql

feature_engineering/
    trajectory_features.py

modeling/
    train_lightgbm.py
    cross_validation.py
    delong_test.py

analysis/
    shap_analysis.py
    calibration_analysis.py
```

---

## Pipeline Overview

The SQL queries in `/sql` extract raw data from an **OMOP Common Data Model database**.

The full modeling pipeline involves the following steps:

1. Extract biomarker measurements using `extract_biomarkers.sql`
2. Extract mobility decline outcomes using `extract_mobility_decline.sql`
3. Extract demographic variables
4. Assign index dates for cases and pseudo-index dates for controls
5. Restrict measurements to a **three-year pre-index observation window**
6. Compute trajectory features
7. Train machine learning models and evaluate predictive performance

---

## Data Access Notice

This repository contains **SQL queries and analysis code only**.

No patient-level data or outputs are included.

All queries must be executed within a secure **OMOP Common Data Model environment**.

---

## Authors

Rashmita Kudamala
Aravind V. Kuruvikkattil
Lalitha Pranathi Pulavarthy
Saptarshi Purkayastha

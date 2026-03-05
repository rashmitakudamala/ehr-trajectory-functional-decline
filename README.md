# Predicting Early Functional Decline from Longitudinal Biomarker Trajectories

This repository contains the **SQL queries and analysis notebook** used for the AMIA submission:

**Predicting Early Functional Decline from Longitudinal Laboratory and Vital Sign Trajectories**

The goal of this repository is to enable **reproducible data extraction and analysis using the OMOP Common Data Model (CDM)**.

---

## Overview

This project investigates whether **longitudinal trajectories of routine laboratory values and vital signs** can predict early functional mobility decline.

Using electronic health record data mapped to the **OMOP Common Data Model**, we:

1. Extract biomarker measurements and vital signs
2. Identify mobility decline outcomes
3. Construct longitudinal trajectory features
4. Train machine learning models to predict functional decline

The repository provides the **data extraction logic and modeling pipeline** needed to reproduce the analysis in any OMOP-compatible EHR database.

---

## Dataset

The original study was conducted using the **All of Us Research Program Controlled Tier Dataset (v8)**.

Because these data contain protected health information, **no patient-level data are included in this repository**.

Researchers wishing to reproduce the analysis should obtain access to:

- the **All of Us Researcher Workbench**, or
- another **OMOP CDM–compatible clinical database**

and execute the provided queries within that environment.

---

## Biomarkers Extracted

Biomarkers were extracted from the OMOP `measurement` table.

Variables included:

- Albumin
- Body Mass Index (BMI)
- Creatinine
- Diastolic Blood Pressure
- Hemoglobin A1c (HbA1c)
- Hemoglobin
- Sodium
- Systolic Blood Pressure
- 25-hydroxyvitamin D

Measurements were filtered using physiologically plausible ranges to remove implausible values.

---

## Mobility Decline Outcome

Mobility decline events were identified using diagnosis codes recorded in the OMOP `condition_occurrence` table, including:

- R26.2 — Difficulty walking
- R26.81 — Unsteadiness on feet
- R26.9 — Abnormal gait
- Z74.09 — Reduced mobility
- M62.81 — Muscle weakness
- W19 — Unspecified fall

The **first recorded diagnosis** was used as the mobility decline index date.

---

## Repository Structure

```
ehr-trajectory-functional-decline/

README.md

notebook/
    trajectory_functional_decline_pseudo_index_fixed_method.ipynb

sql/
    extract_biomarkers.sql
    extract_mobility_decline.sql
    extract_demographics.sql

.gitignore
requirements.txt
```

The notebook contains:

- cohort construction logic
- pseudo-index sampling for controls
- longitudinal trajectory feature engineering
- machine learning models (LightGBM, XGBoost, etc.)
- model evaluation (AUC, PR curves, calibration)
- SHAP interpretation

---

## Data Access Notice

This repository contains **analysis code only**.

No patient-level data or query outputs are included.

All queries and analyses must be executed within a secure **OMOP Common Data Model environment**.

---

## Authors

Rashmita Kudamala  
Aravind V. Kuruvikkattil  
Lalitha Pranathi Pulavarthy  
Saptarshi Purkayastha
```

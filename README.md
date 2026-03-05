# Predicting Early Functional Decline from Longitudinal Biomarker Trajectories

This repository contains code accompanying the AMIA submission:

**Predicting Early Functional Decline from Longitudinal Laboratory and Vital Sign Trajectories**

## Overview

Functional decline in older adults is often detected only after observable gait impairment or a fall. This project investigates whether **longitudinal trajectories of routine laboratory values and vital signs** can identify patients at risk earlier.

Using data from the **All of Us Research Program**, we derived temporal features from routine biomarkers and trained machine learning models to predict mobility decline.

## Dataset

Data used in this study come from the **All of Us Research Program Controlled Tier Dataset (v8)**.

Because these data contain protected health information, **patient-level data cannot be shared in this repository**.

This repository includes **code and queries only**.

Researchers wishing to reproduce the analysis should obtain access through the All of Us Researcher Workbench or apply the provided queries to their own **OMOP Common Data Model database**.

## Biomarkers Used

* Hemoglobin
* Albumin
* Sodium
* Creatinine
* HbA1c
* Vitamin D
* Body Mass Index (BMI)
* Systolic Blood Pressure
* Diastolic Blood Pressure

## Feature Engineering

For each biomarker we compute trajectory descriptors:

* mean
* standard deviation
* delta (last – first)
* slope (rate of change)
* measurement count

## Models Evaluated

* Logistic Regression
* Random Forest
* XGBoost
* LightGBM

Evaluation metrics:

* AUROC
* AUPRC
* DeLong statistical testing
* SHAP interpretability
* calibration analysis

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

## Data Access Notice

This repository contains **SQL queries and analysis code only**.

No patient-level data or outputs are included.

All queries must be executed within a secure **OMOP Common Data Model environment**.

## Authors

Rashmita Kudamala
Aravind V. Kuruvikkattil
Lalitha Pranathi Pulavarthy
Saptarshi Purkayastha

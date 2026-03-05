# Predicting Early Functional Decline from Longitudinal Biomarker Trajectories

This repository contains **SQL queries used to extract study data** for the AMIA submission:

**Predicting Early Functional Decline from Longitudinal Laboratory and Vital Sign Trajectories**

---

## Overview

This repository provides SQL queries used to extract biomarker measurements, mobility decline outcomes, and demographic information from an **OMOP Common Data Model (CDM)** database.

These queries allow other institutions with OMOP-compatible EHR systems to extract equivalent datasets for replication or validation studies.

---

## Dataset

The original study was conducted using the **All of Us Research Program Controlled Tier Dataset (v8)**.

Because these data contain protected health information, **no patient-level data are included in this repository**.

The repository contains **SQL queries only**.

Researchers wishing to reproduce the analysis should obtain access to the All of Us Researcher Workbench or execute these queries on their own **OMOP CDM database**.

---

## Biomarkers Extracted

The following biomarkers were extracted from the OMOP `measurement` table:

* Albumin
* Body Mass Index (BMI)
* Creatinine
* Diastolic Blood Pressure
* Hemoglobin A1c (HbA1c)
* Hemoglobin
* Sodium
* Systolic Blood Pressure
* 25-hydroxyvitamin D

Measurements were filtered using predefined physiologic ranges to remove implausible values.

---

## Mobility Decline Outcome

Mobility decline events were identified using ICD-10 codes recorded in the OMOP `condition_occurrence` table:

* R26.2 — Difficulty in walking
* R26.81 — Unsteadiness on feet
* R26.9 — Abnormality of gait and mobility
* Z74.09 — Other reduced mobility
* M62.81 — Muscle weakness
* W19 — Unspecified fall

---

## Repository Structure

```
sql/
    extract_biomarkers.sql
    extract_mobility_decline.sql
    extract_demographics.sql
```

---

## Data Access Notice

This repository contains **SQL queries only**.

No patient-level data or query outputs are included.

All queries must be executed within a secure **OMOP Common Data Model environment**.

---

## Authors

Rashmita Kudamala
Aravind V. Kuruvikkattil
Lalitha Pranathi Pulavarthy
Saptarshi Purkayastha

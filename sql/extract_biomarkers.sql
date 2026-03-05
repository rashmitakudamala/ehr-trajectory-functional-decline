-- Extract biomarker measurements used in trajectory modeling
-- Compatible with OMOP Common Data Model

-- DATA ACCESS NOTICE
-- This repository contains SQL queries only.
-- No patient-level data are included.
-- Queries are written for the OMOP Common Data Model.

SELECT
    m.person_id,
    m.measurement_concept_id,
    c.concept_name AS biomarker,
    m.measurement_datetime,
    m.value_as_number,
    u.concept_name AS unit
FROM measurement m

LEFT JOIN concept c
    ON m.measurement_concept_id = c.concept_id

LEFT JOIN concept u
    ON m.unit_concept_id = u.concept_id

WHERE
(
    -- BMI
    (m.measurement_concept_id = 3038553
        AND m.value_as_number BETWEEN 10 AND 80)

    OR

    -- Systolic blood pressure
    (m.measurement_concept_id = 3004249
        AND m.value_as_number BETWEEN 70 AND 250)

    OR

    -- Diastolic blood pressure
    (m.measurement_concept_id = 3012888
        AND m.value_as_number BETWEEN 40 AND 150)

    OR

    -- Sodium
    (m.measurement_concept_id = 3019550
        AND m.value_as_number BETWEEN 110 AND 170)

    OR

    -- Creatinine
    (m.measurement_concept_id = 3016723
        AND m.value_as_number BETWEEN 0.2 AND 15)

    OR

    -- Hemoglobin
    (m.measurement_concept_id = 40795725
        AND m.value_as_number BETWEEN 50 AND 200)

    OR

    -- Albumin
    (m.measurement_concept_id = 3024561
        AND m.value_as_number BETWEEN 10 AND 60)

    OR

    -- HbA1c
    (m.measurement_concept_id IN (3004410,3005673)
        AND m.value_as_number BETWEEN 3 AND 18)

    OR

    -- Vitamin D
    (m.measurement_concept_id IN (3020149,40765040)
        AND m.value_as_number BETWEEN 5 AND 150)
)

AND m.value_as_number IS NOT NULL

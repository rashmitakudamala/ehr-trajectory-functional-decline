-- Extract mobility decline diagnoses
-- OMOP-compatible query

SELECT
    person_id,
    condition_start_datetime,
    condition_source_value
FROM condition_occurrence

WHERE condition_source_value IN
(
'R26.2',   -- Difficulty walking
'R26.81',  -- Unsteadiness on feet
'R26.9',   -- Abnormal gait
'Z74.09',  -- Reduced mobility
'M62.81',  -- Muscle weakness
'W19'      -- Fall
)

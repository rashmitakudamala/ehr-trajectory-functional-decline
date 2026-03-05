-- Extract patient demographics
-- OMOP-compatible query

SELECT
    p.person_id,
    p.year_of_birth,
    c.concept_name AS gender

FROM person p

LEFT JOIN concept c
    ON p.gender_concept_id = c.concept_id

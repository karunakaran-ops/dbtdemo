
INSERT OVERWRITE TABLE dbtdbx_data.default.patient_revenue_summary 
WITH patient_data AS (
    SELECT
        state,
        sex,
        disease_condition,
        treatment_cost
    FROM 
        dbtdbx_data.default.patient_treatment_summary
)
SELECT
    state,
    sex,
    disease_condition,
    SUM(treatment_cost) AS total_revenue
FROM
    patient_data
GROUP BY
    state,
    sex,
    disease_condition
ORDER BY
    total_revenue DESC

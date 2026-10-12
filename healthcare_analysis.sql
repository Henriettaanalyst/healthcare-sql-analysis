-- Healthcare SQL Analysis Portfolio
-- Database: SQLite
-- Dataset: Synthetic healthcare operations data; contains no real patient records.
-- Run each analysis separately in DB Browser for SQLite if you want to inspect its results.

-- ============================================================
-- Analysis 1
-- Business Question: What percentage of the patient population does each gender represent?
-- ============================================================
SELECT
    gender,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS percentage_of_patients
FROM patients
GROUP BY gender
ORDER BY percentage_of_patients DESC;

-- ============================================================
-- Analysis 2
-- Business Question: How many patients are registered from each state, and what proportion of the total patient population does each state represent?
-- ============================================================
SELECT
    state,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS percentage_of_patients
FROM patients
GROUP BY state
ORDER BY patient_count DESC;

-- ============================================================
-- Analysis 3
-- Business Question: How many hospital admissions occurred for each admission type?
-- ============================================================
SELECT
    admission_type,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY admission_type
ORDER BY admission_count DESC;

-- ============================================================
-- Analysis 4
-- Business Question: How many hospital admission was recorded at each hospital
-- ============================================================
SELECT
    hospitals.hospital_name,
    COUNT(*) AS admission_count
FROM admissions
JOIN hospitals
    ON admissions.hospital_id = hospitals.hospital_id
GROUP BY hospitals.hospital_name
ORDER BY admission_count DESC;

-- ============================================================
-- Analysis 5
-- Business Question: How are admissions distributed across different admission types at each hospital?
-- ============================================================
SELECT
    hospital_id,
    admission_type,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY hospital_id, admission_type
ORDER BY hospital_id, admission_count DESC;

-- ============================================================
-- Analysis 6
-- Business Question: What is the average billing amount associated with admissions at each hospital?
-- ============================================================
SELECT
    hospital_id,
    ROUND(AVG(billing_amount), 2) AS average_billing_amount
FROM admissions
GROUP BY hospital_id
ORDER BY average_billing_amount DESC;

-- ============================================================
-- Analysis 7
-- Business Question: How were hospital admissions distributed by discharge status?
-- ============================================================
SELECT
    discharge_status,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY discharge_status
ORDER BY admission_count DESC;

-- ============================================================
-- Analysis 8
-- Business Question: Which diagnoses were recorded most frequently across hospital admissions?
-- ============================================================
SELECT
    diagnoses.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM patient_diagnoses
JOIN diagnoses
    ON patient_diagnoses.diagnosis_id = diagnoses.diagnosis_id
GROUP BY diagnoses.diagnosis_name
ORDER BY diagnosis_count DESC;

-- ============================================================
-- Analysis 9
-- Business Question: How do discharge outcomes differ across hospitals?
-- ============================================================
SELECT
    hospital_id,
    discharge_status,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY hospital_id, discharge_status
ORDER BY hospital_id, admission_count DESC;

-- ============================================================
-- Analysis 10
-- Business Question: Which medications were prescribed most frequently across hospital admissions?
-- ============================================================
SELECT
    medications.medication_name,
    COUNT(*) AS prescription_count
FROM prescriptions
JOIN medications
    ON prescriptions.medication_id = medications.medication_id
GROUP BY medications.medication_name
ORDER BY prescription_count DESC;

-- ============================================================
-- Analysis 11: Average Length of Stay by Admission Type
-- ============================================================
SELECT
    admission_type,
    ROUND(
        AVG(julianday(discharge_date) - julianday(admission_date)),
        2
    ) AS average_length_of_stay_days
FROM admissions
GROUP BY admission_type
ORDER BY average_length_of_stay_days DESC;

-- ============================================================
-- Analysis 12: Average Billing Amount by Admission Type
-- ============================================================
SELECT
    admission_type,
    ROUND(AVG(billing_amount), 2) AS average_billing_amount
FROM admissions
GROUP BY admission_type
ORDER BY average_billing_amount DESC;

-- ============================================================
-- Analysis 13
-- Business Question: Which diagnoses are recorded most frequently among male and female patients?
-- ============================================================
SELECT
    patients.gender,
    diagnoses.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM patients
JOIN admissions
    ON patients.patient_id = admissions.patient_id
JOIN patient_diagnoses
    ON admissions.admission_id = patient_diagnoses.admission_id
JOIN diagnoses
    ON patient_diagnoses.diagnosis_id = diagnoses.diagnosis_id
GROUP BY
    patients.gender,
    diagnoses.diagnosis_name
ORDER BY
    patients.gender,
    diagnosis_count DESC;

-- ============================================================
-- Analysis 14
-- Business Question: Which diagnoses are recorded most frequently at each hospital?
-- ============================================================
SELECT
    hospitals.hospital_name,
    diagnoses.diagnosis_name,
    COUNT(*) AS diagnosis_count
FROM hospitals
JOIN admissions
    ON hospitals.hospital_id = admissions.hospital_id
JOIN patient_diagnoses
    ON admissions.admission_id = patient_diagnoses.admission_id
JOIN diagnoses
    ON patient_diagnoses.diagnosis_id = diagnoses.diagnosis_id
GROUP BY
    hospitals.hospital_name,
    diagnoses.diagnosis_name
ORDER BY
    diagnosis_count DESC;

-- ============================================================
-- Analysis 15
-- Business Question: How are laboratory results distributed across normal, high, and low result statuses for each test?
-- ============================================================
SELECT
    test_name,
    result_flag,
    COUNT(*) AS result_count
FROM lab_results
GROUP BY
    test_name,
    result_flag
ORDER BY
    result_count DESC;

-- ============================================================
-- Analysis 16
-- Business Question: Which medication categories are prescribed most frequently?
-- ============================================================
SELECT
    medications.medication_category,
    COUNT(*) AS prescription_count
FROM prescriptions
JOIN medications
    ON prescriptions.medication_id = medications.medication_id
GROUP BY medications.medication_category
ORDER BY prescription_count DESC;

-- ============================================================
-- Analysis 17
-- Business Question: Which doctors handled the highest number of patient admissions?
-- ============================================================
SELECT
    doctors.doctor_name,
    doctors.specialty,
    COUNT(*) AS admission_count
FROM admissions
JOIN doctors
    ON admissions.doctor_id = doctors.doctor_id
GROUP BY
    doctors.doctor_name,
    doctors.specialty
ORDER BY
    admission_count DESC;

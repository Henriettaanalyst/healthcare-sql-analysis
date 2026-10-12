# Healthcare SQL Portfolio Dataset

Synthetic healthcare data created for SQL portfolio practice. No real patient records are included.

## Tables
- `patients`: patient demographics, location, insurance and registration.
- `hospitals`: hospital/facility information.
- `departments`: departments belonging to hospitals.
- `doctors`: clinicians assigned to departments.
- `diagnoses`: diagnosis reference table and disease categories.
- `medications`: medication reference table.
- `admissions`: hospital encounters, dates, admission type, outcome and billing.
- `patient_diagnoses`: bridge table linking admissions to diagnoses; `primary_diagnosis=1` identifies the primary diagnosis.
- `lab_results`: laboratory results linked to admissions.
- `prescriptions`: medications prescribed during admissions.

## Key relationships
- `patients.patient_id` → `admissions.patient_id`
- `hospitals.hospital_id` → `departments.hospital_id` and `admissions.hospital_id`
- `departments.department_id` → `doctors.department_id` and `admissions.department_id`
- `doctors.doctor_id` → `admissions.doctor_id`
- `admissions.admission_id` → `patient_diagnoses.admission_id`, `lab_results.admission_id`, `prescriptions.admission_id`
- `diagnoses.diagnosis_id` → `patient_diagnoses.diagnosis_id`
- `medications.medication_id` → `prescriptions.medication_id`

## Dataset size
- 1,000 patients
- 5 hospitals
- 30 departments
- 120 doctors
- 14 diagnoses
- 10 medications
- 5,000 admissions
- ~6,700 diagnosis records
- ~10,000 laboratory records
- ~10,000 prescriptions

## Important note
The data is intentionally synthetic and designed for learning/portfolio analysis. It should not be presented as real hospital performance data.

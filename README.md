# Healthcare SQL Analysis Portfolio

## Project overview

This project uses SQL and SQLite to explore a synthetic healthcare dataset. The analysis focuses on patient demographics, hospital admissions, billing, discharge outcomes, diagnoses, prescriptions, laboratory results, length of stay, and doctor workload.

**Tools:** SQLite, DB Browser for SQLite, SQL, GitHub  
**Data privacy:** The database is synthetic and does not contain real patient records or real patient-identifying information.

## Objectives

- Describe the patient population by gender and state.
- Compare admission volumes and admission types across hospitals.
- Explore average billing amounts and length of stay.
- Summarize discharge statuses and diagnosis frequencies.
- Examine medication and medication-category prescribing patterns.
- Explore laboratory result flags and doctor admission workload.

## Dataset at a glance

| Table | Rows |
|---|---:|
| patients | 1,000 |
| hospitals | 5 |
| departments | 30 |
| doctors | 120 |
| diagnoses | 14 |
| medications | 10 |
| admissions | 5,000 |
| patient_diagnoses | 6,722 |
| lab_results | 10,021 |
| prescriptions | 10,008 |

The database contains linked tables with primary and foreign keys. See [`documentation/data_dictionary.md`](documentation/data_dictionary.md) and [`documentation/relationship_map.md`](documentation/relationship_map.md) for field definitions and table relationships.

## Methods

The SQL analysis uses `COUNT`, `AVG`, `ROUND`, `GROUP BY`, `ORDER BY`, subqueries, date calculations with SQLite's `julianday()`, and joins across related tables. The queries are saved in [`SQL/healthcare_analysis.sql`](SQL/healthcare_analysis.sql).

## Selected findings

- The patient table contains 1,000 records: 517 female patients (51.70%) and 483 male patients (48.30%).
- Lagos has the highest patient count (134; 13.40%); Enugu has the lowest (103; 10.30%).
- There are 5,000 admissions. Routine admissions are the largest group (2,525), followed by Emergency (1,735) and Referral (740).
- Eastern Medical Centre has the largest admission count (1,025); Lagos Central Hospital has the smallest (976).
- Average billing is highest at Rivers General Hospital (448,284.37) and lowest at Eastern Medical Centre (426,071.92) in this synthetic dataset.
- Discharged is the most common discharge status (4,124 admissions), followed by Referred (471), Deceased (254), and Absconded (151).
- Appendicitis (521 records), Malaria (512), and Type 2 Diabetes (507) are the three most frequently recorded diagnoses in the diagnosis table joined to admission diagnosis records.
- Omeprazole (1,038 prescriptions), Ceftriaxone (1,022), and Metformin (1,015) are the most frequently prescribed medications.
- Routine admissions have the longest average stay among the three admission types (3.54 days); Referral admissions average 3.40 days.
- Antibiotics are the most frequent medication category (2,010 prescriptions).
- Dr. Emeka Ibrahim has the highest admission count in the doctor-level analysis (107 admissions).

These findings describe only the generated dataset. They should not be interpreted as real-world clinical or hospital performance conclusions.

## Repository structure

```text
healthcare-sql-analysis/
├── README.md
├── SQL/
│   └── healthcare_analysis.sql
├── data/
│   └── healthcare_sql_portfolio.sqlite
├── documentation/
│   ├── data_dictionary.md
│   └── relationship_map.md
└── insights/
    └── key_findings.md
```

## How to explore

1. Download or clone this repository.
2. Open `data/healthcare_sql_portfolio.sqlite` in DB Browser for SQLite.
3. Open `SQL/healthcare_analysis.sql` in the Execute SQL tab or a text editor.
4. Run queries individually to inspect the results.

## Limitations

The dataset is synthetic and designed for portfolio practice. Results are useful for demonstrating SQL techniques, not for making clinical decisions or claims about real healthcare systems.

# Relationship Map

patients (1) ----< admissions >---- (1) hospitals
                         |
                         +---- departments ----< doctors
                         |
                         +----< patient_diagnoses >---- diagnoses
                         |
                         +----< lab_results
                         |
                         +----< prescriptions >---- medications

Primary analytical path:
patients → admissions → patient_diagnoses → diagnoses

Operational path:
hospitals → departments → doctors → admissions

Clinical detail:
admissions → lab_results
admissions → prescriptions → medications

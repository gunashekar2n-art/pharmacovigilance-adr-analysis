-- Pharmacovigilance ADR Data Cleaning

-- Standardize drug names
UPDATE PV_Mes
SET DrugName = UPPER(TRIM(DrugName));

-- Standardize reactions
UPDATE PV_Mes
SET `Reaction/ADR` = UPPER(TRIM(`Reaction/ADR`));

-- Replace missing patient initials
UPDATE PV_Mes
SET PatientInitials = 'UNKNOWN'
WHERE PatientInitials IS NULL
   OR PatientInitials = '';

-- Standardize seriousness
UPDATE PV_Mes
SET Seriousness = UPPER(Seriousness);

-- Standardize outcomes
UPDATE PV_Mes
SET Outcome = UPPER(Outcome);

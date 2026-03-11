-- Top drugs causing ADR
SELECT DrugName, COUNT(*) AS ADR_Count
FROM PV_Mes
GROUP BY DrugName
ORDER BY ADR_Count DESC;

-- Fatal drug reactions
SELECT DrugName, `Reaction/ADR`
FROM PV_Mes
WHERE Outcome = 'FATAL';

-- Serious vs Non-Serious ADR distribution
SELECT Seriousness, COUNT(*) AS Case_Count
FROM PV_Mes
GROUP BY Seriousness;

-- ADR trend by month
SELECT
YEAR(ReportDate) AS Year,
MONTH(ReportDate) AS Month,
COUNT(*) AS ADR_Cases
FROM PV_Mes
GROUP BY Year, Month
ORDER BY Year, Month;

-- Patients with multiple ADR reports
SELECT PatientInitials, COUNT(*) AS Cases
FROM PV_Mes
GROUP BY PatientInitials
HAVING COUNT(*) > 1;

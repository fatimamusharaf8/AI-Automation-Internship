-- ============================================================
-- Internship Day 14-17: Task 2 - SQL Sales Analytics
-- Database: PostgreSQL
-- Table: leads
-- ============================================================

-- Question 1: How many total leads are there?
SELECT COUNT(*) AS total_leads 
FROM leads;

-- Question 2: How many leads are New, Contacted, Qualified, Converted, Lost?
SELECT status, COUNT(*) AS total_count 
FROM leads 
GROUP BY status;

-- Question 3: What is the average lead score?
SELECT ROUND(AVG(lead_score), 2) AS average_lead_score 
FROM leads;

-- Question 4: Which lead has the highest score?
SELECT * 
FROM leads 
ORDER BY lead_score DESC 
LIMIT 1;

-- Question 5: How many leads came from each source?
SELECT source, COUNT(*) AS lead_count 
FROM leads 
GROUP BY source 
ORDER BY lead_count DESC;

-- Question 6: Display all leads with a score between 50 and 80, sorted from highest to lowest.
SELECT * 
FROM leads 
WHERE lead_score BETWEEN 50 AND 80 
ORDER BY lead_score DESC;
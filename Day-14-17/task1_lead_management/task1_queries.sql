-- Task 1: Build a Lead Management Database

-- 1. Create Table
CREATE TABLE leads (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(30),
    company VARCHAR(150),
    source VARCHAR(50),
    lead_score INTEGER CHECK (lead_score BETWEEN 0 AND 100),
    status VARCHAR(30) DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert 10 Leads
INSERT INTO leads (name, email, phone, company, source, lead_score, status) VALUES
('Ahmed Khan', 'ahmed@example.com', '03001234567', 'Tech Solutions', 'Facebook', 85, 'Qualified'),
('Sara Ali', 'sara@example.com', '03111234567', 'Digital Works', 'LinkedIn', 72, 'Contacted'),
('Usman Raza', 'usman@example.com', '03221234567', 'Raza Traders', 'Website', 91, 'Qualified'),
('Ayesha Malik', 'ayesha@example.com', '03331234567', 'Malik Enterprises', 'Instagram', 64, 'New'),
('Hamza Shah', 'hamza@example.com', '03441234567', 'Shah Foods', 'Referral', 78, 'Contacted'),
('Maham Noor', 'maham@example.com', '03551234567', 'Noor Technologies', 'Facebook', 55, 'New'),
('Bilal Ahmed', 'bilal@example.com', '03661234567', 'Ahmed Services', 'LinkedIn', 88, 'Converted'),
('Hira Fatima', 'hira@example.com', '03771234567', 'Hira Designs', 'Website', 43, 'Lost'),
('Zain Ali', 'zain@example.com', '03881234567', 'Zain Software', 'Facebook', 69, 'New'),
('Laiba Khan', 'laiba@example.com', '03991234567', 'Khan Marketing', 'LinkedIn', 96, 'Converted');

-- 3. Display All Leads
SELECT * FROM leads;

-- 4. Display Qualified Leads
SELECT * FROM leads WHERE status = 'Qualified';

-- 5. Display Leads with Score > 70
SELECT * FROM leads WHERE lead_score > 70;

-- 6. Update One Lead
UPDATE leads SET status = 'Contacted' WHERE id = 1;

-- 7. Delete One Lead
DELETE FROM leads WHERE id = 8;

-- 8. Display Top 5 Leads by Score
SELECT * FROM leads ORDER BY lead_score DESC LIMIT 5;
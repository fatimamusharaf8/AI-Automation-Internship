const urgency = String(inputData.urgency || "").trim().toLowerCase();
const budget = parseFloat(String(inputData.budget || "").replace(/[^0-9.]/g, "")) || 0;
const leadSource = String(inputData.lead_source || "").trim().toLowerCase();

let score = 0;

// Urgency
if (urgency === "high") {
  score += 30;
} else if (urgency === "medium") {
  score += 20;
} else if (urgency === "low") {
  score += 10;
}

// Budget
if (budget > 5000) {
  score += 30;
} else if (budget >= 1000) {
  score += 20;
} else {
  score += 10;
}

// Lead Source
if (leadSource === "referral") {
  score += 20;
} else if (leadSource === "linkedin") {
  score += 15;
}

// Priority
let priority;

if (score >= 70) {
  priority = "Hot";
} else if (score >= 40) {
  priority = "Warm";
} else {
  priority = "Cold";
}

// Lead ID
const year = new Date().getFullYear();
const uniqueNumber = Date.now().toString().slice(-6);
const leadId = `LEAD-${year}-${uniqueNumber}`;

return {
  lead_score: score,
  priority: priority,
  lead_id: leadId
};
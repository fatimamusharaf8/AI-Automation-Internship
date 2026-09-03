================================================================================
URBANCART AI CRM & SUPPORT SYSTEM - TASK 1: PROPOSAL & ARCHITECTURAL SOLUTION
================================================================================

1. KEY BUSINESS PROBLEMS & OBJECTIVES
--------------------------------------------------------------------------------
• Lack of 24/7 Off-Hours Support: Inquiries arriving outside business hours go 
  unanswered until the next day, resulting in lost sales leads.
• Dispersed Data & Siloed Tools: Customer data, order statuses, and complaints 
  are scattered across spreadsheets, e-commerce platforms, and manual logs.
• Manual Order & Policy Lookups: Support agents manually search order statuses 
  and reference policy documents for basic inquiries.
• Document Update Friction: Policy and catalog updates require manual developer 
  intervention to train or update systems.
• Unfocused Team Notifications: Internal communication is fragmented, and team 
  notifications risk becoming overwhelming if not properly filtered.


2. AUTOMATION BOUNDARIES: AUTOMATED VS. HUMAN CONTROL
--------------------------------------------------------------------------------
| Function / Task                  | Automated (AI System)                          | Human Control                                |
|----------------------------------|------------------------------------------------|----------------------------------------------|
| Omnichannel Customer Support     | Handles inquiries, policy lookup (RAG), order  | Updates policy/catalog files in Google Drive. |
|                                  | lookup, and lead capture via Voice/Chat.       |                                              |
| Lead Capture & Enriched Alerts   | Captures leads, pulls historic purchase data   | Sales outreach and deal closing.             |
|                                  | from PostgreSQL, and alerts team via Slack.    |                                              |
| Order Status Lookups            | Queries PostgreSQL database to fetch order     | Exception handling for missing/stalled items.|
|                                  | status using Order ID or phone number.         |                                              |
| Complaints & Escalations        | Detects complaints, logs tickets in Airtable, | Direct human escalation, customer outreach,  |
|                                  | Notion, and flags priority issues in Slack.    | and refund approvals.                        |
| Explicit Human Handoff          | Catches "talk to human" requests, freezes      | Support agent takes over live call/chat.     |
|                                  | AI state, and alerts live agents immediately.  |                                              |
| Document Processing (RAG)        | Ingests Drive docs, chunks, embeds, and updates| Uploads original policy PDFs/Docs to Drive.  |
|                                  | Supabase vector store automatically.           |                                              |


3. USERS & OMNICHANNEL CUSTOMER JOURNEYS
--------------------------------------------------------------------------------
• Omnichannel Journeys (Voice & Chat Equivalence):
  Both Voice (Vapi Voice AI) and Chat act as entry points using equivalent logic:
  - Product & Policy Inquiries (RAG): Uses Supabase vector search to return grounded policy answers.
  - Order Status Tracking: Queries Supabase PostgreSQL `orders` table using Order ID (e.g., UC-10452).
  - Lead Capture & Sales Intent: Collects Name, Phone, Product, Budget, and Location into Airtable CRM.

• Explicit Human Escalation ("Talk to Human" Flow):
  When a customer requests a human agent ("Talk to human", "Connect me to a manager"):
  1. AI Speech Handshake: AI acknowledges the request ("Transferring your request to our team...").
  2. Session State Freeze: Sets `ai_active = false` in n8n/PostgreSQL to stop automated AI replies.
  3. Context Logging: Logs the conversation transcript and customer details.
  4. Priority Dispatch: Logs ticket to Notion/Airtable and dispatches Slack alert to #support-alerts.
  5. Live Takeover: Vapi executes a SIP/PSTN call transfer or records a voice message for off-hours callbacks.


4. INTERNAL PERSONAS & CONTEXT-RICH ALERTS
--------------------------------------------------------------------------------
• Sales Team: Receives high-value lead alerts via Zapier/Slack with customer history (LTV, past orders).
• Operations & Support Team: Receives instant notifications in Slack `#support-alerts` for urgent issues.
• Management: Accesses unified operational records in Airtable CRM and Notion Support Logs.


5. DATA MANAGEMENT & RAG ARCHITECTURE
--------------------------------------------------------------------------------
• PostgreSQL (Supabase): Stores structured core tables (`customers`, `orders`, `conversations`).
• Supabase Vector Store (`pgvector`): Stores embedded chunks of policy docs using `text-embedding-3-small`.
• Airtable CRM: Operational base for sales leads (`Leads` table) and tracking deals.
• Notion: Internal documentation database (`UrbanCart Support Logs`).
• Google Drive: Raw source file repository (`UrbanCart_Knowledge_Base.txt`).

• RAG Processing Pipeline:
  Google Drive Upload --> n8n Trigger --> Text Extraction --> 500-token Chunking 
  --> OpenAI Embedding (`text-embedding-3-small`) --> Supabase Vector Store (`document_knowledge`)


6. END-TO-END SYSTEM ARCHITECTURE
--------------------------------------------------------------------------------
+-------------------------------------------------------------------------------+
|                      FULL OMNICHANNEL TOUCHPOINTS                             |
|  +----------------------------------+    +----------------------------------+ |
|  | Voice Call (Vapi Voice AI)       |    | Chat / Web Interface             | |
|  | - RAG Info, Orders, Leads, Escal.|    | - RAG Info, Orders, Leads, Escal.| |
|  +----------------+-----------------+    +----------------+-----------------+ |
+-------------------|---------------------------------------|-------------------+
                    |                                       |
                    +-------------------+   +---------------+
                                        |   |
                                        v   v
+-------------------------------------------------------------------------------+
|                      WORKFLOW & INTEGRATION ORCHESTRATOR                      |
|                                    (n8n)                                      |
|                                                                               |
|  +-------------------+  +-------------------+  +----------------------------+ |
|  | Full RAG Engine   |  | Order Status      |  | Explicit Human Handoff     | |
|  | (Supabase Vector) |  | DB Lookups        |  | Router & State Freeze      | |
|  +-------------------+  +-------------------+  +----------------------------+ |
+---------------------------------------|---------------------------------------+
                                        |
                                        v
+-------------------------------------------------------------------------------+
|                      DATA & AGGREGATION PLATFORMS                             |
|  +----------------------------------+    +----------------------------------+ |
|  | Supabase DB / PostgreSQL         |    | Airtable CRM & Notion Logs       | |
|  | - Order History & Vector Store   |    | - Leads Table & Support Logs     | |
|  +----------------+-----------------+    +----------------+-----------------+ |
+-------------------|---------------------------------------|-------------------+
                    |                                       |
                    v                                       v
+-------------------------------------------------------------------------------+
|                      NOTIFICATION & AUTOMATION (Zapier / Slack)               |
|                                                                               |
| - Consolidates Lead Details + Conversation Context + Historic Purchases       |
| - Dispatches High-Value Lead Cards & Urgent Escalations to Slack & Gmail      |
+-------------------------------------------------------------------------------+


7. SCENARIO VERIFICATION EXAMPLES
--------------------------------------------------------------------------------
• Scenario 1: Product Inquiry via Voice (RAG)
  Query: "What is your return policy for electronics?"
  Result: Vapi calls `search_knowledge_base` -> n8n searches Supabase Vector Store 
  -> Returns 7-day return eligibility rule.

• Scenario 2: High-Value Lead Capture
  Query: "I want to buy an iPhone 15, my budget is Rs. 200,000, and I live in Lahore."
  Result: Vapi calls `capture_lead` -> n8n logs to Airtable `Leads` table 
  -> Zapier fires email alert to sales team.

• Scenario 3: Order Status Tracking
  Query: "Where is my order UC-10452?"
  Result: Vapi calls `check_order_status` -> n8n queries Supabase PostgreSQL `orders` 
  -> Returns real-time status: "In Transit, delivery scheduled for Sep 3".

• Scenario 4: Human Escalation
  Query: "My item arrived completely broken, connect me to a human manager."
  Result: Vapi calls `escalate_human` -> n8n sends Slack alert to `#support-alerts` 
  and logs ticket in Notion database `UrbanCart Support Logs`.
================================================================================
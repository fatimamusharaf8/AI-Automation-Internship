# UrbanCart AI-Driven CRM & Voice Support System

An end-to-end AI customer support and lead capture platform built for UrbanCart. The system combines voice AI, semantic knowledge retrieval (RAG), real-time order tracking, and automated workflow orchestration.

## System Architecture & Tech Stack
- **Voice AI:** Vapi (Custom tool calling & voice agent)
- **Workflow Orchestration:** n8n
- **Database & Vector Store:** Supabase (PostgreSQL & Vector Store for RAG using `text-embedding-3-small`)
- **CRM:** Airtable (`Leads` table)
- **Internal Logging:** Notion (`UrbanCart Support Logs` database)
- **Alerting & Escalations:** Slack (`#support-alerts`)
- **Follow-up Automation:** Zapier (Airtable-to-Gmail email triggers)
- **Document Source:** Google Drive

## Features
1. **Knowledge Base Search (RAG):** Answers customer policy and product inquiries using embedded document chunks.
2. **Order Status Retrieval:** Looks up live order details in Supabase using Order IDs.
3. **Automated Lead Capture:** Captures high-intent buyer details during calls and syncs them to Airtable and Gmail.
4. **Human Escalation:** Escalates critical support complaints to Slack and logs incidents in Notion.

## Repositories & Schemas
- `schemas/`: Contains JSON schemas for Vapi tool declarations.
- `knowledge-base/`: Contains raw knowledge base documents.
## Setup & Installation

### n8n Workflow Import
1. Open your n8n instance.
2. Select **Workflows** -> **Import from File**.
3. Choose `urbancart-workflow.json`.
4. Re-bind your credentials for Supabase, Airtable, Notion, and Slack.
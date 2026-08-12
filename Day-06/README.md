# 🚀 Day 06 | Airtable Database Design & n8n Automation

## AI Automation Internship — MATalogics

Day 06 focused on learning **Airtable as a no-code relational database** and integrating it with **n8n** to build practical business automation workflows.

The objective was to understand how Airtable can act as a centralized database for AI automation systems and how n8n can connect database events with external actions such as Slack notifications and email communication.

---

# 📌 Day 6 Objectives

The main objectives of Day 06 were:

- Understand Airtable fundamentals
- Create and structure an Airtable database
- Work with Bases, Tables, Fields, Records and Views
- Connect Airtable with n8n
- Perform Airtable CRUD operations
- Build automated workflows using Airtable and n8n
- Send Slack notifications from database events
- Send email notifications based on project updates
- Automatically calculate internship performance scores
- Build the foundation of an AI Agency Database

---

# 🗄️ Module 1 — Airtable Fundamentals

Airtable was explored as a combination of:

> Spreadsheet + Relational Database + Forms + Views + Automation

### Key concepts learned

| Concept | Description |
|---|---|
| Base | Overall Airtable database/project |
| Table | Collection of related records |
| Record | Individual row/item |
| Field | Column/property |
| View | Different way to display records |
| Form | Interface for collecting data |
| Automation | Trigger-based Airtable workflow |
| Interface | Custom dashboard built from Airtable data |

---

# 🏗️ Module 2 — Database Design

Created an Airtable Base:

## `MATalogics AI Operations Base`

The database contains five core tables.

---

## 1. 👥 Clients

| Field |
|---|
| Client ID |
| Name |
| Company |
| Email |
| Status |

The Clients table is used for managing client information and supporting client onboarding automation.

---

## 2. 📊 Projects

| Field |
|---|
| Project Name |
| Assigned To |
| Deadline |
| Status |
| Client |
| Created time |
| Last Modified |

The Projects table is used to track project progress, deadlines and status changes.

---

## 3. 🎯 Leads

| Field |
|---|
| Lead Name |
| Source |
| Contact Number |
| Interested Service |
| Status |
| Created time |

The Leads table stores incoming prospects and provides the database layer for lead-management automation.

---

## 4. 🤖 AI Agents

| Field |
|---|
| Agent Name |
| Type |
| Deployment Status |
| Last Updated |

This table tracks the organization's AI agents and their deployment status.

---

## 5. 👩‍💻 Interns

| Field |
|---|
| Intern Name |
| Department |
| Task Count |
| Performance Score |
| Last Modified |

The Interns table tracks internship progress and performance.

---

# 🔌 Module 3 — Airtable + n8n Integration

Airtable was successfully connected with n8n using an Airtable Personal Access Token credential.

The integration was tested through Airtable operations including:

- Create Record
- Update Record
- Delete Record
- Search/Read Record

This established Airtable as the centralized data layer for the automation workflows.

---

# ⚙️ Module 4 — Automation Workflows

Five automation workflows were created using Airtable and n8n.

---

## 🔹 Workflow 1 — Lead Management

### Flow

```text
New Lead in Airtable
        ↓
n8n
        ↓
Slack Notification
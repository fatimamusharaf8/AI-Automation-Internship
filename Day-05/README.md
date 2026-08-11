# Day 5 — Slack & Notion

## MATalogics AI Automation Internship

This day focused on learning **Slack and Notion**, understanding their core features, connecting them with **n8n**, and building practical business automations using multiple applications.

The practical work covered:

- Slack workspace and channel management
- Slack Apps and OAuth authentication
- Notion pages and databases
- Notion database properties
- Google Forms and Google Sheets
- n8n triggers and automation workflows
- Dynamic data mapping
- Automated Slack channel creation
- Automated Slack notifications
- End-to-end workflow testing

---

# 📌 Objectives

The main objectives of this task were to:

- Understand Slack as a business communication platform.
- Learn Slack workspaces, channels, threads, DMs, notifications, and integrations.
- Understand Notion pages, blocks, databases, properties, views, and integrations.
- Connect Slack and Notion with n8n.
- Create practical business automation workflows.
- Learn how to map data dynamically between different applications.
- Test and verify complete end-to-end automations.

---

# 🛠️ Tools & Technologies

- **Slack** — Team communication and collaboration
- **Notion** — Workspace, documentation, and database management
- **Google Forms** — Data collection
- **Google Sheets** — Submission data storage
- **n8n** — Workflow automation
- **Git & GitHub** — Version control and documentation

---

# 💬 Slack

## Slack Workspace

A Slack workspace was created for practicing business communication and automation.

The workspace was used to understand:

- Workspaces
- Channels
- Threads
- Direct Messages
- Notifications
- File sharing
- Slack Apps
- Integrations
- Bot users

## Slack Channels

The following channels were created for practice:

- `#n8n-alerts`
- `#client-updates`
- `#internship`
- `#workflow-errors`
- `#project-status`

These channels were used to understand how different conversations can be organized according to projects, alerts, clients, and team activities.

---

# 🔐 Slack + n8n Integration

Slack was connected to n8n using a Slack App and OAuth authentication.

The Slack App was configured with the required permissions for the automation workflows.

Important concepts learned:

- Slack credentials
- OAuth authentication
- Bot users
- OAuth scopes
- Channel permissions
- Sending messages through n8n
- Creating channels through n8n
- Using channel IDs
- Dynamic channel names
- Dynamic message data

Additional OAuth scopes were configured when required for automated channel creation.

---

# 📝 Notion

A Notion workspace was created for practical automation testing.

The following Notion concepts were explored:

- Pages
- Blocks
- Databases
- Database properties
- Views
- Templates
- Filters and sorting
- Relations
- Collaboration
- Integrations
- Notion AI

---

# 📋 Notion Task Database

A task database was created for practicing task management and Slack notifications.

## Database Properties

| Property | Type |
|---|---|
| Task Name | Title |
| Status | Select |
| Priority | Select |
| Due Date | Date |
| Assignee | Person |

Multiple sample tasks were created to test the database and automation.

---

# 👨‍🎓 Student Registration Database

A Student Registration database was also created in Notion.

The database was used to automatically store student information received from a Google Form.

## Properties

| Property | Type |
|---|---|
| Name | Title/Text |
| Email | Email |
| Course | Text |
| Status | Select |

---

# 🏢 Client Database

A separate Clients database was created in Notion for the client onboarding automation.

## Properties

| Property | Type |
|---|---|
| Client Name | Title |
| Email | Email |
| Company | Text |
| Status | Select |

Example client records were created for testing.

---

# 🔄 Automation 1 — Google Form → Google Sheets → Notion

## Use Case

Automatically create a student registration record in Notion whenever a student submits a Google Form.

## Workflow

```text
Google Form
     ↓
Google Sheets
     ↓
n8n Google Sheets Trigger
     ↓
Notion
     ↓
Create Database Page
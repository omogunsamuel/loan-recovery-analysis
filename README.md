# 📘 Operational Loan Recovery & Delinquency Analysis (SQL + Tableau)

## 📝 Project Overview
This project analyzes loan recovery performance and delinquency risk for a consumer loan portfolio. The objective is to monitor operational KPIs that help assess **recovery efficiency, outstanding exposure, and risk concentration** using SQL and Tableau.

Raw loan and payment data were connected directly in Tableau Public, and key metrics were derived using calculated fields. SQL was used separately to **validate data structure and KPI logic**.

## 🧠 Business Context
This analysis represents a credit operations use case where collections and risk teams monitor loan recovery performance, delinquency exposure, and repayment behavior to support **operational decision-making** and prioritization of delinquent accounts.

## ❓ Business Questions Addressed
- How effective is the loan recovery process?  
- What proportion of the portfolio is delinquent?  
- How much outstanding balance remains at risk?  
- How do recovery and payment trends change over time?  
- Which loans and statuses contribute most to risk exposure?

## 📊 Key KPIs & Metrics
- **Total Loans** – Size of the active loan portfolio  
- **Total Loan Value** – Total principal issued  
- **Recovery Rate (%)** – Portion of loan value recovered through payments  
- **Delinquency Rate (%)** – Share of loans with past-due balances  
- **Recovered Amount** – Total payments received  
- **Outstanding Balance** – Remaining exposure  
- **Monthly Recovery Trend** – Payment recovery over time  
- **Outstanding Balance by Loan Status** – Risk concentration by status  

_All KPIs are calculated directly in Tableau using loan and payment data._

## 🛠 Tools & Technologies
- **SQL** – Data validation, schema design, KPI logic verification  
- **Tableau Public** – Dashboard development and calculated fields  
- **CSV Data Sources** – Loan and payment data

## 📈 Tableau Dashboard
View the interactive dashboard here:  
🔗 [Operational Loan Recovery Dashboard](https://public.tableau.com/app/profile/samuel.omogun/viz/operational_loan_recovery_kpi_dashboard1/Executive_Overview)

## 🗂 Repository Structure
**loan-recovery-analysis/
├── data/

│ ├── loans.csv

│ └── payments.csv

├── sql/

│ └── kpi_validation_queries.sql

├── tableau/

│ └── operational_loan_recovery_dashboard.twbx

└── README.md**

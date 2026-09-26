# HR Analytics: Attrition & Salary Insights

## Problem Statement

The HR team requested analysis on two fronts:

- **Attrition Overview** — Department(s) with the highest resignations/terminations (`Termd = 1`) and the underlying trend.
- **Salary Distribution** — Average salary comparison across departments, with notable differences flagged.

*(See [docs/hr_analytics_request.pdf](docs/hr_analytics_request.pdf) and [docs/hr_analytics_report.pdf](docs/hr_analytics_report.pdf) for the full request and final report.)*

---

## Tech Stack

- **SQL** — Data extraction and transformation logic
- **ETL (Advanced Queries)** — Raw HR dataset transformed and reshaped via SQL before loading; data was not imported as-is into the dimension/fact tables — it was derived through advanced/aggregation queries first
- **Data Modeling** — Star schema with dimension and fact tables
- **Power BI** — Data visualization and interactive dashboarding

---

## ETL Process

Source data (`data/hr_dataset.xlsx` / `data/hr_dataset.csv`) was processed through advanced SQL queries to clean, reshape, and derive the fields needed for reporting, rather than being loaded directly into the model tables. The transformed output was then loaded into the dimension and fact tables below.

---

## Data Model (Star Schema)

| Table | Type | Description |
| :--- | :--- | :--- |
| [`sql/fact_table.sql`](sql/fact_table.sql) | Fact | Core transactional records — employee status, termination flag, salary, performance/engagement metrics |
| [`sql/employee_dim_table.sql`](sql/employee_dim_table.sql) | Dimension | Employee attributes — demographics, citizenship, manager, recruitment source |
| [`sql/department_dim_table.sql`](sql/department_dim_table.sql) | Dimension | Department reference data |
| [`sql/position_dim_table.sql`](sql/position_dim_table.sql) | Dimension | Job position/role reference data |
| [`sql/time_dim_table.sql`](sql/time_dim_table.sql) | Dimension | Date/time attributes for trend analysis |

The fact table connects to each dimension table via foreign keys, enabling department-, position-, manager-, and time-level slicing in the Power BI layer.

---

## Power BI Dashboard

[`dashboard/hr_analytics_dashboard.pbix`](dashboard/hr_analytics_dashboard.pbix) — 2-page interactive report built on top of the star schema:

### Page 1 — Attrition Overview
- Department slicer
- Terminations by Department (column chart, split by termination type)
- Headcount by Citizenship status (funnel)
- Terminations by Gender (pie chart)
- Inactive employees by Manager (bar chart)

### Page 2 — Salary Distribution
- Department & Position slicers
- Total salary by Department (clustered bar chart)
- Average salary by Position (bar chart)
- Average salary by Citizenship status (donut chart)
- Average salary by Recruitment Source (pie chart)

---

## Repository Structure

```
├── sql/
│   ├── fact_table.sql
│   ├── employee_dim_table.sql
│   ├── department_dim_table.sql
│   ├── position_dim_table.sql
│   └── time_dim_table.sql
├── data/
│   ├── hr_dataset.csv
│   └── hr_dataset.xlsx
├── dashboard/
│   └── hr_analytics_dashboard.pbix
├── docs/
│   ├── hr_analytics_request.pdf
│   └── hr_analytics_report.pdf
└── README.md
```

---

## Summary

Raw HR data was transformed through advanced SQL queries (ETL), modeled into a star schema (fact + dimension tables), and visualized in Power BI to deliver both requested insights — attrition trends by department and salary distribution across departments — in a single interactive dashboard.

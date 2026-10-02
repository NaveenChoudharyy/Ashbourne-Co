# Ashbourne & Co. — Luxury Fashion Analytics

## Project Overview

**Ashbourne & Co.** is an end-to-end analytics project built around a fictional UK luxury fashion brand. The project demonstrates practical data analytics and business intelligence using **Microsoft Excel, SQL Server, Python, and Tableau**.

The project covers sales performance, profitability, customer behavior, loyalty, acquisition channels, purchasing patterns, and store operations through data preparation, analysis, and interactive dashboards.

## Business Objectives

- Analyze sales and profitability performance
- Track revenue, margin, orders, and returns
- Understand customer value and loyalty
- Measure repeat purchasing behavior
- Analyze customer lifetime spend
- Evaluate acquisition channels
- Identify purchasing patterns
- Analyze store operations
- Build interactive management dashboards

## Tools & Technologies

### Microsoft Excel
- Data cleaning and preprocessing
- Excel formulas
- Pivot Tables
- Pivot-based analysis
- KPI calculations
- Dashboard development

### SQL Server
- Relational database design
- Table creation and data management
- Primary/foreign key relationships
- Joins and aggregations
- Business analysis queries
- KPI calculations

### Python
- Data cleaning and preparation
- Exploratory Data Analysis (EDA)
- Missing-value and consistency analysis
- Feature preparation
- Statistical analysis
- Business insight generation
- Data visualization

Libraries:
- `pandas`
- `numpy`
- `matplotlib`
- `seaborn`

### Tableau
- Interactive dashboards
- Calculated fields
- Parameters
- Filters
- LOD expressions
- Table calculations
- KPI design
- Dashboard navigation

---

## 1. Microsoft Excel Dashboard

An additional **Microsoft Excel dashboard** was created to demonstrate practical spreadsheet analytics skills.

### Excel Work

- Cleaned and prepared raw data
- Applied data cleaning and transformation techniques
- Used Excel formulas for business calculations
- Created Pivot Tables for aggregation and analysis
- Built KPI summaries
- Created charts and dashboard components
- Designed an interactive business reporting dashboard

The Excel dashboard complements the SQL, Python, and Tableau workflow and demonstrates the ability to perform analytics using both spreadsheet-based and BI tools.

---

## 2. SQL Server Analysis

A relational SQL Server database was developed to organize the business data and perform structured analysis.

### SQL Work

- Database and table creation
- Relational data modeling
- Primary and foreign key relationships
- Data loading and validation
- Multi-table joins
- Aggregations and grouping
- Filtering and conditional logic
- Customer, sales, product, and store analysis
- Business KPI calculations

---

## 3. Python Data Analysis

Python was used for data preparation, exploratory analysis, statistical investigation, and visualization.

### Analysis Included

- Data loading
- Data cleaning
- Missing-value analysis
- Duplicate and consistency checks
- Data type correction
- Feature preparation
- Exploratory Data Analysis
- Distribution analysis
- Trend analysis
- Customer analysis
- Sales and profitability analysis
- Statistical analysis and hypothesis testing
- Data visualization

---

### Python EDA

Python was used extensively for exploratory data analysis to understand the structure, quality, distributions, relationships, and patterns in the data.

EDA included:

- Dataset structure and dimensionality analysis
- Data types and schema validation
- Missing-value analysis
- Duplicate-record analysis
- Unique-value and cardinality analysis
- Descriptive statistics
- Distribution analysis
- Outlier analysis
- Univariate analysis
- Bivariate analysis
- Multivariate analysis
- Time-series and monthly trend analysis
- Sales and profitability analysis
- Customer behavior analysis
- Loyalty-tier analysis
- Acquisition-source analysis
- Product/category analysis
- Store analysis
- Return-rate analysis
- Correlation analysis
- Business-focused visualizations using Matplotlib and Seaborn

## 6. Statistical Hypothesis Testing

Statistical hypothesis testing was performed in Python to validate selected business assumptions rather than relying only on descriptive trends.

The analysis included business-focused hypothesis tests such as:

- **Return Rate Crisis Hypothesis** — testing whether return behavior differed significantly between relevant customer/product segments
- Comparison of business metrics across customer groups
- Testing whether observed differences between groups were statistically significant
- Interpreting **null hypotheses (H₀)** and **alternative hypotheses (H₁)**
- Selecting appropriate significance levels
- Calculating test statistics and p-values
- Drawing conclusions based on statistical evidence

The hypothesis-testing stage complemented the descriptive EDA by providing statistical support for selected business questions.

# 4. Tableau Dashboard 1 — Executive Sales & Margin Overview

The first Tableau dashboard provides a management-level overview of business performance.

### KPIs

- Total Net Sales
- YoY Sales Change (%)
- Gross Margin
- YoY Gross Margin Change (%)
- Total Orders
- YoY Total Orders Change (%)
- Average Order Value
- YoY Average Order Value Change (%)
- Return Rate
- YoY Return Rate Change (%)

### Visualizations

- Monthly Revenue & Profit Trends
- Cumulative Monthly Profit
- Sales by Geography
- Seasonal Revenue by Category

### Tableau Techniques

- Parameters
- Calculated fields
- KPI formatting
- Conditional indicators
- Dual-axis charts
- Geographic maps
- Stacked bar charts
- Dashboard navigation

---

# 5. Tableau Dashboard 2 — Customer Analytics

The second dashboard focuses on customer behavior, customer value, loyalty, and purchasing patterns.

### Customer KPIs

- Total Active Customers
- Repeat Purchase Rate
- Average Customer Lifetime Value

### Visualizations

#### Customer Age vs. Lifetime Spend
Scatter plot analyzing the relationship between customer age and lifetime spending, segmented by loyalty tier.

#### Revenue by Acquisition Source
Donut chart showing revenue contribution by customer acquisition channel.

#### Average Customer Lifetime Value by Loyalty Tier
Comparison of average lifetime customer value across Silver, Gold, and Platinum tiers.

#### Purchasing Patterns by Day & Month
Heatmap showing order volume across days of the month and months of the year.

#### Top N Customers by Lifetime Spend
Interactive table containing:

- Customer ID
- Loyalty Tier
- Preferred Store
- Lifetime Spend

The Top-N selector allows users to switch between:

- Top 10
- Top 20
- Top 50 customers

### Customer Analytics Techniques

- Gender parameter
- Income Bracket parameter
- Loyalty Tier parameter
- Dynamic Top-N analysis
- LOD expressions
- Table calculations
- Customer-level aggregation
- Interactive filtering

---

# 6. Dashboard Navigation

Navigation buttons were implemented to move between the Tableau dashboards.

### Dashboard Pages

1. **Executive Sales & Margin Overview**
2. **Customer Analytics**
3. **Product & Operations**

This provides an application-like navigation experience within Tableau.

---

# 7. Data & Analytical Techniques

The project demonstrates:

- Data cleaning
- Data transformation
- Relational data modeling
- Aggregation
- KPI development
- Customer segmentation
- Customer lifetime value analysis
- Repeat-purchase analysis
- Trend analysis
- Geographic analysis
- Parameter-driven analysis
- Dynamic Top-N analysis
- LOD calculations
- Table calculations
- Interactive dashboard design

---

# 8. Dashboard Design

The dashboards use a premium luxury-fashion visual style.

### Core Color Palette

| Color | Hex Code | Usage |
|---|---|---|
| Deep Sage | `#386052` | Primary visual color |
| Champagne Gold | `#C8A96B` | Premium accent |
| Light Sage | `#A7CBB5` | Secondary visual |
| Muted Sage | `#748C82` | Supporting visual |
| Warm Champagne | `#E8DCC3` | Highlight accent |

### Backgrounds

- Dashboard Background: `#0B2E22`
- Chart Background: `#111916`

---

# 9. Skills Demonstrated

**Excel:** Data Cleaning, Excel Formulas, Pivot Tables, Dashboards, Business Reporting

**SQL:** SQL Server, Database Design, Joins, Aggregations, Business Queries, Relational Analysis

**Python:** Pandas, NumPy, Matplotlib, Seaborn, EDA, Statistical Analysis, Data Cleaning

**Tableau:** Calculated Fields, Parameters, Filters, LOD Expressions, Table Calculations, KPI Design, Interactive Dashboards, Navigation, Data Visualization

---

# 10. End-to-End Workflow

```text
Raw Data
   ↓
Data Cleaning & Preparation
   ↓
Microsoft Excel Analysis
   ↓
SQL Server Database & SQL EDA
   ↓
Python EDA & Statistical Hypothesis Testing
   ↓
Tableau Visualization
   ↓
Interactive Business Dashboards
   ↓
Business Insights
```

---

## Project Structure

```text
Ashbourne-Co-Luxury-Fashion-Analytics/
│
├── Excel/
│   └── Ashbourne_Co_Excel_Dashboard.xlsx
│
├── SQL/
│   └── Ashbourne_Co_SQL_Scripts.sql
│
├── Python/
│   └── Ashbourne_Co_EDA.ipynb
│
├── Tableau/
│   └── Ashbourne_Co_Analytics.twbx
│
├── Data/
│   └── README.md
│
└── README.md
```

> Update the file names above to match the actual files in the repository.

---

## Project Outcome

This project demonstrates a complete business analytics workflow combining **Excel, SQL Server, Python, and Tableau**.

It showcases the ability to take raw business data through cleaning and structured analysis and convert it into interactive dashboards and business-oriented insights.

## Author

**Naveen**

**Excel | SQL Server | Python | Tableau | Data Analytics | Business Intelligence | Data Visualization**

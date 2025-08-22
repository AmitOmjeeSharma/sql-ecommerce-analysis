# SQL E-Commerce Analysis (UCI Online Retail Dataset)

## 📌 Project Overview
This project analyzes **1M+ e-commerce transactions (2009–2011)** from a UK-based retailer using the **UCI Online Retail Dataset**.  
The objective is to **clean messy data, write advanced SQL queries, detect anomalies, and generate actionable business insights**.  

---

## 📂 Dataset
Files used:
- `OnlineRetail_2009.csv` → transactions from 2009–2010  
- `OnlineRetail_2010.csv` → transactions from 2010–2011  

Columns:  
`Invoice, StockCode, Description, Quantity, InvoiceDate, Price, CustomerID, Country`

---

## ⚡ Objectives
- 🧹 **Data Cleaning** → Handle nulls, cancellations, duplicates, negatives  
- 💰 **Sales Analysis** → Revenue trends, seasonality, top products, top countries  
- 👥 **Customer Analysis** → CLV, repeat vs. new, AOV (Average Order Value)  
- 🔄 **Returns & Cancellations** → Track cancellations, returns, and their impact  
- 📊 **Comparative Analysis** → Year-to-year revenue growth  
- 📈 **Visualization** → Dashboards built in Power BI / Google Sheets  

---

## 🛠 Tools & Technologies
- **SQL** → MySQL / PostgreSQL / BigQuery  
- **Data Visualization** → Power BI, Google Sheets  
- **Collaboration & Versioning** → GitHub  

---

## 📊 Key Results
- 📈 **Revenue Growth** → +3.5% YoY (2009–2010 → 2010–2011)  
- 🛒 **Top Products** → *Cake Stand*, *T-Light Holder*, *Party Bunting*  
- 👥 **Customer Insights** → Top 10 customers = 15% of revenue; repeat buyers had higher CLV  
- 🌍 **Geographic Insights** → EIRE, Netherlands, Germany among top markets outside UK  
- 🔄 **Cancellations & Returns** → Cancellation rate: ~15%; Returns improved (2.35% → 1.96%)  
- 💡 **Seasonality** → Highest revenue in Nov–Dec (holiday season), lowest in spring  

---

## 📑 Reports
- [📑 Business Report](docs/business_report.md) → Executive summary, recommendations  
- [📊 Analysis Report](docs/analysis_report.md) → Detailed methodology & SQL results  

---

## 📂 Folder Structure
/data → Raw datasets (CSV files)
/sql_scripts → SQL queries used
/outputs → Query results (CSV + Excel)
/visuals → Dashboards & screenshots
/docs → Business & analysis reports
README.md → Project overview


---

## 🚀 Next Steps
- Build **interactive dashboards** in Power BI for stakeholder reporting  

---

## 📌 Insights at a Glance
✔️ Steady revenue growth with seasonal peaks  
✔️ Loyal customers provide significantly higher lifetime value  
✔️ Germany shows high cancellation rates → needs logistics improvements  
✔️ Returns are decreasing → positive sign for product quality  
✔️ Data cleaning was crucial to ensure valid KPIs (removing nulls, cancellations, duplicates, errors)  

---

📊 *This project demonstrates end-to-end SQL data analytics: from raw data → cleaning → query writing → insights → business recommendations.*

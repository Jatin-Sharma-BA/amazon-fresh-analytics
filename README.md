# 🛒 Amazon Fresh Business & Data Analytics

![Domain](https://img.shields.io/badge/Domain-E--commerce%20%26%20Retail%20Analytics-orange)
![Tools](https://img.shields.io/badge/Tools-MySQL%20%7C%20SQL%20%7C%20Database%20Design-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Records](https://img.shields.io/badge/Dataset-50%2C000%2B%20Orders-lightgrey)

---

## 📌 Project Overview

Amazon Fresh is a large-scale e-commerce platform managing groceries and daily essentials. As the platform expands, management needed a structured relational database to optimize operations, improve customer satisfaction, and drive revenue growth.

This project delivers a **complete relational database design and analytical SQL solution** — built from scratch using MySQL — covering data modeling, schema design, normalization, constraint implementation, and 14 business-driven analytical tasks.

---

## 🧩 Business Problem

The platform needed to efficiently manage large volumes of data across:
- Customer profiles and Prime membership
- Product inventories and supplier relationships
- Orders and transactions (50,000+ records)
- Customer reviews and ratings

Key challenges: identifying top-performing products, analyzing customer purchasing patterns, and ensuring inventory management aligns with demand trends.

---

## 🎯 Business Use Cases

| Use Case | Description |
|---|---|
| Customer Insights | Identify top customers and cities for targeted marketing |
| Product Management | Monitor demand, stock levels, and category performance |
| Supplier Analysis | Identify key suppliers and optimize supply chain |
| Revenue Analysis | Generate revenue trends by product, category, and region |
| Customer Satisfaction | Use review data to improve product offerings |

---

## 📂 Repository Structure

```
amazon-fresh-analytics/
│
├── data/
│   ├── Customers.csv
│   ├── Products.csv
│   ├── Suppliers.csv
│   ├── Orders.csv
│   ├── Order_Details.csv
│   └── Reviews.csv
│
├── sql/
│   └── amazon_fresh_queries.sql
│
├── diagrams/
│   ├── ER_Diagram_v1.jpeg
│   └── ER_Diagram_v2_normalized.jpeg
│
├── presentation/
│   └── Amazon_Fresh_Analytics_ppt.pptx
│
└── README.md
```

---

## 🗄️ Database Schema

### Tables Designed (7)

| Table | Description | Key Columns |
|---|---|---|
| Customers | Customer demographics & Prime membership | CustomerID (PK), Age, City, PrimeMember |
| Products | Product catalog with pricing & stock | ProductID (PK), SupplierID (FK), CategoryID (FK) |
| Suppliers | Supplier details & locations | SupplierID (PK), City, State |
| Orders | Order-level transaction data | OrderID (PK), CustomerID (FK), OrderDate |
| Order_Details | Product-level line items per order | OrderID + ProductID (Composite PK) |
| Reviews | Customer ratings & feedback | ReviewID (PK), Rating (1–5 CHECK) |
| Categories | Normalized product categories (3NF) | CategoryID (PK), CategoryName |

### Relationships
- Customers → Orders (1:Many)
- Orders → Order_Details (1:Many)
- Products → Order_Details (1:Many)
- Products → Reviews (1:Many)
- Suppliers → Products (1:Many)
- Categories → Products (1:Many)

---

## 🔧 Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database design, schema creation, all analytical queries |
| **MySQL Workbench** | ER diagram generation, schema visualization |
| **SQL** | DDL, DML, Joins, Subqueries, Window Functions, Normalization |

---

## 🚀 Project Tasks Completed (14)

### Phase 1 — Data Modeling & Basic Queries
- ✅ Task 1: Designed ER diagram showing all table relationships
- ✅ Task 2: Identified all primary keys and foreign keys across 7 tables
- ✅ Task 3: Basic queries — customers by city, products by category

### Phase 2 — DDL & Constraints
- ✅ Task 4: Recreated Customers table with constraints:
  - `Age > 18` CHECK constraint
  - `PrimeMember DEFAULT 'No'`
  - Primary Key on CustomerID
  - Unique constraint on Name

### Phase 3 — Data Manipulation (DML)
- ✅ Task 5: Inserted 3 new products (Organic Mango, Greek Yogurt, Herbal Tea)
- ✅ Task 6: Updated stock quantity for specific ProductID
- ✅ Task 7: Deleted supplier records with FK dependency handling

### Phase 4 — SQL Constraints & Operators
- ✅ Task 8: Added CHECK constraint on Reviews.Rating (1–5), DEFAULT on PrimeMember

### Phase 5 — Clauses & Aggregations
- ✅ Task 9: WHERE, HAVING, GROUP BY, ORDER BY queries for sales ranking

### Phase 6 — High-Value Customer Analysis
- ✅ Task 10: Calculated total spend per customer, ranked by spending, identified customers spending > ₹5,000

### Phase 7 — Complex Joins & Aggregations
- ✅ Task 11: Multi-table JOINs for revenue per order, most active customers, top supplier by stock

### Phase 8 — Normalization (3NF)
- ✅ Task 12: Separated Categories into its own table, created CategoryID FK in Products — eliminated redundancy and update anomalies

### Phase 9 — Subqueries & Nested Queries
- ✅ Task 13: Subqueries for top 3 products by revenue, customers with zero orders

### Phase 10 — Real-World Business Analysis
- ✅ Task 14: Cities with highest Prime membership, top 3 most ordered categories

---

## 💡 Key Business Insights

### 👥 Customer Insights
- Top 20% of customers contribute the majority of platform revenue
- High-value customers identified (total spend > ₹5,000) for targeted loyalty programs
- Prime members concentrated in specific cities — opportunity for geo-targeted marketing

### 📦 Product & Revenue Insights
- Top 3 products by sales revenue identified for inventory prioritization
- Products with average rating > 4 show significantly stronger sales correlation
- Revenue analyzed by product, category, and order — enabling smarter promotions

### 🏭 Supplier & Operations Insights
- Supplier with maximum stock contribution identified for supply chain optimization
- 3NF normalization eliminated category redundancy across 50,000+ product records
- ACID principles applied to ensure full data integrity across all transactions

### 🏆 Strategic Recommendations
- **Marketing:** Target Prime member cities with exclusive grocery bundles
- **Inventory:** Prioritize stock for top-3 revenue-driving products
- **Supplier:** Consolidate orders to highest-stock supplier for cost efficiency
- **Customer Retention:** Implement loyalty rewards for top 20% spenders

---

## 🔑 SQL Concepts Demonstrated

| Concept | Applied In |
|---|---|
| DDL (CREATE, ALTER, DROP) | Schema design, constraint additions |
| DML (INSERT, UPDATE, DELETE) | Product & supplier data management |
| JOINs (INNER, LEFT) | Revenue, customer, and supplier analysis |
| Subqueries & Nested Queries | Top products, inactive customer identification |
| Window Functions | Customer spending ranking |
| GROUP BY + HAVING | Product ratings, sales aggregations |
| 3NF Normalization | Categories table separation |
| ACID Transactions | Data integrity enforcement |
| CHECK / DEFAULT / UNIQUE | Table constraint implementation |

---

## 📊 ER Diagrams

**Version 1** — Initial schema (6 tables)

**Version 2** — Post-normalization schema (7 tables, Categories separated)

Both ER diagrams available in the `/diagrams` folder.

---

## ⚙️ How to Run

1. Install MySQL Workbench
2. Open `sql/amazon_fresh_queries.sql`
3. Run schema creation section first (CREATE DATABASE + tables)
4. Import CSV files from `data/` folder into respective tables
5. Run analytical query sections one by one
6. Each query section is clearly commented with task number and business question

---

## 📁 Evaluation Criteria (GUVI x HCL)

| Criteria | Weight |
|---|---|
| Accuracy & efficiency of SQL queries | 25% |
| Quality of ER diagram & normalization | 25% |
| Completeness of business questions answered | 25% |
| ACID transaction implementation | 15% |
| Code documentation & structure | 10% |

---

## 👤 Author

**Jatin Sharma** — Business Analyst | Operations & Data Analytics

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://www.linkedin.com/in/jatin-sharma-a3b90a3b5)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-brightgreen)](https://jatin-sharma-ba.github.io/portfolio/)

---

*This project was completed as part of the GUVI Geek Network (IITM Incubated) x HCL Business & Marketing Analytics with AI Tools certification program.*

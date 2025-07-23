# HR Attrition & Salary Analysis 📊

**One-liner:**  
Analyze employee attrition trends and salary distributions from an HR dataset using SQL.

---

## 🚀 Overview

This project uses SQL to explore an HR dataset, focusing on:
- Calculating the overall attrition rate.
- Comparing salaries of current vs. former employees.
- Identifying departments and roles with high turnover.
- Crafting recommendations to improve retention and pay fairness.

---

## 📂 Dataset & Schema

The data resides in a MySQL table `employees` within the `hrdata` database. Key fields include:

| Column              | Type     | Description                             |
|---------------------|----------|-----------------------------------------|
| `EmpID`, `Employee_Name` | INT, VARCHAR | Employee identifier & full name |
| `EmpStatusID`       | INT      | 1 = current, 0 = terminated             |
| `DeptID`, `PositionID` | INT  | Department and job role IDs             |
| `salary`           | DECIMAL  | Annual salary                           |
| `PerfScoreID`, `GenderID`, etc. | INT | Performance, demographics, etc. |

---

## ❓ Research Questions

1. What is the **overall attrition rate**?
2. How does **average salary** vary between current and former employees?
3. Which departments or roles have the **highest attrition**?
4. Are there **salary disparities** linked to attrition risk?

---

## 🧩 Analysis Steps

1. **Set up** the `hrdata` database.
2. Run SQL scripts in `/queries`, such as:
   - `01_total_counts.sql`
   - `02_attrition_rate.sql`
   - `03_salary_by_status.sql`
   - `04_attrition_by_dept.sql`
3. View results in your SQL client (e.g., MySQL Workbench).

Example query to calculate attrition rate:

```sql
SELECT
  ROUND(
    CAST(
      COUNT(CASE WHEN EmpStatusID = 0 THEN 1 END) 
      AS FLOAT
    ) / COUNT(*) * 100, 2
  ) AS Attrition_Rate_Percent
FROM employees;
````

---

## 📈 Summary of Findings

* **Average Salary (All Employees):** ₹69,292
* **Attrition Rate:** *X*%
* **Salary (Terminated vs. Current):** Former employees earn \~₹55k, while current \~₹65k
* **High Attrition Areas:** Production roles/departments stand out higher.

*(Replace placeholders with your actual results.)*

---

## 🛠 Setup & Usage

1. Clone the repo:

   ```bash
   git clone https://github.com/yourusername/hr-sql-analysis.git
   cd hr-sql-analysis
   ```
2. Load SQL schema and data:

   ```bash
   mysql -u <user> -p hrdata < schema.sql
   mysql -u <user> -p hrdata < data.sql
   ```
3. Execute queries in `/queries` using your SQL client.

---

## 🗂 Repository Structure

```
.
├── README.md              ← Overview and instructions
├── schema.sql             ← Database table definitions
├── data.sql               ← Data import script
├── queries/
│   ├── 01_total_counts.sql
│   ├── 02_attrition_rate.sql
│   ├── 03_salary_comparison.sql
│   └── 04_attrition_by_dept.sql
└── output/                ← Optionally store exported query results
```

---

## 🎯 Future Work

* Drill into **department / gender / performance** to spot finer attrition drivers.
* Build a **dashboard** in Tableau or Power BI.
* Add **predictive modeling** (e.g., logistic regression for attrition risk).
* Recommend **salary benchmarking** strategies.

---

## 📝 Contributing

Contributions are welcome! Please:

1. Fork the project
2. Create a feature branch
3. Open a pull request

---

## 📄 License

This project is released under the **MIT License**.

---

## 👤 Contact

Nmae:Monika Doble 
Email:[monikadoble7@gmail.com]
Phone:9890884532

Feel free to submit issues, enhancements, or get in touch!

```

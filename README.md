# 🎓 College Fee Payment System

A web-based application developed using **Java (Servlets & JSP)** and **MySQL** to manage student fee payments efficiently.  
This system allows administrators to add, update, delete, and view fee records, along with generating useful reports.

---

## 🚀 Features

### 💰 Fee Management
- ➕ Add new fee payment
- ✏️ Update existing payment details
- ❌ Delete payment records
- 📋 View all fee payment records

### 📊 Reports
- ⚠️ Students with **overdue payments**
- ❗ Students who **haven’t paid**
- 💵 **Total fee collection** within a date range

---

## 🏗️ Tech Stack

- **Frontend:** HTML, CSS, JSP
- **Backend:** Java Servlets
- **Database:** MySQL
- **Server:** Apache Tomcat (v9+)

---

## 🗂️ Project Structure
CollegeFeeWebApp/
│
├── WebContent/
│ ├── index.jsp
│ ├── feepaymentadd.jsp
│ ├── feepaymentupdate.jsp
│ ├── feepaymentdelete.jsp
│ ├── feepaymentdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ ├── report_result.jsp
│
├── src/
│ └── com/
│ ├── dao/
│ │ └── FeePaymentDAO.java
│ │
│ ├── model/
│ │ └── FeePayment.java
│ │
│ └── servlet/
│ ├── AddFeePaymentServlet.java
│ ├── UpdateFeePaymentServlet.java
│ ├── DeleteFeePaymentServlet.java
│ ├── DisplayFeePaymentsServlet.java
│ ├── ReportServlet.java
│ └── ReportCriteriaServlet.java
│
└── WEB-INF/
└── web.xml

---

## 🗄️ Database Setup

Run the following SQL in MySQL:

```sql
CREATE TABLE FeePayments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    StudentName VARCHAR(100),
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(20) -- e.g., Paid, Overdue
);

⚙️ Setup Instructions

Clone the repository

git clone https://github.com/your-username/college-fee-payment-system.git
Import project into Eclipse (Dynamic Web Project)
Add MySQL Connector JAR:

Place mysql-connector-j-9.x.x.jar in:

WEB-INF/lib/

Configure database connection in:

DBConnection.java
Start Apache Tomcat Server

Run project:

http://localhost:8080/CollegeFeeWebApp/


🎯 Learning Outcomes
Understanding of MVC architecture
Working with Servlets & JSP
Database integration using JDBC
Handling CRUD operations
Building dynamic web applications

📸 Screenshots
Add Fee Page
Update Fee Page
Display Records
Reports Page

👨‍💻 Author
Ranjitha



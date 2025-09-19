# Employee Management Portal (JSP + Servlets)

This is a simple Employee Management System built with **Java, JSP, Servlets**, and **MySQL**, deployed on **Apache Tomcat Server**.  
Developed and executed in **Eclipse IDE**.

---

## 🚀 Features

- **Employee Login Verification** – Enter Employee ID & Password.
- **Employee Found:**  
  1️⃣ View employee details  
  2️⃣ Delete employee record  
  3️⃣ Navigate back to home page  
- **Employee Not Found:**  
  ➕ Option to add a new employee  
- Clean navigation between pages using JSP.

---

## 🛠 Tech Stack

- **Backend:** Java Servlets (DAO pattern for DB operations)  
- **Frontend:** JSP, HTML, CSS, JavaScript  
- **Database:** MySQL  
- **Server:** Apache Tomcat  
- **IDE Used:** Eclipse IDE  

---

## 📂 Project Structure

Your project folder structure:

```bash
SOWJANYA/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── db/
│       │       └── EmployeeDAO.java   # Contains database connection & employee CRUD operations
│       │
│       └── webapp/
│           ├── META-INF/
│           ├── WEB-INF/
│           ├── addEmployee.jsp
│           ├── deleteEmployee.jsp
│           ├── getEmployee.jsp
│           ├── updateEmployee.jsp
│           ├── menu.jsp
│           └── index.html
│
└── pom.xml (if using Maven)

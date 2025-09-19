<%@ page import="db.EmployeeDAO" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            color: #333;
        }

        .card {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 480px;
            margin: 50px 20px;
        }

        h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="number"] {
            padding: 8px 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 4px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #3498db;
            color: white;
            padding: 10px;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2c81ba;
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
        }

        .back-link a {
            color: #2980b9;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="card">
<%
    String empId = request.getParameter("employeeId");
    EmployeeDAO dao = new EmployeeDAO();
    Map<String, String> emp = dao.getEmployeeDetails(empId);

    if (emp != null) {
%>
    <h3>Update Employee Details</h3>
    <form action="updateEmployee.jsp" method="post">
        <label>Employee ID (not editable)</label>
        <input type="text" value="<%= empId %>" disabled>
        <input type="hidden" name="employeeId" value="<%= empId %>">

        <label>First Name</label>
        <input type="text" name="firstName" value="<%= emp.get("firstName") %>" required pattern="[A-Za-z]+" title="Only alphabets allowed">

        <label>Last Name</label>
        <input type="text" name="lastName" value="<%= emp.get("lastName") %>" required pattern="[A-Za-z]+" title="Only alphabets allowed">

        <label>DOB</label>
        <input type="date" name="dob" value="<%= emp.get("dob") %>" max="<%= java.time.LocalDate.now() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= emp.get("email") %>" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNumber" value="<%= emp.get("phoneNumber") %>" required pattern="[0-9]{10,15}" title="Enter 10 to 15 digit number">

        <label>Job ID</label>
        <input type="text" name="jobId" value="<%= emp.get("jobId") %>" required>

        <label>Salary</label>
        <input type="number" name="salary" value="<%= emp.get("salary") %>" required min="1000" step="100">

        <label>Commission %</label>
        <input type="number" name="commissionPct" value="<%= emp.get("commissionPct") %>" required min="0" max="100" step="0.01">

        <label>Manager ID</label>
        <input type="text" name="managerId" value="<%= emp.get("managerId") %>" required>

        <label>Department ID</label>
        <input type="number" name="departmentId" value="<%= emp.get("departmentId") %>" required min="1">

        <input type="submit" value="Update">
    </form>
<%
    } else {
%>
    <h3>Employee not found.</h3>
<%
    }
%>
    <div class="back-link">
        <a href="index.html">Back to Home</a>
    </div>
</div>
</body>
</html>

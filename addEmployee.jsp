<%@ page import="db.EmployeeDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Employee</title>
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
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin: 50px 20px;
            width: 100%;
            max-width: 600px;
        }

        h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="number"] {
            padding: 8px 10px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2c81ba;
        }

        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        .back-link {
            margin-top: 25px;
            text-align: center;
        }

        .back-link a {
            color: #2980b9;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
<div class="card">
<%
    String empId = request.getParameter("employeeId");

    if (request.getParameter("firstName") == null) {
%>
    <h3>Add New Employee</h3>
    <form action="addEmployee.jsp" method="post">
        <input type="hidden" name="employeeId" value="<%= empId %>">

        <label>First Name</label>
        <input type="text" name="firstName" required pattern="[A-Za-z]+" title="Only letters allowed">

        <label>Last Name</label>
        <input type="text" name="lastName" required pattern="[A-Za-z]+" title="Only letters allowed">

        <label>DOB</label>
        <input type="date" name="dob" required max="<%= java.time.LocalDate.now() %>">

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Phone Number</label>
        <input type="text" name="phoneNumber" required pattern="[0-9]{10,15}" title="Enter 10–15 digit number">

        <label>Job ID</label>
        <input type="text" name="jobId" required>

        <label>Salary</label>
        <input type="number" name="salary" required min="1000" step="100">

        <label>Commission %</label>
        <input type="number" name="commissionPct" required min="0" max="100" step="0.01">

        <label>Manager ID</label>
        <input type="text" name="managerId" required>

        <label>Department ID</label>
        <input type="number" name="departmentId" required min="1">

        <input type="submit" value="Add Employee">
    </form>
<%
    } else {
        // Get all form values
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String jobId = request.getParameter("jobId");
        String salary = request.getParameter("salary");
        String commissionPct = request.getParameter("commissionPct");
        String managerId = request.getParameter("managerId");
        String departmentId = request.getParameter("departmentId");

        // Default password
        String password = "welcome123";

        // Call DAO
        EmployeeDAO dao = new EmployeeDAO();
        boolean added = dao.addEmployeeFull(empId, firstName, lastName, dob, email, phoneNumber,
                                            jobId, salary, commissionPct, managerId, departmentId, password);

        if (added) {
%>
    <h3 class="success">Employee added successfully!</h3>
    <table>
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>Employee ID</td><td><%= empId %></td></tr>
        <tr><td>First Name</td><td><%= firstName %></td></tr>
        <tr><td>Last Name</td><td><%= lastName %></td></tr>
        <tr><td>DOB</td><td><%= dob %></td></tr>
        <tr><td>Email</td><td><%= email %></td></tr>
        <tr><td>Phone</td><td><%= phoneNumber %></td></tr>
        <tr><td>Job ID</td><td><%= jobId %></td></tr>
        <tr><td>Salary</td><td><%= salary %></td></tr>
        <tr><td>Commission %</td><td><%= commissionPct %></td></tr>
        <tr><td>Manager ID</td><td><%= managerId %></td></tr>
        <tr><td>Department ID</td><td><%= departmentId %></td></tr>
        <tr><td>Password</td><td><%= password %></td></tr>
    </table>
<%
        } else {
%>
    <h3 class="error">Failed to add employee. Please check the data or try again.</h3>
<%
        }
%>
    <div class="back-link">
        <a href="index.html">Back to Home</a>
    </div>
<%
    }
%>
</div>
</body>
</html>

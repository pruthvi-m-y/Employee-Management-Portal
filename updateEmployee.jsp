<%@ page import="db.EmployeeDAO" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee Result</title>
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
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            margin: 50px 20px;
            width: 100%;
            max-width: 700px;
            text-align: center;
        }

        h3 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 14px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .back-link {
            margin-top: 30px;
        }

        .back-link a {
            text-decoration: none;
            color: #2980b9;
            font-size: 14px;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .success {
            color: green;
        }

        .warning {
            color: #d35400;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="card">
<%
    String empId = request.getParameter("employeeId");
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

    EmployeeDAO dao = new EmployeeDAO();
    Map<String, String> current = dao.getEmployeeDetails(empId);

    boolean changed = !firstName.equals(current.get("firstName")) ||
                      !lastName.equals(current.get("lastName")) ||
                      !dob.equals(current.get("dob")) ||
                      !email.equals(current.get("email")) ||
                      !phoneNumber.equals(current.get("phoneNumber")) ||
                      !jobId.equals(current.get("jobId")) ||
                      !salary.equals(current.get("salary")) ||
                      !commissionPct.equals(current.get("commissionPct")) ||
                      !managerId.equals(current.get("managerId")) ||
                      !departmentId.equals(current.get("departmentId"));

    boolean updated = false;
    if (changed) {
        updated = dao.updateEmployeeFull(empId, firstName, lastName, dob, email, phoneNumber,
                                         jobId, salary, commissionPct, managerId, departmentId);
    }

    if (!changed) {
%>
    <h3 class="warning">No changes detected. Nothing updated.</h3>
<%
    } else if (updated) {
        Map<String, String> emp = dao.getEmployeeDetails(empId);
%>
    <h3 class="success">Employee Updated Successfully!</h3>
    <table>
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>Employee ID</td><td><%= empId %></td></tr>
        <tr><td>First Name</td><td><%= emp.get("firstName") %></td></tr>
        <tr><td>Last Name</td><td><%= emp.get("lastName") %></td></tr>
        <tr><td>DOB</td><td><%= emp.get("dob") %></td></tr>
        <tr><td>Email</td><td><%= emp.get("email") %></td></tr>
        <tr><td>Phone Number</td><td><%= emp.get("phoneNumber") %></td></tr>
        <tr><td>Job ID</td><td><%= emp.get("jobId") %></td></tr>
        <tr><td>Salary</td><td><%= emp.get("salary") %></td></tr>
        <tr><td>Commission %</td><td><%= emp.get("commissionPct") %></td></tr>
        <tr><td>Manager ID</td><td><%= emp.get("managerId") %></td></tr>
        <tr><td>Department ID</td><td><%= emp.get("departmentId") %></td></tr>
    </table>
<%
    } else {
%>
    <h3 class="error">Update failed. Please try again.</h3>
<%
    }
%>

    <div class="back-link">
        <a href="index.html">Back to Home</a>
    </div>
</div>
</body>
</html>

<%@ page import="db.EmployeeDAO" %>
<%
    String empId = request.getParameter("employeeId");
    String password = request.getParameter("password");

    if (empId == null || empId.trim().isEmpty() || password == null || password.trim().isEmpty()) {
%>
    <!DOCTYPE html>
    <html>
    <head><title>Login Failed</title></head>
    <body style="text-align:center; padding-top:50px;">
        <h3>⚠️ Employee ID and Password are required.</h3>
        <a href="index.html">Back to Login</a>
    </body>
    </html>
<%
    } else if (!password.equals("welcome123")) {
%>
    <!DOCTYPE html>
    <html>
    <head><title>Access Denied</title></head>
    <body style="text-align:center; padding-top:50px;">
        <h3>❌ Incorrect Password. Access Denied.</h3>
        <a href="index.html">Back to Login</a>
    </body>
    </html>
<%
    } else {
        empId = empId.trim();
        EmployeeDAO dao = new EmployeeDAO();
        boolean exists = dao.employeeExists(empId);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Lookup</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .card {
            background-color: #fff;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        h3 { margin-bottom: 20px; }
        input[type="submit"] {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 25px;
            margin: 5px;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background: #2c81ba;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            color: #2980b9;
            text-decoration: none;
            font-size: 14px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="card">
<%
        if (exists) {
%>
    <h3>Employee ID <%= empId %> found.</h3>
    <form action="getEmployee.jsp" method="get">
        <input type="hidden" name="employeeId" value="<%= empId %>">
        <input type="submit" value="Get Employee Details">
    </form>
    <form action="deleteEmployee.jsp" method="get">
        <input type="hidden" name="employeeId" value="<%= empId %>">
        <input type="submit" value="Delete Employee">
    </form>
<%
        } else {
%>
    <h3>Employee ID <%= empId %> not found.</h3>
    <form action="addEmployee.jsp" method="get">
        <input type="hidden" name="employeeId" value="<%= empId %>">
        <input type="submit" value="Add New Employee">
    </form>
<%
        }
%>
    <a href="index.html">Back to Home</a>
</div>
</body>
</html>
<%
    }
%>

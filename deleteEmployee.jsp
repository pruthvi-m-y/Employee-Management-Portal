<%@ page import="db.EmployeeDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .card {
            background-color: #fff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h3 {
            margin-bottom: 20px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #2980b9;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="card">
<%
    String empId = request.getParameter("employeeId");
    EmployeeDAO dao = new EmployeeDAO();
    boolean deleted = dao.deleteEmployee(empId);

    if (deleted) {
%>
    <h3 class="success">Employee deleted successfully!</h3>
<%
    } else {
%>
    <h3 class="error">Failed to delete employee or employee does not exist.</h3>
<%
    }
%>
    <a href="index.html">Back to Home</a>
</div>
</body>
</html>

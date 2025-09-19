package db;

import java.sql.*;
import java.util.*;

public class EmployeeDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/sowji";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "Panda@2003";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean employeeExists(String employeeId) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT employeeId FROM employees")) {

            ResultSet rs = ps.executeQuery();

            System.out.println("=== START CHECK ===");
            System.out.println("Input employeeId = '" + employeeId + "'");

            while (rs.next()) {
                String dbId = rs.getString("employeeId");
                System.out.println("From DB: '" + dbId + "'");

                if (dbId != null && dbId.trim().equalsIgnoreCase(employeeId.trim())) {
                    System.out.println("✔ MATCH FOUND: " + dbId);
                    return true;
                }
            }

            System.out.println("✘ NO MATCH FOUND");
            System.out.println("=== END CHECK ===");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public Map<String, String> getEmployeeDetails(String employeeId) {
        Map<String, String> data = new HashMap<>();
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM employees WHERE employeeId = ?")) {
            
            ps.setString(1, employeeId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                data.put("firstName", rs.getString("firstName"));
                data.put("lastName", rs.getString("lastName"));
                data.put("dob", rs.getString("dob"));
                data.put("email", rs.getString("email"));
                data.put("phoneNumber", rs.getString("phoneNumber"));
                data.put("jobId", rs.getString("jobId"));
                data.put("salary", rs.getString("salary"));
                data.put("commissionPct", rs.getString("commissionPct"));
                data.put("managerId", rs.getString("managerId"));
                data.put("departmentId", rs.getString("departmentId"));
                data.put("hireDate", rs.getString("hireDate")); // optional
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public boolean updateEmployeeFull(String employeeId, String firstName, String lastName, String dob,
            String email, String phoneNumber, String jobId, String salary,
            String commissionPct, String managerId, String departmentId) {
String sql = "UPDATE employees SET firstName = ?, lastName = ?, dob = ?, email = ?, phoneNumber = ?, " +
"jobId = ?, salary = ?, commissionPct = ?, managerId = ?, departmentId = ? WHERE employeeId = ?";

try (Connection con = getConnection();
PreparedStatement ps = con.prepareStatement(sql)) {

ps.setString(1, firstName);
ps.setString(2, lastName);
ps.setString(3, dob);
ps.setString(4, email);
ps.setString(5, phoneNumber);
ps.setString(6, jobId);
ps.setString(7, salary);
ps.setString(8, commissionPct);
ps.setString(9, managerId);
ps.setString(10, departmentId);
ps.setString(11, employeeId);

return ps.executeUpdate() > 0;

} catch (Exception e) {
e.printStackTrace();
}
return false;
}


    public boolean addEmployeeFull(String employeeId, String firstName, String lastName, String dob,
            String email, String phoneNumber, String jobId, String salary,
            String commissionPct, String managerId, String departmentId, String password) {

        String sql = "INSERT INTO employees (employeeId, firstName, lastName, dob, email, phoneNumber, " +
                     "jobId, salary, commissionPct, managerId, departmentId, hireDate, password) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURDATE(), ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, employeeId);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, dob);
            ps.setString(5, email);
            ps.setString(6, phoneNumber);
            ps.setString(7, jobId);
            ps.setString(8, salary);
            ps.setString(9, commissionPct);
            ps.setString(10, managerId);
            ps.setString(11, departmentId);
            ps.setString(12, password); // Set the password

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    public boolean deleteEmployee(String employeeId) {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM employees WHERE employeeId = ?")) {
            
            ps.setString(1, employeeId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    


    // Add other methods later like getEmployeeDetails, addEmployee, etc.
}

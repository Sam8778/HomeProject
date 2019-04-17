package com.daointerface;

import h2config.H2Config;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.model.Employee;
import com.dao.EmployeeDao;

/**
 * EmployeeService
 */
public class EmployeeService implements EmployeeDao {

	Connection con;

	public EmployeeService() {
		con = H2Config.getConnection();
	}

	@Override
	public List<Employee> findAll() {

		try {

			List<Employee> listEmp = new ArrayList<>();
			con = H2Config.getConnection();
			String sql = "SELECT * FROM EMP";
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				int emp_id = resultSet.getInt("empid");
				String emp_name = resultSet.getString("empname");
				long emp_mobile = resultSet.getLong("empmobile");
				String emp_email = resultSet.getString("empemail");
				String emp_password = resultSet.getString("emppassword");
				String emp_role = resultSet.getString("emprole");
				boolean emp_status = resultSet.getBoolean("empstatus");

				Employee employee = new Employee(emp_id, emp_name, emp_mobile, emp_email, emp_password, emp_role,
						emp_status);

				listEmp.add(employee);
			}

			resultSet.close();
			statement.close();

			return listEmp;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public Employee getEmployee(int emp_id) {
		try {
			Connection con = H2Config.getConnection();
			Employee Emp = null;
			String sql = "SELECT * FROM EMP WHERE empid=?";

			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, emp_id);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				String emp_name = resultSet.getString("empname");
				long emp_mobile = resultSet.getLong("empmobile");
				String emp_email = resultSet.getString("empemail");
				String emp_password = resultSet.getString("emppassword");
				String emp_role = resultSet.getString("emprole");
				boolean emp_status = resultSet.getBoolean("empstatus");
				System.out.println("get" + emp_status);

				Emp = new Employee(emp_id, emp_name, emp_mobile, emp_email, emp_password, emp_role, emp_status);

			}

			resultSet.close();
			statement.close();

			return Emp;

		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	@Override
	public boolean insertEmployee(Employee employee) {

		try {
			Connection con = H2Config.getConnection();

			String sql = "INSERT INTO EMP(empid, empname, empmobile, empemail, emppassword, emprole, empstatus) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, employee.getEmp_id());
			statement.setString(2, employee.getEmp_name());
			statement.setLong(3, employee.getEmp_mobile());
			statement.setString(4, employee.getEmp_email());
			statement.setString(5, employee.getEmp_password());
			statement.setString(6, employee.getEmp_role());
			statement.setBoolean(7, employee.isEmp_status());

			boolean rowInserted = statement.executeUpdate() > 0;
			statement.close();
			return rowInserted;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean updateEmployee(Employee employee) {
		Connection con = H2Config.getConnection();
		try {

			String sql = "UPDATE EMP SET empname= ?, empmobile= ?, empemail= ?, emppassword= ?, emprole= ?, empstatus= ? WHERE empid= ?";

			PreparedStatement statement = con.prepareStatement(sql);

			statement.setString(1, employee.getEmp_name());
			statement.setLong(2, employee.getEmp_mobile());
			statement.setString(3, employee.getEmp_email());
			statement.setString(4, employee.getEmp_password());
			statement.setString(5, employee.getEmp_role());
			statement.setBoolean(6, employee.isEmp_status());
			System.out.println("eMPSTATUS" + employee.isEmp_status());
			statement.setInt(7, employee.getEmp_id());

			boolean rowUpdated = statement.executeUpdate() > 0;
			System.out.println("Rows Updated" + rowUpdated);
			statement.close();
			return rowUpdated;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean deleteEmployee(Employee employee) {
		try {
			Connection con = H2Config.getConnection();
			String sql = "DELETE FROM EMP where empid= ?";

			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, employee.getEmp_id());
			boolean rowDeleted = statement.executeUpdate() > 0;
			statement.close();
			return rowDeleted;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	@Override
	public String userlogin(Employee log) {
		Statement stmt = null;
		ResultSet rs = null;

		String email = log.getEmp_email();
		String password = log.getEmp_password();
		String role = null;

		String emaildb = null;
		String passworddb = null;
		String searchQuery = "select empemail,emppassword,emprole from EMP where empemail='" + email
				+ "' AND emppassword='" + password + "'";
		System.out.println("Your user name is " + email);
		System.out.println("Your password is " + password);
		System.out.println("Query: " + searchQuery);

		try {
			// connect to DB
			Connection con = H2Config.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(searchQuery);
			// boolean more = rs.next();
			while (rs.next()) {
				emaildb = rs.getString("empemail");
				passworddb = rs.getString("emppassword");
				role = rs.getString("emprole");
			}
			// *if user does not exist set the isValid variable to false
			if ((email.equals(emaildb)) && (password.equals(passworddb)) && (role.equals("admin"))) {

				return "admin";
			} else if ((email.equals(emaildb)) && (password.equals(passworddb)) && (role.equals("emp"))) {
				return "emp";
			} else {
				System.out.println("Sorry, you are not a registered user! Please sign up first");

			}
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
				}
				stmt = null;
			}

			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}

				con = null;
			}
		}
		return null;

	}
}
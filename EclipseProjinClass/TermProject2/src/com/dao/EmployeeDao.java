/**
 * 
 */
package com.dao;

import java.util.List;

/**
 * @author SAM
 *
 */
import com.model.Employee;

public interface EmployeeDao {
	public List<Employee> findAll();
	public Employee getEmployee(int emp_id);
	public boolean deleteEmployee(Employee employee);
	public boolean insertEmployee(Employee employee);
	public boolean updateEmployee(Employee employee);
	public  String userlogin(Employee log);
}

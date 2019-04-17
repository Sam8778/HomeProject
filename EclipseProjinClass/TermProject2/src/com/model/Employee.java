package com.model;



/**
 * Employee
 */
public class Employee {

	

	private int emp_id;
	private String emp_name;
	private long emp_mobile;
	private String emp_email;
	private String emp_password;
	private String emp_role;
	private boolean emp_status;

	public Employee() {
		
	}

    public Employee(int emp_id) {
        this.emp_id = emp_id;
    }
	public Employee(int emp_id, String emp_name, long emp_mobile, String emp_email, String emp_password, String emp_role,
			boolean emp_status) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.emp_mobile = emp_mobile;
		this.emp_email = emp_email;
		this.emp_password = emp_password;
		this.emp_role = emp_role;
		this.emp_status = emp_status;
	}

	/**
	 * @return the emp_id
	 */
	public int getEmp_id() {
		return emp_id;
	}

	/**
	 * @param emp_id the emp_id to set
	 */
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	/**
	 * @return the emp_password
	 */
	public String getEmp_password() {
		return emp_password;
	}

	/**
	 * @param emp_password the emp_password to set
	 */
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}

	/**
	 * @return the emp_email
	 */
	public String getEmp_email() {
		return emp_email;
	}

	/**
	 * @param emp_email the emp_email to set
	 */
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	/**
	 * @return the emp_mobile
	 */
	public long getEmp_mobile() {
		return emp_mobile;
	}

	/**
	 * @param emp_mobile the emp_mobile to set
	 */
	public void setEmp_mobile(long emp_mobile) {
		this.emp_mobile = emp_mobile;
	}

	/**
	 * @return the emp_name
	 */
	public String getEmp_name() {
		return emp_name;
	}

	/**
	 * @param emp_name the emp_name to set
	 */
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	/**
	 * @return the emp_role
	 */
	public String getEmp_role() {
		return emp_role;
	}

	/**
	 * @param emp_role the emp_role to set
	 */

	public void setEmp_role(String emp_role) {
		this.emp_role = emp_role;
	}

	/**
	 * @return the emp_status
	 */
	public boolean isEmp_status() {
		return emp_status;
	}

	/**
	 * @param emp_status the emp_status to set
	 */
	public void setEmp_status(boolean emp_status) {
		this.emp_status = emp_status;
	}



	
}
package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.EmployeeDao;
import com.model.Employee;
import com.daointerface.EmployeeService;

@WebServlet(name = "/EmployeeDaoServlet", urlPatterns = { "/" })
public class EmployeeDaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDao empdao = new EmployeeService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// RequestDispatcher dispatcher = request.getRequestDispatcher("abc.jsp");
		// dispatcher.forward(request, response);
		//
		// List<Employee> listEmp = empdao.findAll();
		// request.setAttribute("listEmp", listEmp);
		// RequestDispatcher dispatcher = request.getRequestDispatcher("abc.jsp");
		// dispatcher.forward(request, response);

		String action = request.getServletPath();
		System.out.println(action);
		try {
			switch (action) {

			case "/":
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index.jsp");
				dispatcher.forward(request, response);
				break;
			case "/logout":
				logoutEmp(request, response);
				break;
			case "/insert":
				insertEmp(request, response);
				break;
			case "/new":
				newForm(request, response);
				break;
			case "/delete":
				deleteEmp(request, response);
				break;
			case "/edit":
				showEditEmp(request, response);
				break;
			case "/update":
				updateEmp(request, response);
				break;
			case "/login":
				loginEmp(request, response);

				break;
			case "/list":
				listEmp(request, response);
				break;
			case "/about":
				about(request, response);
//			default:
//				findAll(request, response);
//				break;
			}

		} catch (Exception ex) {
			throw new ServletException(ex);
		}

	}

	private void about(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/About.jsp").include(request, response);

	}

	private void logoutEmp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/index.jsp").include(request, response);
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("You are successfully logged out");
	}

	private void newForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Registration.jsp");
		dispatcher.forward(request, response);

	}

	private void loginEmp(HttpServletRequest request, HttpServletResponse response) {
		try {
			Employee loginEmp = new Employee();
			loginEmp.setEmp_email(request.getParameter("email"));
			loginEmp.setEmp_password(request.getParameter("pwd"));

			String ROLE = empdao.userlogin(loginEmp);
			System.out.println("Employees ROLE" + ROLE);

			if (ROLE.equals("admin")) {

				/*
				 * RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/listEmp.jsp");
				 * dis.forward(request, response);
				 */
				System.out.println("Admin's Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("Admin", loginEmp.getEmp_email()); // setting session attribute
				request.setAttribute("emailid", loginEmp.getEmp_email());
				request.getRequestDispatcher("/WEB-INF/Adminlogin.jsp").forward(request, response);

				// HttpSession session = request.getSession(true);
				// session.setAttribute("currentSessionUser",loginEmp);
				// response.sendRedirect("/WEB-INF/listEmp.jsp"); //logged-in page
			}

			else if (ROLE.equals("emp")) {

				System.out.println("Employees Home");

				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("emp", loginEmp.getEmp_email()); // setting session attribute
				request.setAttribute("emailid", loginEmp.getEmp_email());

				request.getRequestDispatcher("/WEB-INF/Employeelogin.jsp").forward(request, response);
				// response.sendRedirect("invalidLogin.jsp"); //error page
			}
			else {
				response.sendRedirect("Error.jsp");
			}
		} catch (Throwable e) {
			System.out.println(e + "error");
		}

	}

	private void updateEmp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		HttpSession session = request.getSession();
		Employee emp = new Employee();
		emp.setEmp_id(Integer.parseInt(request.getParameter("id")));
		emp.setEmp_name(request.getParameter("name"));
		emp.setEmp_mobile(Long.parseLong(request.getParameter("mobile")));
		emp.setEmp_email(request.getParameter("email"));
		emp.setEmp_password(request.getParameter("password"));
		emp.setEmp_role(request.getParameter("role"));
		emp.setEmp_status(Boolean.parseBoolean(request.getParameter("status")));

		System.out.println("Rows" + (request.getParameter("status")));
		boolean bol = empdao.updateEmployee(emp);
		System.out.println("Update" + bol);
		response.sendRedirect("list");

	}

	private void showEditEmp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println(request.getParameter("id"));
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		Employee emp = empdao.getEmployee(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Edit.jsp");
		request.setAttribute("emp", emp);
		dispatcher.forward(request, response);
	}

	private void deleteEmp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee emp = new Employee(id);
		empdao.deleteEmployee(emp);
		response.sendRedirect("list");

	}

	private void insertEmp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int empid = Integer.parseInt(request.getParameter("id"));
		String empname = request.getParameter("name");
		long empmobile = Long.parseLong(request.getParameter("mobile"));
		String empemail = request.getParameter("email");
		String emppassword = request.getParameter("password");
		String emprole = request.getParameter("role");
		boolean empstatus = Boolean.parseBoolean(request.getParameter("status"));
		Employee emp = new Employee(empid, empname, empmobile, empemail, emppassword, emprole, empstatus);
		empdao.insertEmployee(emp);
		response.sendRedirect("list");

	}

	private void listEmp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Employee> listEmp = empdao.findAll();
		request.setAttribute("listEmp", listEmp);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/listEmp.jsp");
		dispatcher.forward(request, response);
	}
}
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Page Title</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen"
	href="Registration.css">
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script type = "text/javascript"
    src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
$(document).ready(function(){
    $('select').formSelect();
  });
</script>
</head>

<title>Registration Form</title>
<style>
<%@include file="/CSS/Registration.css" %>
</style>
<body>
	<div class="container white z-depth-2">
		<ul class="tabs teal">

			<li class="tab col s3"><a class="white-text">Edit</a></li>
		</ul>
		<div class="col l12 s8">
			<form class="col l12 s8" action="update" method="post">
				<div class="form-container">
					<h3 class="teal-text">Welcome</h3>
					<div class="row">
						<div class="input-field col l12 s8">
							<i class="material-icons prefix">vpn_key</i> <input type="number"
								class="validate" required="required" id="eid" name="id" value="<c:out value='${emp.emp_id}' />" /> <label 
								for="eid">ID</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l12 s8">
							<i class="material-icons prefix">person</i> <input type="text"
								class="validate" required="required" id="ename" name="name" value="<c:out value='${emp.emp_name}' />"/> <label
								for="ename">Username</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l12 s8">
							<i class="material-icons prefix">phone</i> <input type="tel"
								class="validate" required="required" id="emobile" name="mobile" value="<c:out value='${emp.emp_mobile}' />"/> <label
								for="emobile">Mobile</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l12 s8">
							<i class="material-icons prefix">email</i> <input type="email"
								class="validate" required="required" id="eemailid" name="email" value="<c:out value='${emp.emp_email}' />"/> <label
								for="eemailid">Email</label> <span class="helper-text"
								data-error="invalid"></span>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l12 s8">
							<i class="material-icons prefix">lock</i> <input type="password"
								class="validate" required="required" id="epassword" name="password" value="<c:out value='${emp.emp_password}' />"/> <label
								for="epassword">Password</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l3 s4">
							<i class="material-icons prefix">how_to_reg</i>
						</div>
						<div class="input-field col l3 s4">
							<label> <input type="radio" class="with-gap pink" required="required"value="emp" name="role"/>
								<span>EMP</span>
							</label>
						</div>
						<div class="input-field col l3 s4">
							<label> <input type="radio" class="with-gap" required="required" value="admin" name="role" />
								<span>ADMIN</span>
							</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col l12 s4">
							<select name="status">
							<option value="" disabled selected	>Choose your option</option>
							<option value="TRUE">TRUE</option>
							<option value="FALSE">FALSE</option>
							</select>
							<label>Status</label>
						</div>
					</div>
					<center>
						<button class="btn waves-effect waves-light teal" type="submit">
							<span>Submit</span> <i class="material-icons right">send</i>
						</button>
					</center>
				</div>
			</form>
		</div>
	</div>
</body>

</html>
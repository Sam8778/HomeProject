<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Employee</title>
<link rel="stylesheet" type="text/css" href="Edit.css">

<style type="text/css">
<%@include file="/CSS/Registration.css"%>
</style>
<body>
<div id="loginmain">
				<div id="login" class="container">
					<div class="card"></div>
					<div class="card">
						
	<div class="card alt">
		<div class="toggle"></div>
		<h1 class="title">
			Register
		</h1>
		<form action="insert" method="post">
		<div class="input-container">
				<input type="text" id="{label}" required="required" name="id"/> <label
				
					for="{label}">ID</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="text" id="{label}" required="required" name="name"/> <label
					for="{label}">Username</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="text" id="{label}" required="required" name="mobile"/> <label
				
					for="{label}">Mobile</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="email" id="{label}" required="required"  name="email"/> <label
					for="{label}">Email Address</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="password" id="{label}" required="required" name="password"/> <label
				
					for="{label}">Password</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="password" id="{label}" required="required" name="password"/> <label
					for="{label}">Repeat Password</label>
				<div class="bar"></div>
			</div>
			
			<div class="input-container">
				<input type="text" id="{label}" required="required" name="role"/> <label
				
					for="{label}">Role</label>
				<div class="bar"></div>
			</div>
			<div class="input-container">
				<input type="radio" id="{label}" required="required" name="status" value="TRUE"/>TRUE<br>
				<input type="radio" id="{label}" required="required" name="status" value="FALSE"/>FALSE<label
					for="{label}">Role</label>
				<div class="bar"></div>
			</div>
			
			<div class="button-container">
				<input type="submit" value="submit">
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>
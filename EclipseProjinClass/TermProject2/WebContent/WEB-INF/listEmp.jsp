<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--
	Created on: 
	Page Details:Home page 
	Developer Name:Sam George
-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Project Managent Website</title>
<link rel="stylesheet" type="text/css" href="homestyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.transit/0.9.9/jquery.transit.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
	<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
<!-- Function used to shrink nav bar removing paddings and adding black background -->
<script>
	$(document).ready(function() {
		$('html').on('DOMMouseScroll mousewheel', function(e) {
			if (e.originalEvent.detail > 0 || e.originalEvent.wheelDelta < 0) { //alternative options for wheelData: wheelDeltaX & wheelDeltaY
				//scroll down
				console.log('Down');
				$("#header-nav").addClass("hide-nav-bar");
			} else {
				//scroll up
				console.log('Up');
				$("#header-nav").removeClass("hide-nav-bar");
			}
			//prevent page fom scrolling
			//return false;
		});

		// On click show menu on small screen

		$('body').addClass('js');
		var $menu = $('#menu'), $menulink = $('.menu-link');

		$menulink.click(function() {
			$menulink.toggleClass('active');
			$menu.toggleClass('active');
			return false;
		});

		var toggled = 0;

		$('.menu-link').click(function() {
			if (toggled == 0) {
				$('.bar3').stop().transition({
					rotate : "45",
					"margin-top" : "13px"
				});
				$('.bar2').stop().transition({
					opacity : "0"
				}, "fast");
				$('.bar1').stop().transition({
					rotate : "-45",
					"margin-top" : "13px"
				});
				toggled++;
				console.log("toggled down")
			} else {

				$('.bar3').stop().transition({
					rotate : "+=135",
					"margin-top" : "3px"
				});
				$('.bar2').transition({
					opacity : "1"
				}, "fast");
				$('.bar1').stop().transition({
					rotate : "-=135",
					"margin-top" : "23px"
				});
				toggled--;
				console.log("Togged Up")
			}
		});
	});
</script>
<style type="text/css">
<%@include file="/CSS/homestyle.css" %>
<%@include file="/CSS/listEmp.css" %>
</style>
</head>
<body>
 <!-- /Menu-->
	<div id="header-nav">
		<div class="cont">
			<!-- H1 for SEO -->
			<div class="brand">
				<a href="#"> 
					<h1>Niit</h1>
				</a>
			</div>
			<!-- Small screen menu button -->
			<a href="#menu .left" class="menu-link"> <span class="bar1"></span>
				<span class="bar2"></span> <span class="bar3"></span>
			</a>
			<!-- /Small screen menu button -->
			<div class="right loginbtn">
				<a href="logout">
					<h1>Log Out</h1>
				</a>
			</div>
			<!-- Menu Items -->
			<nav id="menu" role="navigation">
				<ul class="left">
					<li><a href="about">About</a></li>
					<li><a href="#">Products</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
		</div>
	</div>
	
<table>
<thead>
<tr>
<th>ID</th>
<th>NAME</th>
<th>MOBILE</th>
<th>EMAIL</th>
<th>PASSWORD</th>
<th>ROLE</th>
<th>STATUS</th>
<th>ACTION</th>
</tr>
</thead>
<c:forEach var="emp" items="${requestScope.listEmp}">
 <tr>
 
  <td><c:out value="${emp.emp_id}"/></td>
  <td><c:out value="${emp.emp_name}"/></td>
  <td><c:out value="${emp.emp_mobile}"/></td>
  <td><c:out value="${emp.emp_email}"/></td>
  <td><c:out value="${emp.emp_password}"/></td>
  <td><c:out value="${emp.emp_role}"/></td>
  <td><c:out value="${emp.emp_status}"/></td>
 <td><a href="edit?id=<c:out value ='${emp.emp_id}'/>"><i class="material-icons">edit</i></a>
 &nbsp; &nbsp; &nbsp; &nbsp;
 <a href="delete?id=<c:out value='${emp.emp_id}'/>"><i class="material-icons">delete</i></a>
 </td>
 
 </tr>
</c:forEach>
</table>
<div class="Addbutton">
	<a href="new">Add New Employee</a>  
</div>
</body>
</html>
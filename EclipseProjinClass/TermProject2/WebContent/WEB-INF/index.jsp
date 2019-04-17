<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!--
	Created on: 
	Page Details:Home page 
	Developer Name:Sam George
-->

<head>
<meta charset="ISO-8859-1">
<title>Project Management Website</title>
<link rel="stylesheet" type="text/css" href="homestyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.transit/0.9.9/jquery.transit.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript">
	
</script>
<link rel="stylesheet" type="text/css" media="screen"
	href="loginstyle.css">

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
		$('.toggle').on('click', function() {
			$('.container').stop().addClass('active');
		});

		$('.close').on('click', function() {
			$('.container').stop().removeClass('active');
		});
		$('.loginbtn').on('click', function() {
			$('.container').addClass('show');
		});
	});
</script>
<style type="text/css">
<%@include file="/CSS/homestyle.css" %>
<%@include file="/CSS/loginstyle.css"%>
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
				<a href="#">
					<h1>Log In</h1>
				</a>
			</div>
			<div id="loginmain">
				<div id="login" class="container">
					<div class="card"></div>
					<div class="card">
						<h1 class="title">Login</h1>
						<form action="login" method="post">
							<div class="input-container">
								<input type="text" id="{label}" required="required" name="email"/> 
								<label for="{label}">EmailId</label>
								<div class="bar"></div>
							</div>
							<div class="input-container">
								<input type="password" id="{label}" required="required" name="pwd"/> <label
									for="{label}">Password</label>
								<div class="bar"></div>
							</div>
							<div class="button-container">
								<button>
									<span>Go</span>
								</button>
							</div>
							<div class="footer">
								<a href="#">Forgot Your Password</a>
							</div>

						</form>
					</div>
				</div>
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
			<!-- /Menu Items -->
			<div class="header-image">
				<div class="header-image-text">
					<h2 class="header-title">Put your trust in Us</h2>
				</div>
			</div>
		</div>
	</div>

</html>
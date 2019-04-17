<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="Adminlogin.css">


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
<%@include file="/CSS/Adminlogin.css" %>
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
					<li><a href="#">Profile</a></li>
					<li><a href="#">News</a></li>
				</ul>
			</nav>
		</div>
	</div>
		<!-- LEFT-SIDEMENU -->
            <div class="left-sideMenu">
	   <div class="menu-box block"> <!-- MENU BOX (LEFT-SIDEMENU) -->
                    <h2 class="menutitle">Dashboard</h2>
                    <ul class="menu-box-menu">
                        <li>
                            <a class="menu-box-tab" href="#"><span class="message"></span>Messages</a>                            
                        </li>
                        
                        <li>
                        <a class="menu-box-tab" href="list"><span class="ViewEmployee"></span>ViewEmployee</a>                     
                        </li>
                    
                        <li>
                            <a class="menu-box-tab" href="#"><span class="Stats"></span>Statistics</a>                            
                        </li>
                        <li>
                            <a class="menu-box-tab" href="#"><span class="accountSett"></span>Settings</a>
                        </li>                 
                    </ul>
                </div>
                </div>
</html>
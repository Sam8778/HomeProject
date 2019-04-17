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
<link rel="stylesheet" type="text/css" href="About.css">


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
		function debounce(func, wait = 10, immediate = true) {
			var timeout;
			return function() {
				var context = this, args = arguments;
				var later = function() {
					timeout = null;
					if (!immediate) func.apply(context, args);
				};
				var callNow = immediate && !timeout;
				clearTimeout(timeout);
				timeout = setTimeout(later, wait);
				if (callNow) func.apply(context, args);
			};
		};

		const header = document.querySelector('.MainImage');
		const headline = document.querySelector('.headline');
		const subheadline = document.querySelector('.subheadline');

		const headlineSlideIn = function() {
		  headline.classList.add('MainImage-slide-in');
		}
		const subheadlineSlideIn = function() {
		  subheadline.classList.add('MainImage-slide-in');
		}

		const headerToggleFade = function() {
		  if (window.scrollY > 100) {
		    header.classList.add('MainImage-fade-out');
		  } else {
		    header.classList.remove('MainImage-fade-out');
		  }
		}

		const panels = document.querySelectorAll('.panel');

		const panelSlideIn = function() {
		  // for each panel, check if window bottom has scrolled past start of panel -> if yes, add .panel-fade-in class
		  panels.forEach(panel => {
		    const slideInAt = (window.scrollY + window.innerHeight) - panel.offsetHeight / 4;
		    const panelMidpoint = panel.offsetTop + panel.offsetHeight / 4;
		    if (slideInAt > panelMidpoint) {
		      panel.classList.add('panel-fade-in');
		    }
		  })
		}

		setTimeout(headlineSlideIn, 1000);
		setTimeout(subheadlineSlideIn, 2000);
		window.addEventListener('scroll', debounce(function() {
		  panelSlideIn();
		  headerToggleFade();
		}));
	});
</script>
<style type="text/css">
<%@include file="/CSS/homestyle.css" %>
<%@include file="/CSS/About.css" %>
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
		<div class="hero">
  <div class="MainImage">
    <h1 class="headline">Make each day your masterpiece.</h1>
    <h2 class="subheadline">ft. Sam George</h2>
  </div>
</div>
<section class="panels">
  <div class="panel">
    <div>
      <img alt="" src="https://images.unsplash.com/photo-1520724495107-cda542a7e329?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=5cb2856f3150b54655d9748327974f21"/>
    </div>
    <div>
      <p>This is a happy place, little squirrels live here and play. Trees grow however makes them happy. Almost everything is going to happen for you automatically - you don't have to spend any time working or worrying. We must be quiet, soft and gentle. Maybe there's a happy little waterfall happening over here.</p>
    </div>
  </div>
  
  <div class="panel">
    <div>
      <p>With practice comes confidence. These things happen automatically. All you have to do is just let them happen. There are no mistakes. You can fix anything that happens. So often we avoid running water, and running water is a lot of fun.</p>
    </div>
    <div>
      <img alt="" src="https://images.unsplash.com/photo-1508721623045-872b68c1cb03?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=42deb20e5ee1ab100328560feeb85fa0"/>
    </div>
  </div>
  
  <div class="panel">
    <div>
      <img alt="" src="https://images.unsplash.com/photo-1516010121015-cd1bf5995e93?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=925b6903115c1d9507dbb33819f64ebc"/>
    </div>
    <div>
      <p>And that's when it becomes fun - you don't have to spend your time thinking about what's happening - you just let it happen. Learn when to stop. You can work and carry-on and put lots of little happy things in here. I spend a lot of time walking around in the woods and talking to trees, and squirrels, and little rabbits and stuff. All you need is a dream in your heart, and an almighty knife. Do an almighty painting with us.</p>
    </div>
  </div>
  
  <div class="panel">
    <div>
      <p>Volunteering your time; it pays you and your whole community fantastic dividends. I started painting as a hobby when I was little. I didn't know I had any talent. I believe talent is just a pursued interest. Anybody can do what I do.</p>
    </div>
    <div>
      <img alt="" src="https://images.unsplash.com/photo-1521624759875-6a7bf5489d9e?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=e45392c1348502b86001603488d19cd0"/>
    </div>
  </div>

</section>

</html>

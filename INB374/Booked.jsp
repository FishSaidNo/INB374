<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Booking Successful - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		
		<script src="scripts/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">		
			$(document).ready(function() { 
				var enable = function() {
					window.open("Garage.jsp");
					document.getElementById("confSub").style.visibility="visible";
				}				
				setTimeout(enable, 5000);
			});
		</script>
    </head>
	
    <body>

	<div id="container">
		
		<div id="header">
			<div id="header-left">
				<p>Servicing Our Autos</p>
			</div>
			<div id="header-right">
				<p>Logged in as: <i>Ben</i> (Sales)</p>
			</div>
			<div id="header-middle">
				<p><a href="index.jsp">Home</a> > ... > Booking Successful</p>
			</div>			
		</div>
	
		<div id="content">	

			<h2>Your Booking was successful!</h2><br>
			<%
				Random rand = new Random();
				Integer mech = rand.nextInt(2);	
				Integer bay = rand.nextInt(2);	
				
				if (mech == 1) {
					out.println("<h3>Mechanic: <strong>Jim Jeffries</strong></h3>");
				}
				else{
					out.println("<h3>Mechanic: <strong>Tony Jones</strong></h3>");
				}
				if (bay == 1) {
					out.println("<h3>Service Bay: <strong>13A</strong></h3>");
				}
				else{
					out.println("<h3>Service Bay: <strong>6C</strong></h3>");
				}
				
			%>
				
			<br>
			<h2>The garage will call to confirm this booking in 5 seconds...</h2>
			<br>
			
			<form action="index.jsp">
				<input id="confSub" type="submit" value="Return Home" class="button-small" style="visibility:hidden;">
			</form>	
			
		</div>	
		
	</div>
    </body>
</html>
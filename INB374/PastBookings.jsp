<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Past Bookings - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		
	
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
				<p><a href="index.jsp">Home</a> > Past Bookings</p>
			</div>			
		</div>
	
		<div id="content">	
				<br>
				<br>
			<table style="width:100%">
			  <tr>
				<th>Job ID</th>
				<th>Customer</th>		
				<th>Vehicle</th>
				<th>Work Order</th>
				<th>Date</th>		
				<th>Total Cost</th>
				<th>Completed</th>					
			  </tr>
			  <tr>
				<td>#0</td>
				<td>Example</td>		
				<td>Toyota Landcruiser</td>
				<td>Major Service</td>
				<td>24-20-1863</td>		
				<td>$1200</td>
				<td>Yes</td>
			  </tr>
			</table>			

			<br>
			<br>
			<form action="index.jsp">
				<input id="confSub" type="submit" value="Return Home" class="button-small">
			</form>	
			
		</div>	
		
	</div>
    </body>
</html>
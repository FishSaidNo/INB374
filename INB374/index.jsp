<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
    </head>
	
    <body>
	<div id="container">
		
		<div id="header">
			<div id="header-left">
				<p>Servicing Our Autos</p>
			</div>
			<div id="header-right">
				<p>Logged in as: <i>Ben</i></p>
			</div>
			<div id="header-middle">
				<p>Home</p>
			</div>			
		</div>
	
		<div id="content">
			<br>
			<h2>Please select an option below</h2>
			
			<div id="content-left">
				<form action="NewCustomer.jsp">
					<input type="submit" value="Create a new customer" class="button-main">
				</form>			
			</div>

			<div id="content-right">
				<form action="NewWorkOrder.jsp">
					<input type="submit" value="New work order" class="button-main">
				</form>				
			</div>			
				
		</div>	
		
	</div>
    </body>
</html>
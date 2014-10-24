<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>New Customer - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<link rel="stylesheet" type="text/css" href="css/message.css">
		<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
    </head>
	
    <body>
	
	<%
		//Has a customer just been successfully added
		//Displays the success banner
		int success = 0;
		try { success = Integer.parseInt(request.getParameter("success")); }
		catch (Exception e) { success = 0; }		
		
		if (success == 1) {
			out.println("<script src='scripts/jquery-2.1.1.min.js'></script>");
			out.println("<script type='text/javascript'>");
				out.println("$(document).ready(function() {");
					out.println("$('#message').fadeIn('slow');");
					out.println("$('#message a.close-notify').click(function() {");
						out.println("$('#message').fadeOut('slow');");
						out.println("return false;");
					out.println("});");
				out.println("});");
			out.println("</script>");
		}
	%>		
	
	<div id="container">
		
		<div id="header">
			<div id="header-left">
				<p>Servicing Our Autos</p>
			</div>
			<div id="header-right">
				<p>Logged in as: <i>Ben</i></p>
			</div>
			<div id="header-middle">
				<p><a href="index.jsp">Home</a> > New Customer</p>
			</div>			
		</div>
	
		<div id="content">
		
			<!-- Success banner. Visibility toggled with jquery-->
			<div id='message' style="display: none;">
				<span>The customer has been successfully created.</span>
				<a href="#" class="close-notify">X</a>
			</div>
			
			<h2>Enter the new customer's details...</h2>
			<br>
			<br>
					
			<form class="pure-form pure-form-aligned" action="processing/ProcessNewCustomer.jsp" method="post">
				<fieldset>
					<div class="pure-control-group">
						<label for="name">Name</label>
						<input name="name" id="name" type="text" maxlength="128" size="30" placeholder="First & Last Names" required>
					</div>

					<div class="pure-control-group">
						<label for="address">Address</label>
						<input name="address" id="address" type="text" maxlength="256" size="30" placeholder="e.g: 48 Adams St, Brisbane 4001" required>
					</div>

					<div class="pure-control-group">
						<label for="email">Email Address</label>
						<input name="email" id="email" type="email" maxlength="128" size="30" placeholder="Email Address" required>
					</div>

					<div class="pure-control-group">
						<label for="tel">Contact Number</label>
						<input name="tel" id="tel" type="number" placeholder="Phone #" min="0" max="9999999999" required>
					</div>
					
					<div class="pure-controls">
						<button type="submit" class="pure-button pure-button-primary">Submit</button>
					</div>
				</fieldset>
			</form>			
				
		</div>	
		
	</div>
    </body>
</html>
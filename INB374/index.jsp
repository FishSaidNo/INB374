<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<link rel="stylesheet" type="text/css" href="css/message.css">
		<script src="scripts/jquery-2.1.1.min.js"></script>
    </head>
	
    <body>
	<%
		//Has quote been declined
		int decline = 0;
		try { decline = Integer.parseInt(request.getParameter("decline")); }
		catch (Exception e) { decline = 0; }		
		
		if (decline == 1) {
			session.removeAttribute("ipercentage");
			session.removeAttribute("parts");
			session.invalidate();
			
			out.println("<script type='text/javascript'>");
				out.println("$(document).ready(function() {");
					out.println("$('#message-red').fadeIn('slow');");
					out.println("$('#message-red a.close-notify').click(function() {");
						out.println("$('#message-red').fadeOut('slow');");
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
				<p>Logged in as: <i>Ben</i> (Sales)</p>
			</div>
			<div id="header-middle">
				<p>Home</p>
			</div>			
		</div>
	
		<div id="content">

			<div id='message-red' style="display: none;">
				<span>Operation cancelled....</span>
				<a href="#" class="close-notify">X</a>
			</div>		
		
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<!--<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">-->
    </head>
	
    <body>
	<div id="container">
		
		<div id="header">
			<div id="header-left">
				<p>test</p>
			</div>
			<div id="header-right">
				<p>test</p>
			</div>
			<div id="header-middle">
				<p>Servicing Our Autos</p>
			</div>			
		</div>
	
		<div id="content">
			<h1>Please Login</h1>
				
			<form class="pure-form pure-form-stacked" action="LoginCheck.jsp" method="post">
				<fieldset>

					<label for="username">User Name</label>
					<center><input name="username" type="text" placeholder="User Name" required></center>

					<label for="password">Password</label>
					<center><input name="password" type="password" placeholder="Password" required></center>

					<button type="submit" class="pure-button pure-button-primary">Sign in</button>
				</fieldset>
			</form>	
			
			<br>
			<h3>Alternatively, <a href="Register.jsp">click here</a> to create an account</h3>
				
		</div>	
		
	</div>
    </body>
</html>
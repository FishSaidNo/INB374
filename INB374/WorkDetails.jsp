<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Work Details - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">	
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
				<p><a href="index.jsp">Home</a> > Customer > Work Details</p>
			</div>			
		</div>
	
		<div id="content">
			
			<h2>Select the customer's vehicle & the type of work to be carried out</h2>
			<br>
			
			<%		
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				java.sql.Connection conn;
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicing_our_autos?user=client001&password=inb374");
				Statement st = conn.createStatement();	
				
				String vId = "";
				String vMake = "";
				String vModel = "";
				String vYear = "";
				String wId = "";
				String wName = "";
			
			%>			
			
			<form class="pure-form pure-form-aligned" action="xxxxxxxxxxxxxxxxxxxxxxxx" method="post">
				<fieldset>
					<div class="pure-control-group">
						<label for="vehicle">Vehicle</label>
						<select id="vehicle" name="vehicle">
							<option></option>
							<%
							ResultSet rs = st.executeQuery("SELECT * FROM vehicles;");
							while(rs.next()) {
								vId = rs.getString(1);
								vMake = rs.getString(2);
								vModel = rs.getString(3);
								vYear = rs.getString(4);					
								out.println("<option value='"+vId+"'>"+vYear+" "+vMake+" "+vModel+"</option>");
							}
							rs.close();
							%>							
						</select>
					</div>
					
					<div class="pure-control-group">
						<label for="workType">Work Type</label>
						<select id="workType" name="workType">
							<option></option>
								<%
								ResultSet rs2 = st.executeQuery("SELECT * FROM worktypes;");
								while(rs2.next()) {
									wId = rs2.getString(1);
									wName = rs2.getString(2);				
									out.println("<option value='"+wId+"'>"+wName+"</option>");
								}
								rs2.close();
								st.close();
								conn.close();
								%>								
						</select>
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
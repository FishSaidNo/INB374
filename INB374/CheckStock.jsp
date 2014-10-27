<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Check Stock - Servicing Our Autos</title>
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
				<p>Logged in as: <i>Ben</i> (Sales)</p>
			</div>
			<div id="header-middle">
				<p><a href="index.jsp">Home</a> > ... > Check Stock</p>
			</div>			
		</div>
	
		<div id="content">	

			<h2>Part Stock</h2>
			
			<%
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				java.sql.Connection conn;
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicing_our_autos?user=client001&password=inb374");
				Statement st = conn.createStatement();					
				
				String partsNeeded = session.getAttribute("parts").toString();
				
				if (partsNeeded != "" || partsNeeded != null) {
				
					ResultSet rs = st.executeQuery("SELECT name, waittime FROM parts WHERE instock = '0' AND partID IN ("+partsNeeded+");");
					if (rs.next()) {
						out.println("<p>The warehouse reports that following part(s) are not in stock, "+
							"and the supplier has provided an estimate for their availability:</p><br>");
						do {
							out.println("<p><b>"+rs.getString(1)+"</b> (Wait time of "+rs.getString(2)+" days)</p>");
						} while (rs.next());
					}
					else {
						out.println("<p>The warehouse reports that all necessary parts are in stock!</p>");
					}
					rs.close();
					
				}
				st.close();
				conn.close();				
			%>
			
			<form action="xxxxxxxxxxxxxxxxxx.jsp">
				<input type="submit" value="Confirm & Finalise Booking" class="button-small">
			</form>			

			<form action="index.jsp?decline=1" method="post">
				<input type="submit" value="Cancel" class="button-small">
			</form>					
				
		</div>	
		
	</div>
    </body>
</html>
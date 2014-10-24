<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Quote - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">

		<script src="scripts/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">		
			$(document).ready(function() { 
				$("#loaded").hide();
				var fade_out = function() {
					$("#loading").fadeOut(1500);
				}
				var fade_in = function() {
					$("#loaded").show();
				}				
				setTimeout(fade_out, 5000);
				setTimeout(fade_in, 6700);
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
				<p>Logged in as: <i>Ben</i></p>
			</div>
			<div id="header-middle">
				<p><a href="index.jsp">Home</a> > ... > Quote</p>
			</div>			
		</div>
	
		<div id="content">
			
			<div id="loading">
				<h2>Please wait while the quote is prepared...</h2>
				<br>
				<img src="images/loading.gif" alt="Loading please wait.....">
			</div>
			
			<div id="loaded">
				<h2>Ta-da!</h2>
				
				<%
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					java.sql.Connection conn;
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicing_our_autos?user=client001&password=inb374");
					Statement st = conn.createStatement();					
					
					String vId = request.getParameter("vehicle");
					String wId = request.getParameter("workType");
					Double laborPrice = 0.00;
					String partsNeeded = "";
					Double partsPrice = 0.00;
					
					ResultSet rs = st.executeQuery("SELECT price, partsNeeded FROM worktypes WHERE workID = '"+wId+"';");
					while(rs.next()) {
						laborPrice = rs.getDouble(1);
						partsNeeded = rs.getString(2);
					}
					rs.close();
					
					if (partsNeeded != "" || partsNeeded != null) {
						ResultSet rs2 = st.executeQuery("SELECT name, price FROM parts WHERE partID IN ("+partsNeeded+");");
						while (rs2.next()) {
							out.println(rs2.getString(1)+"<br>");
							partsPrice += rs2.getDouble(2);
						}
						
					}
				%>
				
			</div>
				
		</div>	
		
	</div>
    </body>
</html>
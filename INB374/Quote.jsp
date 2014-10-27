<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
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
				<p>Logged in as: <i>Ben</i> (Sales)</p>
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
				<h2>Payment breakdown for selected work:</h2>
				
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
						out.println("<p><b>Parts Needed:</b></p>");
						while (rs2.next()) {
							out.println("<p>"+rs2.getString(1)+" ($"+rs2.getString(2)+")</p>");
							partsPrice += rs2.getDouble(2);
						}
						rs2.close();
					}
					out.println("<br><p><b>Parts Total:</b> $"+partsPrice+"</p>");
					out.println("<p><b>Labour / Consumables:</b> $"+laborPrice+"</p><br>");
					
					Double totalPrice = partsPrice+laborPrice;
					out.println("<p><b>Total Cost:</b> $"+totalPrice+"</p>");
					out.println("<h3>After contacting the insurance dept. the total amount payable by the customer is:</h3>");
					
					
					
					String insuraceModifier = session.getAttribute("ipercentage").toString();
					String serviceURL = "http://inb374-001-site1.smarterasp.net/RESTService/Calculator/Insurance?cost="+totalPrice.toString()+"&cover="+insuraceModifier;
					
					String recv = "";
					String recvbuff = "";
					URL ourservice = new URL(serviceURL);
					URLConnection urlcon = ourservice.openConnection();
					BufferedReader buffread = new BufferedReader(new InputStreamReader(urlcon.getInputStream()));

					while ((recv = buffread.readLine()) != null) {
						recvbuff += recv;
					}
					buffread.close();
					
					
					
					String priceToPay = recvbuff;					
					out.println("<h3 style='color:red'>$"+priceToPay+"</h3>");

					st.close();
					conn.close();
					session.setAttribute("parts", partsNeeded);
				%>
				
				<form action="CheckStock.jsp">
					<input type="submit" value="Accept Quote" class="button-small">
				</form>			

				<form action="index.jsp?decline=1" method="post">
					<input type="submit" value="Decline Quote" class="button-small">
				</form>									
				
			</div>		
				
		</div>	
		
	</div>
    </body>
</html>
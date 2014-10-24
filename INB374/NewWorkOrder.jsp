<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>New Work Order - Servicing Our Autos</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
		
		<script type="text/javascript">
			function showBtn()
			{
				var n = document.getElementById("name").value;
				if(n.length > 0) {
					document.getElementById("subBtn").style.visibility="visible";
				}
			}
		</script>		
    </head>
	
    <body onload="showBtn()">
	<div id="container">
		
		<div id="header">
			<div id="header-left">
				<p>Servicing Our Autos</p>
			</div>
			<div id="header-right">
				<p>Logged in as: <i>Ben</i></p>
			</div>
			<div id="header-middle">
				<p><a href="index.jsp">Home</a> > New Work Order</p>
			</div>			
		</div>
	
		<div id="content">
			<h2>Select the customer</h2>
			
			<form class="pure-form pure-form-aligned">
				<fieldset>
					<div class="pure-control-group">
						<label for="selectedCustomer">Customer</label>
						<select id="selectedCustomer" name="selectedCustomer" onchange="this.form.submit()">
							<option></option>
							<%
								String selectedCustomer = "0";
								selectedCustomer = request.getParameter("selectedCustomer");
							
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								java.sql.Connection conn;
								conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicing_our_autos?user=client001&password=inb374");
								Statement st = conn.createStatement();	
								ResultSet rs = st.executeQuery("SELECT * FROM customers;");
								
								String cNum = "";
								String cName = "";
								
								while(rs.next()) {
									cNum = rs.getString(1);
									cName = rs.getString(2);
									out.println("<option value='"+cNum+"'>"+cName+" (Id: "+cNum+")</option>");
								}
								rs.close();
							%>
						</select>
					</div>
				</fieldset>
			</form>	

			<%
			ResultSet rs2 = st.executeQuery("SELECT * FROM customers WHERE customerID = '"+selectedCustomer+"';");
			String cusName = "";
			String cusAddress = "";
			String cusEmail = "";
			String cusTel = "";
			
			if ( rs2.next() ) {
				cusName = rs2.getString(2);
				cusAddress = rs2.getString(3);
				cusEmail = rs2.getString(4);
				cusTel = rs2.getString(5);
			}
			rs2.close();
			st.close();
			conn.close();
			%>
			<form class="pure-form pure-form-aligned" action="WorkDetails.jsp" method="post">
				<fieldset>
					<div class="pure-control-group">
						<label for="name">Name</label>
						<% out.println("<input name='name' id='name' type='text' size='30' value='"+cusName+"' readonly>"); %>
					</div>

					<div class="pure-control-group">
						<label for="address">Address</label>
						<% out.println("<input name='address' id='address' type='text' size='30' value='"+cusAddress+"' readonly>"); %>
					</div>

					<div class="pure-control-group">
						<label for="email">Email Address</label>
						<% out.println("<input name='email' id='email' type='text' size='30' value='"+cusEmail+"' readonly>"); %>
					</div>

					<div class="pure-control-group">
						<label for="tel">Contact Number</label>

						<% out.println("<input name='tel' id='tel' type='text' value='"+cusTel+"' readonly>"); %>
					</div>

					<div class="pure-controls">
						<button id="subBtn" type="submit" class="pure-button pure-button-primary" style="visibility:hidden;">Submit</button>
					</div>
				</fieldset>
			</form>				
				
		</div>	
		
	</div>
    </body>
</html>
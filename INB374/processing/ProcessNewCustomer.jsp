<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>Process New Customer</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
    </head>
	
	<body>
	
	<%
		String cName = request.getParameter("name");
		String cAddress = request.getParameter("address");
		String cEmail = request.getParameter("email");
		String cPhone = (String) (request.getParameter("tel"));	
		Integer insurancePercentage = 0;
		
		Random rand = new Random();
		insurancePercentage = rand.nextInt(100);
	
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		java.sql.Connection conn;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/servicing_our_autos?user=client001&password=inb374");
		Statement st = conn.createStatement();

		st.executeUpdate("INSERT INTO customers VALUES (0, '"+cName+"', '"+cAddress+"', '"+cEmail+"', '"+cPhone+"', '"+insurancePercentage+"');");
		st.close();
		conn.close();
		
		response.sendRedirect("../NewCustomer.jsp?success=1");			
	%>
	
	</body>

</html>
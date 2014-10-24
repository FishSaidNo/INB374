<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<!DOCTYPE html>

<html>
    <head profile="http://www.w3.org/2005/10/profile">
		<title>TESTTTTTTTTTTTTTTTT</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="icon" type="image/jpg" href="images/logo.jpg">
    </head>
	
    <body>
	<div id="container">

		<%
			String recv = "";
			String recvbuff = "";
			URL ourservice = new URL("http://inb374-001-site1.smarterasp.net/RESTService/Calculator/Insurance?cost=700&cover=10");
			URLConnection urlcon = ourservice.openConnection();
			BufferedReader buffread = new BufferedReader(new InputStreamReader(urlcon.getInputStream()));

			while ((recv = buffread.readLine()) != null) {
				recvbuff += recv;
			}
			buffread.close();

			out.println(recvbuff);
		%>		
		
	</div>
	</body>
</html>
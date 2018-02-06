<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document"%>
<%@ page import="cz.vutbr.fit.mongo.MongoDemo" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Hello World</title>
	<style type="text/css">
		td, th {
			border: 1px solid blue;
			padding: 0 1em;
		}
	</style>
</head>
<body>
	<h1>MongoDB - People</h1>
	
	<table>
		<tr><th>Name</th><th>Surname</th><th>Year</th></tr>
	
	<%
		MongoDemo demo = new MongoDemo();
		try {
			for (Document d : demo.getData()) {
				out.print("<tr>");
				out.print("<td>" + d.getString("name") + "</td>");
				out.print("<td>" + d.getString("surname") + "</td>");
				out.print("<td>" + d.getInteger("born", -1) + "</td>");
				out.println("</tr>");
			}
		} catch (Exception e) {
			out.write("<tr><td><strong>Error:</strong> " + e.getMessage() + "</td></tr>");
			e.printStackTrace();
		} finally {
			demo.close();
		}
	
	%>
	</table>
	
	<p><a href="create.jsp">Create testing data</a></p>
	<p><a href="clear.jsp">Clear database</a></p>
	
</body>
</html>

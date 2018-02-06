<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cz.vutbr.fit.mongo.MongoDemo" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Hello World</title>
</head>
<body>
	<h1>MongoDB - People</h1>
	<p>
	<%
		MongoDemo demo = new MongoDemo();
		try {
			demo.createTestingData();
			out.write("Data inserted.");
		} catch (Exception e) {
			out.write("<strong>Error:</strong> " + e.getMessage());
		} finally {
			demo.close();
		}
	%>

	<p><a href="index.jsp">Back</a></p>
	
</body>
</html>

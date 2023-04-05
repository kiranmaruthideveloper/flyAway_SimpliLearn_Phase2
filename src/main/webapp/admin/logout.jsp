<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging Out...</title>
</head>
<body>
<h1>Logging Out...</h1>
<%
session.invalidate();
response.sendRedirect("../");

%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>
<%@ page import = "org.hibernate.query.Query" %>

<jsp:useBean id= "ariLines" class="com.controler.EAirLines"/>
<jsp:useBean id= "sources" class="com.controler.ESources"/>
<jsp:useBean id= "destinations" class="com.controler.EDestinations"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading...</title>
</head>
<body>
<%
String type=request.getParameter("type");
int id=Integer.parseInt(request.getParameter("id"));

SessionFactory factory = HibernateUtil.getSessionFactory();

Session session_db = factory.openSession();

if(type.equals("sources")){
	sources.remove(id);
	response.sendRedirect("./home.jsp?success=deleted");
	
}else if(type.equals("destintion")){
	destinations.remove(id);
	response.sendRedirect("./home.jsp?success=deleted");
}else if(type.equals("airLines")){
	ariLines.remove(id);
	response.sendRedirect("./home.jsp?success=deleted");
}else{
	response.sendRedirect("./home.jsp?success=Failed");
}

%>
</body>
</html>
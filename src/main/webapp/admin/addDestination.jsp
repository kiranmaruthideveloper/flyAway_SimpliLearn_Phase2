<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.EDestinations" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<jsp:useBean id= "destination" class="com.controler.EDestinations"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading...</title>
</head>
<body>
<h1 style="align-text:center;">Loading...</h1>

<%
	String sourceName = request.getParameter("destination");

	SessionFactory factory = HibernateUtil.getSessionFactory();
	
	Session session_db = factory.openSession();
	List<EDestinations> sourcesList = session_db.createQuery("from EDestinations where destinationName='"+sourceName+"'").list();
	
	if(sourcesList.size() == 0 || sourcesList == null){
			
		if(sourceName.length() == 0 || sourceName ==null){
			response.sendRedirect("./home.jsp?error=Field Can't be Empty");
		}else{
			
			if(destination.addData(sourceName)){
				response.sendRedirect("./home.jsp?success=Destination Added");
			}
		}
	}else{
		response.sendRedirect("./home.jsp?error=The Destination Point You are trying to added is already exist.");
	}

%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.ESources" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<jsp:useBean id= "sources" class="com.controler.ESources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading...</title>
</head>
<body>
<h1 style="align-text:center;">Loading...</h1>

<%
	String sourceName = request.getParameter("source");

	SessionFactory factory = HibernateUtil.getSessionFactory();
	
	Session session_db = factory.openSession();
	List<ESources> sourcesList = session_db.createQuery("from ESources where sourceName='"+sourceName+"'").list();
	
	if(sourcesList.size() == 0 || sourcesList == null){
			
		if(sourceName.length() == 0 || sourceName ==null){
			response.sendRedirect("./home.jsp?error=Field Can't be Empty");
		}else{
			
			if(sources.addData(sourceName)){
				response.sendRedirect("./home.jsp?success=Source Added");
			}
		}
	}else{
		response.sendRedirect("./home.jsp?error=The Source Point You are trying to added is already exist.");
	}

%>
</body>
</html>
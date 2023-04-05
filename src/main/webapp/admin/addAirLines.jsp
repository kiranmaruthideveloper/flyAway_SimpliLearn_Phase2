<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.ESources" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<jsp:useBean id= "ariLines" class="com.controler.EAirLines"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loading...</title>
</head>
<body>
<h1 style="align-text:center;">Loading...</h1>
<%
	String airLinesName = request.getParameter("airlinesName");
	String source = request.getParameter("sourcePoint");
	String destination = request.getParameter("destinationPoint");
	String date = request.getParameter("dateOfFlying");
	String time = request.getParameter("timeOfFlying");
	int distance = Integer.parseInt(request.getParameter("distance"));
	int cost = Integer.parseInt(request.getParameter("cost"));

	SessionFactory factory = HibernateUtil.getSessionFactory();
	
	Session session_db = factory.openSession();
	//List<ESources> airLinesList = session_db.createQuery("from ESources where sourceName='"+sourceName+"'").list();
	
			
		if(airLinesName.length() == 0 || airLinesName ==null || 
				source.equals("0") || source ==null ||
				destination.equals("0")|| destination ==null ||
				date.length() == 0 || date ==null ||
				time.length() == 0 || time ==null 
			){
			
			
			response.sendRedirect("./home.jsp?error=Field Can't be Empty");
		}else{
			
			if(ariLines.addData(airLinesName, source, destination, date, time, distance, cost)){
				response.sendRedirect("./home.jsp?success=Source Added");
			}
		}
%>

</body>
</html>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.ELogin" %>

<%@ page import = "java.util.*" %>

<jsp:useBean id= "hibernateUtil" class="com.controler.HibernateUtil"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%
	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session_db = factory.openSession();
	Transaction transaction = session_db.beginTransaction();
	
	String oldPass = request.getParameter("oldPassword");
	String newPass = request.getParameter("newPassword");
	String cnfPass = request.getParameter("cnfPassword");
	
	if(oldPass.length()== 0|| oldPass == null||
			newPass.length()== 0|| newPass == null||
			cnfPass.length()== 0|| cnfPass == null){
		response.sendRedirect("./home.jsp?error=Fields Can't be empty");
	}else{
		List<ELogin> admin = session_db.createQuery("from ELogin where username='"+session.getAttribute("uname")+"' and password='"+oldPass+"'").list();
		if(admin != null){
			
			if(!newPass.equals(cnfPass)){
				response.sendRedirect("./home.jsp?error=Password and Conform Password sholud be same");
			}else{
				Query updatePassword = session_db.createQuery("update ELogin set password='"+cnfPass+"' where username='"+session.getAttribute("uname")+"'");
				int updateStatus = updatePassword.executeUpdate();
				transaction.commit();
				
				if(updateStatus>0){				
					response.sendRedirect("./home.jsp?success=Password updated successfully&&updateStatus="+updateStatus);
				}else{
					response.sendRedirect("./home.jsp?error=Password update failed&&updateStatus="+updateStatus);
				}
			}
		}else{
			response.sendRedirect("./home.jsp?error=Invalid Password");
		}
	}
%>
</body>
</html>
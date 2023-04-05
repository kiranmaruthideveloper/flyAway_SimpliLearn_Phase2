<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id= "adminLogin" class="com.controler.ValidateLogin"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging in...</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body>
<h1 class="text-center">Logging in...</h1>

<%
String uname = request.getParameter("uname");
String password = request.getParameter("password");

String loginResp = adminLogin.validateUser(uname, password);
if( loginResp == "1"){
	session.setAttribute("uname", uname);
	if(adminLogin.getLoginList()!=null)
	session.setAttribute("name", adminLogin.getLoginList().get(0).getName());
	response.sendRedirect("./home.jsp");
}else if(loginResp == "0"){
	response.sendRedirect("./?error=invalid Login");
}else {
	response.sendRedirect("./?error="+loginResp);
}



%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.ESources" %>
<%@ page import = "com.controler.EDestinations" %>
<%@ page import = "com.controler.EAirLines" %>
<%@ page import = "java.util.*" %>

<jsp:useBean id= "hibernateUtil" class="com.controler.HibernateUtil"/>

<%
session.invalidate();

//hibernate inti
SessionFactory factory = HibernateUtil.getSessionFactory();
Session session_db = factory.openSession();

List<ESources> sourcesList = session_db.createQuery("from ESources").list();
List<EDestinations> desitnationList = session_db.createQuery("from EDestinations").list();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fly Away Airlines</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body class="container bg-dark">
	<div class="text-center text-white">
		<h1>Fly Away Airlines Ticket Booking</h1>
	</div>
	<div class="text-white">
		<form action="ticketBooking/" method="post">
			<div class="form-group">
				<h3>Book Your Tickets</h3>
			</div>
			<div class="text-center">
				<% if(request.getParameter("error")!=null){ %>
					<h4 class="bg-danger text-center d-inline p-2 rounded"><%= request.getParameter("error") %></h4>
				<%} %>	
			</div>
			
			<div class="form-group">
				<label>Boarding Point: </label>
				<select name="source" class="form-control">
					<option >Select Source</option>
					<% for(ESources x:sourcesList){%>
	       						<option class="text-dark" value="<%= x.getSource()%>"><%= x.getSource()%></option>
	       				<%}%>
				</select>
			</div>
			<div class="form-group">
				<label>Destination Point: </label>
				<select name="destination" class="form-control">
					<option >Select Source</option>
					<% for(EDestinations x:desitnationList){%>
	       						<option class="text-dark" value="<%= x.getDestination()%>"><%= x.getDestination()%></option>
	       			<%}%>
				</select>
			</div>
			<div class="form-group">
				<label>Date of Travel: </label><input type="date" name="dateOfTravel" class="form-control">
			</div>
			<div class="form-group">
				<label>Number of Passengers: </label><input type="number" name="num_passengers" class="form-control">
			</div>
			
			<div class="form-group">
				<input type="submit" name="submit" class="form-control btn btn-outline-primary" value="Search Flight">
			</div>
		</form>
	</div>
	<hr class="border border-white">
	<div class="text-center">
		<a href="admin/" class="btn btn-warning">Admin Console</a>
	</div>
</body>
</html>
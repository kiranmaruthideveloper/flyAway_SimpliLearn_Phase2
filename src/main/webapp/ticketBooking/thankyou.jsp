<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.EAirLines" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<%
SessionFactory factory = HibernateUtil.getSessionFactory();
Session session_db = factory.openSession();


int numPassengers = Integer.parseInt((String)session.getAttribute("numPassengers"));
int flightId = Integer.parseInt(request.getParameter("flightId"));

List<EAirLines> airLinesList = session_db.createQuery("from EAirLines where id="+flightId).list();
EAirLines airLinesInfo = airLinesList.get(0);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complete Booking</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
  #tabDiv {
    width:100%;
    height:100%;
  }
  table {
    margin: 0 auto; /* or margin: 0 auto 0 auto */
  }
</style>

</head>
<body class="container bg-dark">

	<div class="text-white text-center">
		<h1>Fly Away Air Lines</h1>
		<h3>Ticket Summary</h3>
	</div>
	<div class="bg-white rounded " id="tabDiv">
		<h3 class="text-center">Booking Details</h3>
		<table>
			<tr>
				<th><p>Booking ID:</p></th>
				<td><p><%=session.getAttribute("bookingID") %></p></td>
			</tr>
			<tr>
				<th><p>Passenger Details: </p></th>
				<td style="overflow-x:auto ">
					<table border="1.0">
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Gender</th>
							<th>phone</th>
							<th>email</th>
						</tr>
						
						<% for(int i=1;i<=numPassengers;i++){%>
							<tr>
								<td><%= session.getAttribute("passengerName_"+i) %></td>
								<td><%= session.getAttribute("passengerAge_"+i) %></td>
								<td><%= session.getAttribute("passengerGender_"+i) %></td>
								<td><%= session.getAttribute("passengerPhone_"+i) %></td>
								<td><%= session.getAttribute("passengerEmail_"+i) %></td>
							</tr>
						<%} %>
					</table>
				
				</td>
				
			</tr>
			<tr>
				<th><p>Flight Name:</p></th>
				<td><p><%=airLinesInfo.getAirLinesName() %></p></td>
			</tr>
			<tr>
				<th><p>Flight Date:</p></th>
				<td><p><%=airLinesInfo.getDateOfFlying() %></p></td>
			</tr>
			<tr>
				<th><p>Flight Time:</p></th>
				<td><p><%=airLinesInfo.getTimeOfFlying() %></p></td>
			</tr>
			<tr>
				<th><p>Travel:</p></th>
				<td><p><%=airLinesInfo.getSource() %> to <%=airLinesInfo.getDestination() %></p></td>
			</tr>
			<tr>
				<th><p>Distance:</p></th>
				<td><p><%=airLinesInfo.getDistance() %></p></td>
			</tr>
			<tr>
				<th><p>Fair: </p></th>
				<td><p><%= airLinesInfo.getCostPerKm()*airLinesInfo.getDistance() %>/-</p></td>
			</tr>
			<tr>
				<th><p>Number of Passengers:</p></th>
				<td><p><%= numPassengers %></p></td>
			</tr>
			<tr>
				<th><p>Total Bill Amount:</p></th>
				<td><p class="fw-bold text-danger"><b><%= airLinesInfo.getCostPerKm()*airLinesInfo.getDistance()*numPassengers %>/-</b></p></td>
			</tr>
			<tr>
				<th><p>Payment Status: </p></th>
				<td><p class="fw-bold text-success"><b>SUCCESS</b></p></td>
			</tr>
		</table>
		<div class="p-2 text-center">
			<a class="btn btn-primary" href="../">Back to Home</a>
		</div>
		
	</div>



	
</body>
</html>
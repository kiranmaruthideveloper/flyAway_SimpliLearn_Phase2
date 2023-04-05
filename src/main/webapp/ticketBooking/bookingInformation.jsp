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


String date = request.getParameter("dateOfTravel");
int numPassengers = Integer.parseInt((String)session.getAttribute("numPassengers"));
int flightId = Integer.parseInt(request.getParameter("flightId"));

List<EAirLines> airLinesList = session_db.createQuery("from EAirLines where id="+flightId).list();
EAirLines airLinesInfo = airLinesList.get(0);


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Information</title>
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
		<h3>Booking Information</h3>
	</div>
	<div class="bg-white rounded text-center" id="tabDiv">
		<h3 class="text-center">Flight Details</h3>
		<table>
			<tr>
				<th><p>Booking ID:</p></th>
				<td><p><%=session.getAttribute("bookingID") %></p></td>
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
		</table>
		
	</div>
	
	<div class="bg-white shadow rounded mt-5 p-2">
		<form method="POST" action="./completeBooking.jsp?flightId=<%=flightId %>">
			<div class="text-center">
				<h3>Passenger details</h3>
			</div>
			<table class="">
				<tr>
					<th class="m-1">Sno.</th>
					<th class="m-1">Passenger Name:</th>
					<th class="m-1">Age:</th>
					<th class="m-1">Gender:</th>
					<th class="m-1">Phone Number:</th>
					<th class="m-1">Email:</th>
				</tr>
				<%for(int i=1;i<=numPassengers;i++){%>
					<tr>
						<th class="m-1"><%=i %></th>
						<td class="m-1"><input name="passengerName_<%=i %>" type="text" required></td>
						<td class="m-1"><input name="passengerAge_<%=i %>" type="number" required></td>
						<td class="m-1">
							<select name="passengerGender_<%=i %>" required>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</td>
						<td class="m-1"><input name="passengerPhone_<%=i %>" type="text" required></td>
						<td class="m-1"><input name="passengerEmail_<%=i %>" type="text" required></td>
					</tr>
				<%}%>
				<tr><td colspan="6"></td></tr>
				<tr><td colspan="6"></td></tr>
				<tr><td colspan="6"></td></tr>
				<tr><td colspan="6"></td></tr>
				<tr><td colspan="6"></td></tr>
				<tr></tr>
				<tr class="text-center mt-5">
					<td colspan="6"><input type="submit" value="Save and Next"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
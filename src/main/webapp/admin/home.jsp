<%@page import="org.hibernate.query.Query"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.ESources" %>
<%@ page import = "com.controler.EDestinations" %>
<%@ page import = "com.controler.EAirLines" %>
<%@ page import = "com.controler.EPassenger" %>
<%@ page import = "com.controler.BookingInformation" %>
<%@ page import = "java.util.*" %>

<jsp:useBean id= "hibernateUtil" class="com.controler.HibernateUtil"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body class="bg-dark container text-white">
<%
String unmae = (String)session.getAttribute("uname");
String name = (String)session.getAttribute("name");

//hibernate inti
SessionFactory factory = HibernateUtil.getSessionFactory();
Session session_db = factory.openSession();

List<ESources> sourcesList = session_db.createQuery("from ESources").list();
List<EDestinations> desitnationList = session_db.createQuery("from EDestinations").list();
List<EAirLines> airLinesList = session_db.createQuery("from EAirLines").list();
List<Integer> bookingInformation = session_db.createQuery("select DISTINCT flightID from BookingInformation").list();
List<EPassenger> passenger = session_db.createQuery("from EPassenger").list();
	


%>
<div class="text-center">
<%
		String error = request.getParameter("error");
		String success = request.getParameter("success");
		if(error!=null){
			out.println("<h3 class='text-center d-inline bg-danger rounded text-white p-3 mb-5'>"+error+"</h3>");
		}
		if(success!=null){
			out.println("<h3 class='text-center d-inline bg-success rounded text-white p-3 mb-5'>"+success+"</h3>");
		}
	%>
</div>
<div class="text-center">
	
	<h1 class="">FlyAway Airlines Admin Console</h1>
	<h1>Hello, <%= name %></h1>
	<a class="btn btn-danger d-inline" href="./logout.jsp">Logout</a>
	<button type="button" class="btn btn-info " data-toggle="modal" data-target="#changePassword">
		  Change Password
		</button>
</div>
<div class="mt-3">
	<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-dark">Source Points</h5>
        <p class="card-text text-dark">Please add the Source points for Airlines</p>
        <!-- Button trigger modal source -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSource">
		  Edit Source Points
		</button>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-dark">Destination Points</h5>
        <p class="card-text text-dark">Please add the Destination points for Airlines</p>
        <!-- Button trigger modal source -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addDestination">
		  Edit Destination Points
		</button>
      </div>
    </div>
  </div>
</div>
<br>
<br>
<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-dark">Air Lines</h5>
        <p class="card-text text-dark">Check Your Air Lines</p>
        <!-- Button trigger modal source -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAirLines">
		  Edit AirLines
		</button>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title text-dark">Booking Summary</h5>
        <p class="card-text text-dark">Find the booking information here</p>
        <!-- Button trigger modal source -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bookingSummary">
		  Booking Summary
		</button>
      </div>
    </div>
  </div>
</div>

<!-- Add Source Start -->

<!-- Modal -->
<div class="modal fade" id="addSource" tabindex="-1" aria-labelledby="addSourceLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-dark" id="addSourceLabel">Source Points</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="addSource.jsp">
	      <div class="modal-body">
	       		<div class="form-group">
	       			<label class="text-dark">Enter Source: </label><input type="text" name="source" class="form-control">
	       		</div>
	       		<!-- Existing Sources -->
	       		<div>
	       			<h5 class="text-center text-danger">Existing Sources</h5>
	       				<ul>
	       				<% for(ESources source:sourcesList){%>
	       						<li class="text-dark"><%= source.getSource()%> - <a class="text-danger" href='remove.jsp?id=<%= source.getId()%>&type=sources'>Remove</a></li>
	       				<%}%>
	       					</ul>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<!-- Add Source End -->

<!-- Add Destination Start -->
<!-- Modal -->
<div class="modal fade" id="addDestination" tabindex="-1" aria-labelledby="addDestinationLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-dark" id="addDestinationLabel">Destination Points</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="./addDestination.jsp">
	      <div class="modal-body">
	       		<div class="form-group">
	       			<label class="text-dark">Enter Destination: </label><input type="text" name="destination" class="form-control">
	       		</div>
	       		
	       		<!-- Existing Destinations -->
	       		<div>
	       			<h5 class="text-center text-danger">Existing Destinations</h5>
	       				
	       				<ul>
	       				<% for(EDestinations x:desitnationList){%>
	       						<li class="text-dark"><%= x.getDestination()%> - <a class="text-danger" href='remove.jsp?id=<%= x.getId()%>&type=destintion'>Remove</a></li>
	       				<%}%>
	       					</ul>
	       		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
      </form>
    </div>
  </div>
</div>


<!-- Add Destination End -->


<!-- Add AirLines Start -->
<!-- Modal -->
<div class="modal fade text-dark" id="addAirLines" tabindex="-1" aria-labelledby="addAirLinesLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-dark" id="addAirLinesLabel">Destination Points</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="./addAirLines.jsp">
	      <div class="modal-body">
	       		<div class="form-group">
	       			<label class="text-dark">Enter AirLines Name: </label><input type="text" name="airlinesName" class="form-control">
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Select Source Point: </label>
	       			<select class="form-control" name="sourcePoint">
	       				<option value="0">Select Source Point</option>
	       				<% for(ESources x:sourcesList){%>
	       						<option class="text-dark" value="<%= x.getSource()%>"><%= x.getSource()%></option>
	       				<%}%>
	       			</select>
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Select Destination Point: </label>
	       			<select class="form-control" name="destinationPoint">
	       				<option value="0">Select Destination Point</option>
	       				<% for(EDestinations x:desitnationList){%>
	       						<option class="text-dark" value="<%= x.getDestination()%>"><%= x.getDestination()%></option>
	       				<%}%>
	       			</select>
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Date of Flying: </label>
	       			<input type="date" name="dateOfFlying" class="form-control">
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Time of Flying: </label>
	       			<input type="time" name="timeOfFlying" class="form-control">
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Distance(KM): </label>
	       			<input type="text" name="distance" class="form-control">
	       		</div>
	       		<div class="form-group">
	       			<label class="text-dark">Cost per KM: </label>
	       			<input type="text" name="cost" class="form-control">
	       		</div>
	       		
	       		<!-- Existing Airlines -->
	       		<div>
	       			<h5 class="text-center text-danger">Existing AirLines</h5>
	       				<div style="overflow-x:auto;">
		       				<table border="1.0">
		       					<tr>
		       						<th class="text-center">Air Lines Name</th>
		       						<th class="text-center">Source</th>
		       						<th class="text-center">Destination</th>
		       						<th class="text-center">Date Of FLying</th>
		       						<th class="text-center">Time Of FLying</th>
		       						<th class="text-center">Distance (KM)</th>
		       						<th class="text-center">Cost (KM)</th>
		       						<th></th>
		       					</tr>
		       				
		       				
		       				<% for(EAirLines x:airLinesList){%>
		       						<tr>
		       							<td><%=x.getAirLinesName() %></td>
		       							<td><%=x.getSource() %></td>
		       							<td><%=x.getDestination() %></td>
		       							<td><%=x.getDateOfFlying() %></td>
		       							<td><%=x.getTimeOfFlying() %></td>
		       							<td><%=x.getDistance() %></td>
		       							<td><%=x.getCostPerKm() %></td>
		       							<td><a href="remove.jsp?id=<%=x.getId() %>&type=airLines">Remove</a></td>
		       						</tr>
		       				<%}%>
		       				
		       				</table>
	       				</div>
	       					
	       		</div>
	       		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
      </form>
    </div>
  </div>
</div>


<!-- Add AirLines End -->
<!-- Bookings Summary Start -->

<!-- Modal -->
<div class="modal fade text-dark" id="bookingSummary" tabindex="-1" aria-labelledby="bookingSummaryLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-dark" id="bookingSummaryLabel">Bookings Summary</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x:auto; ">
      		<table border="1.0">
      			<tr>
      				<th>Airlines ID</th>
      				<th>Airlines Name</th>
      				<th>Date of Flight</th>
      				<th>Time of Flight</th>
      				<th>Total Passengers</th>
      				<th>Total Cost</th>
      			</tr>
      			<%
      					for(Integer x: bookingInformation){
	      						
    	  					System.out.println(x);
      				
	      					String sumHQL_numPassengers = "SELECT SUM(numPassengers) FROM BookingInformation where flightID="+x;
	      					Long sumQuery_numPassengers = (Long)session_db.createQuery(sumHQL_numPassengers).getSingleResult();
	      					String sumHQL_amount = "SELECT SUM(totalAmount) FROM BookingInformation where flightID="+x;
	      					Long sumQuery_amount = (Long)session_db.createQuery(sumHQL_amount).getSingleResult();
	      					
	      					List<EAirLines> airLinesList_summery = session_db.createQuery("from EAirLines where id="+x).list();
	      					%>
	      					<tr>
	      						<td><%=airLinesList_summery.get(0).getId() %></td>
	      						<td><%=airLinesList_summery.get(0).getAirLinesName() %></td>
	      						<td><%=airLinesList_summery.get(0).getDateOfFlying() %></td>
	      						<td><%=airLinesList_summery.get(0).getTimeOfFlying() %></td>
	      						<td><%=sumQuery_numPassengers %></td>
	      						<td><%=sumQuery_amount %></td>
	      					</tr>
      					<% }%>
      			<tr>
      				<td></td>
      			</tr>
      		</table>
      </div>
    </div>
  </div>
</div>
<!-- Bookings Summary End -->
<!-- Change Password Start -->

<div class="modal fade text-dark" id="changePassword" tabindex="-1" aria-labelledby="bookingSummaryLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-dark" id="bookingSummaryLabel">Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow-x:auto; ">
      		<form action="changePassword.jsp" method="POST">
      			<div class="form-group">
      				<label>Old Password</label><input type="text" name="oldPassword" class="form-control">
      			</div>
      			<div class="form-group">
      				<label>New Password</label><input type="text" name="newPassword" class="form-control">
      			</div>
      			<div class="form-group">
      				<label>Confiram New Password</label><input type="text" name="cnfPassword" class="form-control">
      			</div>
      			<div class="form-group">
      				<input type="submit" name="submit" class="form-control btn btn-outline-info" value="Reset Password">
      			</div>
      		</form>
      </div>
    </div>
  </div>
</div>
<!-- Change Password End -->


</div>
</body>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</html>
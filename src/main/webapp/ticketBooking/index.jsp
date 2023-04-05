<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.EAirLines" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<jsp:useBean id= "ariLines" class="com.controler.EAirLines"/>


<%

//hibernate inti
SessionFactory factory = HibernateUtil.getSessionFactory();
Session session_db = factory.openSession();

String sourcePoint = request.getParameter("source");
String destinationPoint = request.getParameter("destination");
String date = request.getParameter("dateOfTravel");
String numPassengers = request.getParameter("num_passengers");

int max = 9999;
int min = 1000;
int bookingID = (int)(Math.random()*(max-min+1)+min); 
session.setAttribute("numPassengers", numPassengers);
session.setAttribute("bookingID", bookingID);



if(sourcePoint.equals("0") || destinationPoint.equals("0")
	||date.length() == 0 || date == null||
	numPassengers.length() ==0 || numPassengers == null || numPassengers.equals("0")
	
	){
	response.sendRedirect("../?error=Fields Empty or Invalid entry!");
}
List<EAirLines> airLinesList = session_db.createQuery("from EAirLines where source='"+sourcePoint+"' and destination='"+destinationPoint+"' and date = '"+date+"'").list();



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Air Lines Details</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="./css/index.css">
</head>
<body class="bg-dark container">
	<div class="text-white text-center">
		<h1>Fly Away Air Lines</h1>
		<h3>Air Lines Details</h3>
	</div>
	<div class="text-center">
		<div class="bg-white rounded shadow">
			<h4>Search Details</h4>
			<p>Source: <%= sourcePoint %></p>
			<p>Destination: <%= destinationPoint %></p>
			<p>Date of Fly: <%= date %></p>
			<p>Passengers: <%= numPassengers %></p>
		</div>
	</div>

	<div class="container mt-5 mb-3">
	    <div class="row">
	        <%
	        
	        	if(airLinesList!=null){
	        	for(EAirLines x:airLinesList){%>
	        		
			        <div class="col-md-4">
			            <div class="card p-3 mb-2">
			                <div class="d-flex justify-content-between">
			                    <div class="d-flex flex-row align-items-center">
			                        <div class="icon"> 
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-fill" viewBox="0 0 16 16">
										<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Z"/>
									</svg> 
									</div>
			                        <div class="ms-3 c-details">
			                            <h6 class="mb-0">Air Lines</h6> 
			                        </div>
			                    </div>
			                </div>
			                <div class="mt-5">
			                    <h3 class="heading"><%= x.getAirLinesName() %> </h3>
			                    <p>Flying On: <%= x.getDateOfFlying() %> : <%= x.getTimeOfFlying() %></p>
			                    <p>Distance of Flight: <%= x.getDistance() %></p>
			                    <h5 class="heading bg-warning rounded d-inline p-2 text-center">Fair: <%= x.getCostPerKm()*x.getDistance() %>/-</h5>
			                    <div class="mt-5">
			                        <div class="">
			                            <a class="btn btn-dark form-control" href='./bookingInformation.jsp?flightId=<%= x.getId()%>'>Book Now</a>
			                        </div>
			                        <div class="mt-3"> <span class="text1 text-warning">5 Star  <span class="text2">Rated</span></span> </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			        
	        <%}}else{
	        	
	        	out.println("<h3 class='bg-white text-center p-5'>No flights Found based on your Search</h3>");
	        }%>
	    </div>
	</div>

</body>
</html>
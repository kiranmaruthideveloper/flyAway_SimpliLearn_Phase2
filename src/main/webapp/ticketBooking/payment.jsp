<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "com.controler.HibernateUtil" %>
<%@ page import = "com.controler.EAirLines" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.hibernate.Transaction" %>

<jsp:useBean id= "passenger" class="com.controler.EPassenger"/>
<jsp:useBean id= "bookingInformation" class="com.controler.BookingInformation"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
</head>
<body>
<h1>Please Wait while we are processing your payment...</h1>

<%

	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session_db = factory.openSession();

	int bookingId = (int)session.getAttribute("bookingID");
	int flightId = Integer.parseInt(request.getParameter("flightId"));
	int numPassengers = Integer.parseInt((String)session.getAttribute("numPassengers"));
	
	List<EAirLines> airLinesList = session_db.createQuery("from EAirLines where id="+flightId).list();
	EAirLines airLinesInfo = airLinesList.get(0);

	int totalAmount = airLinesInfo.getCostPerKm()*airLinesInfo.getDistance()*numPassengers;
	
	bookingInformation.addBookingInformation(bookingId, flightId, numPassengers, totalAmount);
	
	//addeding passenger information
	
	for(int i=1;i<=numPassengers;i++){
		String name = (String)session.getAttribute("passengerName_"+i); 
		//int age = Integer.parseInt((String)session.getAttribute("passengerAge_"+i));
		int age = Integer.parseInt((String)session.getAttribute("passengerAge_"+i));
		System.out.println(age);
		System.out.println(session.getAttribute("passengerAge_"+i));
		
		String gender = (String)session.getAttribute("passengerGender_"+i);
		String phone = (String)session.getAttribute("passengerPhone_"+i);
		String email =(String) session.getAttribute("passengerEmail_"+i);
		passenger.addEPassenger(bookingId, name, age, gender, phone, email);
	}
	
	response.sendRedirect("thankyou.jsp?flightId="+flightId);

%>



</body>
</html>
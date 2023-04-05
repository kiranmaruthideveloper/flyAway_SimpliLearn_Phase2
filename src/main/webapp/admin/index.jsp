<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - Fly Away</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body class="container bg-dark text-white">
	<div class="text-center">
		<h1>Admin Login - Fly Away</h1>
	</div>
	<div>
		<form action="login.jsp" method="POST">
			<div>
				<% 
					if(request.getParameter("error")!=null){
						out.println("<h5>"+request.getParameter("error")+"</h5>");
					}
				%>
			</div>
			<div class="form-group">
				<label>Username : </label><input type="text" name="uname" class="form-control">
			</div>
			<div class="form-group">
				<label>Password : </label><input type="password" name="password" class="form-control">
			</div>
			<div class="form-group">
				<input type="submit" name="submit" class="form-control btn btn-outline-success" value="Login">
			</div>
		</form>
	
	</div>
</body>
</html>
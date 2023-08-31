<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
}
.title {
	color: grey;
	font-size: 18px;
}
button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}
a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}
button:hover, a:hover {
	opacity: 0.7;
}
</style>
</head>
<body>
	<h2 style="text-align: center">User Profile Card</h2>
	<div class="card">
		<img src="https://www.w3schools.com/w3images/team2.jpg" alt="John" style="width: 100%">
		<%
		UserEntity user = (UserEntity) request.getAttribute("userDetails");

			if (user != null) {
		%>
		<h1><%=user.getName()%></h1>
		<p class="title"><%=user.getEmail()%></p>
		<p><%=user.getPhoneNumber()%></p>
		<div style="margin: 24px 0;">
			<a href="#"><i class="fa fa-dribbble"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-facebook"></i></a>
		</div>
		<p>
			<button>Contact</button>
		</p>
	</div>
	<%
	} else {
	%>
	<p>User not found.</p>
	<%
	}
	%>

</body>
</html>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title> User profile </title>
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
		<img src="https://iili.io/J9BuLEN.md.png" alt="John" style="width: 100%">
		<%
		UserEntity user = (UserEntity) request.getAttribute("userDetails");

			if (user != null) {
		%>
		<h1><%=user.getName()%></h1>
		<p class="title"><%=user.getEmail()%></p>
		<p><%=user.getPhoneNumber()%></p>
		<p><%=user.getRole()%></p>
		
		<a href="delete?id=${requestScope.userDetails.getId()}"> Delete Account </a>
		
		<p>
		<a href="edit"> <button>Edit</button> </a>
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
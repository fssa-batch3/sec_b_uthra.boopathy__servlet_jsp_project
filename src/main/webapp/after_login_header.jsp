<%@page import="in.fssa.tharasworld.model.User"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon"
	href="../assets/img/illustration/v-removebg-preview.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
* {
	margin: 0px;
	font-family: 'Kreon', serif;
}

header {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	background-color: purple;
	height: 100px;
}

header div ul {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	list-style: none;
	margin-left: 550px;
}

header div ul li {
	padding-top: 35px;
	padding-left: 30px;
}

header div ul li a {
	text-decoration: none;
	color: white;
	font-size: 24px;
}

#count {
	background-color: white;
	color: purple;
	font-size: 20px;
	border-radius: 50%;
	height: 20px;
	width: 22px;
	margin-top: -44px;
	margin-left: 17px;
	text-align: center;
	font-weight: bold;
}

h1 {
	font-size: 50px;
	font-weight: normal;
	padding-left: 60px;
	margin-top: 20px;
	color: white;
}

.logo {
	margin-top: 15px;
	margin-left: 50px;
	border-radius: 50px;
	width: 70px;
	height: 70px;
}

.login {
	font-size: 25px;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<%
	UserEntity user = (UserEntity) request.getAttribute("userDetails");
	if (user != null) {
	%>

	<header id="userLogin">

		<a href="category_list"> <img class="logo"
			src="https://iili.io/HybH2KN.png" alt="logo" />
		</a>
		<h1>Thara's World</h1>
		<div class="nav">
			<ul>
				<li><a href="#"><i
						class="fa-sharp fa-solid fa-cart-shopping"></i> </a></li>
				<li><a href="#"><i class="fa-sharp fa-solid fa-heart"></i></a></li>
				<li><a href="#"><i class="fa-solid fa-bag-shopping"></i></a></li>
				<li><a href="/tharasworldweb/user/details"><i id="profile"
						class="fa-solid fa-circle-user"></i> </a></li>
				<li><a href="user/logout"> <span class="login"
						id="logout"> Log out </span></li>
				</a>
			</ul>
		</div>

	</header>
	<%
	}
	%>
</body>
</html>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Index page</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #ebc6c6;
	font-family: 'Kreon', serif;
}

.login {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin: 50px 150px 0px 100px;
}

.login img {
	width: 80px;
	height: 80px;
	border-radius: 80px;
	position: relative;
	bottom: 10px;
	left: 40px;
}

.login button {
	position: relative;
	bottom: 65px;
	height: 35px;
	width: 120px;
}

.login a {
	font-size: 23px;
}

.nav ul li a {
	padding: 20px;
	text-decoration: none;
	color: purple;
}

.nav ul {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	margin-left: 100px;
	margin-top: 15px;
}

.page {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	margin-top: -40px;
	width: 100%;
}

.left img {
	height: 750px;
	transform: scaleX(-1);
	width: 90%;
}

.right {
	height: 450px;
	margin-top: 200px;
	width: 50%;
}

h3 {
	color: purple;
	font-weight: normal;
	font-size: 45px;
}

p {
	font-size: 22px;
	margin-top: 60px;
	color: rgba(49, 2, 49, 0.849);
}

button a {
	text-decoration: none;
	color: white;
	font-size: 15px;
}

h4 {
	font-size: 18px;
	color: white;
	font-weight: normal;
}

span {
	color: purple;
	font-size: 25px;
	font-weight: 500;
}

.left {
	width: 50%;
}

button {
	height: 45px;
	width: 180px;
	border-radius: 5px;
	border: none;
	background-color: purple;
	margin: 80px 40px 0px 0px;
	padding: 5px;
}

a button {
	color: white;
	font-size: 19px;
}

.menu {
	display: none;
}

@media only screen and (max-width: 420px) {
	.login .nav {
		display: none;
	}
	.menu {
		display: block;
		margin-left: 220px;
		font-size: 30px;
		position: relative;
		color: rgba(49, 2, 49, 0.849);
	}
	.login img {
		height: 60px;
		width: 60px;
		margin-left: -120px;
	}
	.login button {
		display: none;
	}
	.left img {
		width: 180%;
		height: 90%;
		margin-top: 10vh;
		margin-left: 3vh;
	}
	.page {
		display: block;
	}
	.right {
		margin: 10% 3%;
		height: auto;
		width: auto;
	}
	.right {
		margin-top: 8%;
		margin-left: 4vh;
	}
	.get {
		height: 35px;
		width: 150px;
		margin-top: 5vh;
		margin-left: 10vh;
	}
	.menu-list {
		width: 150px;
		z-index: 111;
		height: auto;
		color: rgba(49, 2, 49, 0.849);
		position: absolute;
		top: 38px;
		left: -7px;
		display: none;
	}
	.menu-list ul li {
		list-style: none;
		background-color: purple;
	}
	.menu-list ul li a {
		text-decoration: none;
		color: white;
	}
	.menu:hover .menu-list {
		display: block;
	}
}
</style>
</head>
<body>

	<%
	if (request.getAttribute("userDetails") != null) {

		UserEntity user = (UserEntity) request.getAttribute("userDetails");
		
		System.out.println(user.toString());

		if (user.getRole().equalsIgnoreCase("seller")) {
	%>


	<header id="userLogin">
		<div class="login">
			<img src="https://iili.io/HybH2KN.png" alt="logo" height="80px"
				width="80px">
			<div class="nav">
				<ul>
					<li><a href="product_list"> Seller </a></li>
					<li><a href="product_list"> Dress </a></li>
					<li><a href="product_list"> Jewell </a></li>
					<li><a href="product_list"> Sandal </a></li>
					<li><a href="product_list"> Cosmetics </a></li>
					<li><a href=""> About Us </a></li>
				</ul>
			</div>
			<a href="user/new">
				<button>Sign up</button>
			</a> <a href="user/login">
				<button>Sign in</button>
			</a>
		</div>
	</header>

	<%
	} else { %>
		
		
		<header id="userLogin">
		<div class="login">
			<img src="https://iili.io/HybH2KN.png" alt="logo" height="80px"
				width="80px">
			<div class="nav">
				<ul>
					<li><a href="user/new"> Seller </a></li>
					<li><a href="product_list"> Dress </a></li>
					<li><a href="product_list"> Jewell </a></li>
					<li><a href="product_list"> Sandal </a></li>
					<li><a href="product_list"> Cosmetics </a></li>
					<li><a href=""> About Us </a></li>
				</ul>
			</div>
			<a href="user/new">
				<button>Sign up</button>
			</a> <a href="user/login">
				<button>Sign in</button>
			</a>
		</div>
	</header>

		
	<% }
	} else {
	%>

	<header id="userLogin">
		<div class="login">
			<img src="https://iili.io/HybH2KN.png" alt="logo" height="80px"
				width="80px">
			<div class="nav">
				<ul>
					<li><a href="user/new"> Seller </a></li>
					<li><a href="product_list"> Dress </a></li>
					<li><a href="product_list"> Jewell </a></li>
					<li><a href="product_list"> Sandal </a></li>
					<li><a href="product_list"> Cosmetics </a></li>
					<li><a href=""> About Us </a></li>
				</ul>
			</div>
			<a href="user/new">
				<button>Sign up</button>
			</a> <a href="user/login">
				<button>Sign in</button>
			</a>
		</div>
	</header>

	<%
	}
	%>

	<div class="page">
		<div class="left">
			<img src="https://iili.io/Hyb9PMQ.jpg" alt="photo" height="700px"
				width="500px">
		</div>
		<div class="right">
			<h3>
				<b> Welcome to Thara's World </b>
			</h3>
			<p>
				"What you wear is how you present yourself to the world, especially
				today, when human contacts are so quick. Fashion is instant
				language." So style yourself with <span> Thara's World </span>
			</p>
			<button class="get">
				<a href="category_list"> GET STARTED </a>
			</button>
		</div>
	</div>

</body>
</html>

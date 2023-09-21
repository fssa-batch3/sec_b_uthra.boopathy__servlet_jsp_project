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

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style-startpage.css">

<title>Index page</title>
</head>
<body>

	<%HttpSession session1 = request.getSession();
	
	if (session1.getAttribute("userDetails") != null) {

		UserEntity user = (UserEntity) session1.getAttribute("userDetails");
		
		
		
	/*	System.out.println("User"+user);
		
		 System.out.println(user.toString()); */

		if (user.getRole().equalsIgnoreCase("seller")) {
			
	%>


	<header id="userLogin">
		<div class="login">
			<img src="https://iili.io/HybH2KN.png" alt="logo" height="80px"
				width="80px">
			<div class="nav">
				<ul>
					
					<li><a href="product_list"> Dress </a></li>
					<li><a href="product_list"> Jewell </a></li>
					<li><a href="product_list"> Sandal </a></li>
					<li><a href="product_list"> Cosmetics </a></li>
					<li><a href="seller_home_page.jsp"> Seller </a></li>
					<!-- <li><a href=""> About Us </a></li> -->
				</ul>
			</div>
			<a href="user/create">
				<button>Sign up</button>
			</a> <a href="user/login">
				<button>Login</button>
			</a>
		</div>
	</header>

	<%
		}
	} else {
	%>

	<header id="userLogin">
		<div class="login">
			<img src="https://iili.io/HybH2KN.png" alt="logo" height="80px"
				width="80px">
			<div class="nav">
				<ul>
					
					<li><a href="product_list"> Dress </a></li>
					<li><a href="product_list"> Jewell </a></li>
					<li><a href="product_list"> Sandal </a></li>
					<li><a href="product_list"> Cosmetics </a></li>
					<li><a href="user/new"> Seller </a></li>
					<!-- <li><a href=""> About Us </a></li> -->
				</ul>
			</div>
			<a href="user/create">
				<button>Sign up</button>
			</a> <a href="user/login">
				<button>Login</button>
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

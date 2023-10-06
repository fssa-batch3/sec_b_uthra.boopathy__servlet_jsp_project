<%@page import="in.fssa.tharasworld.service.UserService"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
* {
	margin: 0px;
	font-family: 'Kreon', serif;
}

header {
	display: flex;
	justify-content: space-between;
	background-color: purple;
	height: 100px;
}

header img {
	height: 75px;
	width: 75px;
	margin:10px;
	border-radius:50%;
}
header h1{
	margin-top:20px;
	font-size: 50px;
	font-weight: normal;
	color: white;
	padding-left: 20px;
}

.web {
	width: 500px;
	display: flex;
	margin-left: 40px;
}

.nav {
	display: flex;
	width: 300px;
	justify-content: space-around;
	font-size: x-large;
	margin-top: 35px;
}

.login_drop_li {
	list-style: none;
	padding:10px;
}

.login_dropdown_list li a {
	text-decoration: none;
	color: purple;
}

.login_dropdown_list {
	width: 130px;
	font-size: 18px;
	border-width: 1px;
	padding-bottom: 5px;
	border-color: gray;
	padding:0px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 130px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.login {
	font-size: x-large;
	color: white;
}

.login a {
	text-decoration: none;
}

</style>
</head>
<body>

	 <%

	HttpSession session1 = request.getSession();

	Integer userIdObject = (Integer) session1.getAttribute("userId");


	if(userIdObject == null) {
		
%>  	


<header id="userLogin">

		<div class="web">
			<a href="/tharasworldweb/category_list"> <img class="logo"
				src="https://iili.io/HybH2KN.png" alt="logo" />
			</a>
			<h1>Thara's World</h1>
		</div>

		<div>
			<div class="nav">
				<div class="dropdown">
					<a href= "/tharasworldweb/user/login"><span class="login"> Login </span> </a>
						</div>
						</div>
						</div>
						</header>

<!-- 
	<header id="userLogin">

<a href= "/tharasworldweb/category_list"> <img class="logo" src="https://iili.io/HybH2KN.png" alt="logo" /> </a>
		<h1> Thara's World </h1>
		  <div class="nav">
		     <ul> 
		        <li><a href = "/tharasworldweb/user/new"><span class="login"> Sign up </span> </a> </li>
		        <li> <a href= "/tharasworldweb/user/login"><span class="login"> Login </span> </a></li>
		      </ul>
		  </div>

</header> -->
	
	<%
	} else { 

	  	int userId = userIdObject.intValue();
		UserEntity user = UserService.findById(userId);
	
			 if (user.getRole().equalsIgnoreCase("seller")) { %>
		 

	<header id="userLogin">

		<div class="web">
			<a href="/tharasworldweb/category_list"> <img class="logo"
				src="https://iili.io/HybH2KN.png" alt="logo" />
			</a>
			<h1>Thara's World</h1>
		</div>

		<div>
			<div class="nav">
				<div class="dropdown">
					<a href="/tharasworldweb/user/details"><i id="profile"
						class="fa-solid fa-circle-user" style="color: white;"></i></a>
					<!-- <a href="/tharasworldweb/cart"><i class="fa-sharp fa-solid fa-cart-shopping" style="color:white;"></i></a> -->
					<div class="dropdown-content">
						<ul class="login_dropdown_list">

							<li class="login_drop_li"><a
								href="/tharasworldweb/user/details"> View profile </a></li>
							<li class="login_drop_li"><a
								href="/tharasworldweb/product_list"> <span> My
										products </span>
							</a></li>
							<li class="login_drop_li"><a
								href="/tharasworldweb/seller_orderList"> <span>
										Orders </span>
							</a></li>
							<li class="login_drop_li"><a href="/tharasworldweb/orders">
									<span> My Orders </span>
							</a></li>
							<li class="login_drop_li"><a
								href="/tharasworldweb/user/logout"> <span id="logout"> Log out </span>
							</a></li>
						</ul>
					</div>

				</div>
				<div>
					<a href="/tharasworldweb/wishlist"><i
						class="fa-sharp fa-solid fa-heart" style="color: white;"></i></a>
				</div>
				<div>
					<a href="/tharasworldweb/cart"><i
						class="fa-sharp fa-solid fa-cart-shopping" style="color: white;"></i></a>
					<!-- <a href="/tharasworldweb/user/details"><i id="profile" class="fa-solid fa-circle-user" style="color:white;"></i></a> -->
				</div>
			</div>

		</div>

	</header>



	 	<% } else { %>
	
<header id="userLogin">

		<div class="web">
			<a href="/tharasworldweb/category_list"> <img class="logo"
				src="https://iili.io/HybH2KN.png" alt="logo" />
			</a>
			<h1>Thara's World</h1>
		</div>

		<div>
			<div class="nav">
				<div class="dropdown">
					<!-- <a href="/tharasworldweb/user/details"> --><i id="profile"
						class="fa-solid fa-circle-user" style="color: white;"></i>
						<!--</a>
					 <a href="/tharasworldweb/cart"><i class="fa-sharp fa-solid fa-cart-shopping" style="color:white;"></i></a> -->
					<div class="dropdown-content">
						<ul class="login_dropdown_list">

							<li class="login_drop_li"><a
								href="/tharasworldweb/user/details"> View profile </a></li>

							</a></li>
							<li class="login_drop_li"><a href="/tharasworldweb/orders">
									<span> My Orders </span>
							</a></li>
							
							<li class="login_drop_li"><a
								href="/tharasworldweb/user/logout"> <span id="logout"> Log out </span>
							</a></li>
						</ul>
					</div>

				</div>
				<div>
					<a href="/tharasworldweb/wishlist"><i
						class="fa-sharp fa-solid fa-heart" style="color: white;"></i></a>
				</div>
				<div>
					<a href="/tharasworldweb/cart"><i
						class="fa-sharp fa-solid fa-cart-shopping" style="color: white;"></i></a>
					<!-- <a href="/tharasworldweb/user/details"><i id="profile" class="fa-solid fa-circle-user" style="color:white;"></i></a> -->
				</div>
			</div>

		</div>

	</header>

	
		<% } %>
	
	
	<% } %>  

</body>


<script>

    const logoutBtn = document.getElementById("logout");
    
    logoutBtn.addEventListener("click", function(event){
    	
    	const confirmation = confirm("Are you sure to logout?");
    	
    	if (!confirmation) {
	        event.preventDefault();
	    }
    	
    });
    
	</script>

</html>
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
	margin-left: 100px;
}

header div ul li a {
	text-decoration: none;
	color: white;
	font-size: 24px;
}


/* #count {
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
 */
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

.nav_dropdown{
position:relative;
top:10px;
right: 15pc;
}
.login_dropdown_list{
position:absolute;

background-color: black;
box-shadow:0 4px 16px rgb(0 0 0 /20%);
min-width:240px;
transform:translate(-30px);
}

.login_drop_li{
border-bottom: 1px solid black;
font-size:14px;
}
.login {
    display: flex;
    margin-top: 20px;
    padding: 0px 20px; 
    font-size: 25px;
    color: white;
    cursor: pointer;
    }
    .none{
    display:none;
    }
   .login:hover .nav_dropdown{
   	display:block;
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

<a href= "/tharasworldweb/category_list"> <img class="logo" src="https://iili.io/HybH2KN.png" alt="logo" /> </a>
		<h1> Thara's World </h1>
		  <div class="nav">
		     <ul> 
		        <!-- <li><a href = "/tharasworldweb/user/new"><span class="login"> Sign up </span> </a> </li> -->
		        <li> <a href= "/tharasworldweb/user/login"><span class="login"> Login </span> </a></li>
		      </ul>
		  </div>

</header>
	
	<% } else { 
	
		int userId = userIdObject.intValue();
		UserEntity user = UserService.findById(userId);
	
			 if (user.getRole().equalsIgnoreCase("seller")) { %>
		
	
	<header id="userLogin">

		<a href="/tharasworldweb/category_list"> <img class="logo"
			src="https://iili.io/HybH2KN.png" alt="logo" />
		</a>
		<h1>Thara's World</h1>
		<div style="margin-left: 40rem;">
		<div class="login">
		<div class="login">
		<a href="/tharasworldweb/user/details"><i id="profile" class="fa-solid fa-circle-user" style="color:white;"></i></a>
		<!-- <a href="/tharasworldweb/cart"><i class="fa-sharp fa-solid fa-cart-shopping" style="color:white;"></i></a> -->
		</div>
		<div style="margin-top: 20px; padding: 0px 20px; ">
		<a href="/tharasworldweb/wishlist"><i class="fa-sharp fa-solid fa-heart" style="color:white;"></i></a>
		</div>
		<div style="margin-top: 20px; padding: 0px 20px; ">
		<a href="/tharasworldweb/cart"><i class="fa-sharp fa-solid fa-cart-shopping" style="color:white;"></i></a>
		<!-- <a href="/tharasworldweb/user/details"><i id="profile" class="fa-solid fa-circle-user" style="color:white;"></i></a> -->
				<div class="nav_dropdown none" style="width: 70px;">
				 	<ul  class="login_dropdown_list">
						
							<li class="login_drop_li" style="margin-left: 6px;">
								<a href="/tharasworldweb/user/details"> View profile </a>
							</li>
							<li class="login_drop_li" style="margin-left: -0.8rem;">
								<a href="/tharasworldweb/product_list"> <span class="login" id="logout"> My products </span>
								 </a> </li>
							<li class="login_drop_li" style=" margin-left: -11px;">
								<a href="/tharasworldweb/seller_orderList"> <span class="login" id="logout"> Orders </span> 
								</a> </li>
							<li class="login_drop_li" style="margin-left: -10px;">
								<a href="/tharasworldweb/orders"> <span class="login" id="logout"> My Orders </span>
								 </a> </li>
							<li class="login_drop_li" style="margin-left: -11px;">
								<a href="/tharasworldweb/user/logout"> <span class="login" id="logout"> Log out </span> 
								</a> </li>
						</ul>
					</div> 	
		</div>
		</div>
			

		</div>

	</header>
	
		<% } else { %>
	
					<header id="userLogin">

		<a href="/tharasworldweb/category_list"> <img class="logo"
			src="https://iili.io/HybH2KN.png" alt="logo" />
		</a>
		<h1>Thara's World</h1>
		<div style="margin-left: auto;">
		<div class="login">
		<div class="login">
		<a href="/tharasworldweb/cart"><i class="fa-sharp fa-solid fa-cart-shopping" style="color:white;"></i></a>
		</div>
		<div class="login">
		<a href="/tharasworldweb/wishlist"><i class="fa-sharp fa-solid fa-heart" style="color:white;"></i></a>
		</div>
		<div class="login">
		<a href="/tharasworldweb/user/details"><i id="profile" class="fa-solid fa-circle-user" style="color:white;"></i></a>
				<div class="nav_dropdown none">
				 	<ul  class="login_dropdown_list">
						<li></li>
							<li class="login_drop_li"><a href="/tharasworldweb/user/details"> View profile </a>
							<li class="login_drop_li"><a href="/tharasworldweb/seller_orderList"> <span class="login"
								id="logout"> Orders </span> </a> </li>
							<li class="login_drop_li"><a href="/tharasworldweb/orders"> <span class="login"
								id="logout"> My Orders </span> </a> </li>
							<li class="login_drop_li"><a href="/tharasworldweb/user/logout"> <span class="login"
								id="logout"> Log out </span> </a> </li>
						</ul>
					</div> 	
		</div>
		</div>
			

		</div>

	</header>
	
		<% } %>
	
	
	<% } %> 
	
</body>

 <script>

 document.querySelector("#logout").addEventListener("click", (e) => {
	 if(window.confirm ("Are you sure to logout ?")){
		 window.location.href="/tharasworldweb/user/logout";
	 }
 });

</script> 

</html>
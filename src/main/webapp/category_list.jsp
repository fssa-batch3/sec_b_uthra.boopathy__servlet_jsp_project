<%@page import="in.fssa.tharasworld.entity.CategoryEntity"%>
<%@page import="java.util.*"%>
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
<style>
    *{
    margin: 0px;
    font-family: 'Kreon', serif;
}

header{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    background-color: purple;
    height: 100px;
}

header div ul{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    list-style: none;
    margin-left: 550px;
}

header div ul li{
    padding-top: 20px;
    padding-left: 30px;
}

header div ul li a{
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

h1{
    font-size: 50px;
    font-weight: normal;
    padding-left: 60px;
    margin-top: 20px;
    color: white;
}

.logo{
    margin-top: 15px;
    margin-left: 50px;
    border-radius: 50px;
    width: 70px;
    height: 70px;
}

.login{
    font-size: 25px;
    color: white;
    cursor: pointer;
}

.thumbnail{
    display: grid;
    grid-template-columns: repeat(4, 280px);
    justify-content: space-evenly;
    grid-column-gap: 20px;
    grid-row-gap: 30px;
    margin: 40px 0px 0px 0px;
}

img{
    object-fit: unset;
    border-radius: 5px;
    margin-left: 50px;
    margin-top: 15px;
}

h3{
    font-size: 22px;
    font-weight: normal;
    margin-top: 20px;
    width: 250px;
    text-align: center;
    color: rgb(74, 3, 74);
}

a{
    text-decoration: none;
}

.products:hover{
    transform: scale(1.08);
}

.products{
    border: 1px solid #f8f8f8;
    background-color: #f8f8f8;
    margin: 10px 0px 10px 0px;
}
</style>


</head>
<body>

<header id="userLogin">  

<a href= "/products"> <img class="logo" src="https://iili.io/HybH2KN.png" alt="logo" /> </a>
<h1> Thara's World </h1>
  <div class="nav">
     <ul>
        <li> <a href= "#"><i class="fa-sharp fa-solid fa-cart-shopping"></i> </a></li>
        <li> <a href= "#"><i class="fa-sharp fa-solid fa-heart"></i></a></li> 
        <li><a href= "#"><i class="fa-solid fa-bag-shopping"></i></a></li>
        <li><a href="#"><i class="fa-solid fa-bell"></i></i></a></li>
        <li><a href= "#" ><i id="profile" class="fa-solid fa-circle-user"></i> </a></li>
        <li> <span class="login" id="logout"> Log out </span> </li>
      </ul>
  </div>


</header>


<h2> Category List </h2> 

<% Set<CategoryEntity> category =(Set<CategoryEntity>) request.getAttribute("categoryList"); %>

<section>

<div class="thumbnail">  

	<% for(CategoryEntity categories : category) { %>
	
	<a href="category/types?category_id=<%= categories.getCateId() %>">
	
	<div class="products"> 
	
		<img src = "https://iili.io/HyDu9qP.webp" alt="image" height="200px" width="180px">
		<h3> <%= categories.getCateName() %> </h3>

	</div>
	
	</a>
	
	<% } %>

</div>

</section>

</body>
</html>


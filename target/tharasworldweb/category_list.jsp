<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title> Category List </title>

<style>

.search {
    display: flex;
    align-items: center;
    justify-content: space-between; 
    padding: 10px; 
    width: 60rem;
    margin-top: 40px;
}

h2 {
    margin-left: 20rem; 
    font-size: 30px;
}

input[type="search"] {
    padding: 5px; 
    border: 1px solid #ccc;
    border-radius: 5px; 
    font-size: 16px; 
    width: 40%; 
    outline: none;
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

<%
	String headerJSP = "";
	if (request.getAttribute("userDetails") != null) {
		headerJSP = "/after_login_header.jsp";
	} else {
		headerJSP = "/before_login_header.jsp";
	}
	%>

	<jsp:include page="<%=headerJSP%>" />
<form action="category/products" method="get">

<div class="search">

	<h2> Category List </h2> 
	
	<input type="search" name="search" placeholder="Search products by category name">

</div>

 	</form>


<% Set<CategoryEntity> category =(Set<CategoryEntity>) request.getAttribute("categoryList"); %>

<section>

<div class="thumbnail">  

	<% for(CategoryEntity categories : category) { %>
	
	<a href="category/types?category_id=<%= categories.getCateId() %>">
	
	<div class="products"> 
	
		<img src = "<%= categories.getImg() %>" alt="image" height="200px" width="180px">
		<h3> <%= categories.getCateName() %> </h3>

	</div>
	
	</a>
	
	<% } %>

</div>

</section>

</body>
</html>


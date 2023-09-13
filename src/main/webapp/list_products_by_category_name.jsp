<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="java.util.Set"%>
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
<title> List of products by category name </title>

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
    padding-top: 40px;
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
    margin-top: 20px;
    margin-left: 50px;
	}

h3{
    font-size: 22px;
    font-weight: normal;
    margin-top: 20px;
    text-align: center;
    width: 250px;
    color: rgb(74, 3, 74);
}

p{
    color: black;
    font-size: 20px;
    text-align: center;
    word-spacing: 5px;
    margin-top: 10px;
}

s{
    color: gray;
}

.percent{
    color: green;
}

a{
    text-decoration: none;
}

.products{
    border: 1px solid #f8f8f8;
    background-color: #f8f8f8;
    margin: 10px 0px 10px 0px;
    boder-radius: 5px;
}

.button-container {
    text-align: center;
    margin-bottom: 20px;
}

button {
    background-color: purple;
    color: #fff;
    padding: 10px 20px;
    margin-left: 75rem;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-size: 18px;
}

button:hover {
    background-color: purple;
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


<h1> Product List </h1> 

<%


 Set<ProductDetailDTO> product =(Set<ProductDetailDTO>) request.getAttribute("ListProductsByCategoryName"); %>

<section>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
	
	<a href="/tharasworldweb/category/types/products/details?pdt_id=<%= products.getPdtId() %>">
		
	<div class="products" style="display: inline-block; height: 300px; width: 300px;"> 
	
		<img src = "<%= products.getImg() %>" alt="image" heigth="200px" width="180px">
		<h3> <%= products.getName() %> </h3>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p> &#8377 <%= priceList.get(0).getCurrentPrice() %> 
          <s> &#8377 <%= priceList.get(0).getActualPrice() %> </s>
          <span class="percent"> <%= priceList.get(0).getDiscount() %> %off </span>
          </p>
        </div>
          <% } %>

	</div>
	
		</a>
	
	<% } %>

</div>

</section>



</body>
</html>
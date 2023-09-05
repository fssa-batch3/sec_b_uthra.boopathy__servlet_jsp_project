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
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

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
	text-align: center;
    width: 250px;
    color: rgb(74, 3, 74);
}

p{
    color: black;
    font-size: 20px;
    word-spacing: 5px;
    margin-top: 10px;
    margin-left: 20px; 
    text-align: center;
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

.products:hover{
    transform: scale(1.08);
}

.products{
    border: 1px solid #f8f8f8;
    background-color: #f8f8f8;
    margin: 10px 0px 10px 0px;
}
</style>

</style>

</head>
<body>


<header id="userLogin">  

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


 Set<ProductDetailDTO> product =(Set<ProductDetailDTO>) request.getAttribute("ListOfProductsByType"); %>

<section>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
	
	<a href="products/details?pdt_id=<%= products.getPdtId() %>">
		
	<div class="products"> 
	
		<img src = "<%= products.getImg() %>" alt="image" heigth="200px" width="180px">
		<h3> <%= products.getName() %> </h3>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p> <%= priceList.get(0).getCurrentPrice() %> 
          <s> <%= priceList.get(0).getActualPrice() %> </s>
          <span class="percent"> <%= priceList.get(0).getDiscount() %> </span>
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
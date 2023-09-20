<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
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
<title> Product lists </title>

 <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-silksareepage.css">

<style>

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

<%@ include file="/header.jsp" %> 

<h1> Product List </h1> 

<a href="product/new"> <button type="submit"> Add products </button>  </a>

<% Set<ProductDetailDTO> product =(Set<ProductDetailDTO>) request.getAttribute("productList"); %>

<section>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
		<a href="product/details?pdt_id=<%= products.getPdtId() %>">	
	<div class="products"> 
	
		<img src = "<%= products.getImg() %>" alt="image" height="200px" width="180px">
		 <h3> <%= products.getName() %> </h3>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p id="original_price"> &#8377 <%= priceList.get(0).getCurrentPrice() %> 
          <s id="discount_price"> &#8377 <%= priceList.get(0).getActualPrice() %> </s> 
         <span class="percent"> <%= priceList.get(0).getDiscount() %> %off </span>
         </p>
        </div>
        
          <% } %>

	</div>
	
	
	<% } %>

</div>

</section>

</body>
</html>
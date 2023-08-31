<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Add your custom styles here */
    body {
      font-family: Arial, sans-serif;
    }

    .thumbnail {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
    }

    .products {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 10px;
      padding: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f5f5f5;
      width: 200px;
    }

    .products img {
      max-width: 100%;
      height: auto;
    }

    .products h3 {
      margin-top: 10px;
      font-size: 1.2rem;
      text-align: center;
      color: black;
      text-decoration: none;
    }

    /* Styling for prices */
    .products p {
      display: inline-block;
      margin: 5px;
      color: black;
      text-decoration: none;
    }
</style>

</head>
<body>

<h1> Product List </h1>

<% Set<ProductDetailDTO> product =(Set<ProductDetailDTO>) request.getAttribute("productList"); %>

<section>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
	
	<a href="product/details?pdt_id=<%= products.getPdtId() %>">
	
	<div class="products"> 
	
		<img src = "https://www.w3schools.com/w3images/team2.jpg" alt="image">
		<h3> <%= products.getName() %> </h3>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p> <%= priceList.get(0).getCurrentPrice() %> </p>
          <s><%= priceList.get(0).getActualPrice() %> </s>
          <p> <%= priceList.get(0).getDiscount() %> </p>
          		</div>
          <% } %>

	</div>
	
	</a>
	
	<% } %>

</div>

</section>

</body>
</html>
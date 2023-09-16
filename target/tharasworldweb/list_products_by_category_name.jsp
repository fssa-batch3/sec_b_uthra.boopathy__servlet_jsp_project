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

 <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-silksareepage.css">

<title> List of products by category name </title>

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
	
		<img src = "<%= products.getImg() %>" alt="image">
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
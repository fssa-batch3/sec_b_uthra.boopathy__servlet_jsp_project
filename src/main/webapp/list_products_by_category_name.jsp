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


	<%@ include file="/header.jsp" %> 
	
	<div class="arrows"></div>


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
       	  <p> &#8377 <%=(int) Math.round(priceList.get(0).getCurrentPrice()) %> 
          <s> &#8377 <%=(int) Math.round(priceList.get(0).getActualPrice()) %> </s>
          <span class="percent"> <%=(int) Math.round(priceList.get(0).getDiscount())%>%off </span>
          </p>
        </div>
          <% } %>

	</div>
	
		</a>
	
	<% } %>

</div>

</section>


<script>


//<div class = "arrow" > </div>
				 
				const div_arrow = document.createElement("div");
				div_arrow.setAttribute("class", "arrow");
				//console.log(div_arrow);
				
				//<a> link </a>
				
				const a_arrow = document.createElement("a");
				a_arrow.setAttribute("href", "javascript:void(0);"); // Use "javascript:void(0);" to make it non-clickable
				a_arrow.addEventListener("click", function() {
				    window.history.back();
				});
				div_arrow.append(a_arrow);
				//console.log(a_arrow);
				
				//< i >  arrow </i>
				
				const i_arrow = document.createElement("i");
				i_arrow.setAttribute("title", "Back");
				i_arrow.setAttribute("class", "fa-solid fa-arrow-left");
				a_arrow.append(i_arrow);
				
				document.querySelector("div.arrows").append(div_arrow); 

</script>


</body>
</html>
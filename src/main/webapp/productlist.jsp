<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.*"%>
<%@page import="in.fssa.tharasworld.service.ProductService"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-silksareepage.css">

<title>Insert title here</title>
</head>
<body>

<%@ include file="/header.jsp" %> 

<div class="arrows"></div>

<section>

<% 
Set<ProductDetailDTO> product = (Set<ProductDetailDTO>) request.getAttribute("productList");

%>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
			
	<div class="products"> 
	
		<img src = "<%= products.getImg() %>" alt="image" height="200px" width="180px">
		<a href="/tharasworldweb/category/types/products/details?pdt_id=<%= products.getPdtId() %>"> <h3> <%= products.getName() %> </h3> </a>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p id="original_price">&#8377 <%=(int) Math.round(priceList.get(0).getCurrentPrice())%> 
          <s id="discount_price"> &#8377 <%=(int) Math.round(priceList.get(0).getActualPrice())%></s> 
         <span class="percent"><%= (int) Math.round(priceList.get(0).getDiscount())%>%off </span>
         </p>
        </div>
          <% } %>

	</div>
	
	
	<% } %>

</div>

</section>

</body>

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

</html>
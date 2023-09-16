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


	<%
	String headerJSP = "";
	if (request.getAttribute("userDetails") != null) {
		headerJSP = "/after_login_header.jsp";
	} else {
		headerJSP = "/before_login_header.jsp";
	}
	%>

	<jsp:include page="<%=headerJSP%>" />

<section>

<% 
Set<ProductDetailDTO> product = ProductService.findAll();

%>

<div class="thumbnail">  

	<% for(ProductDetailDTO products : product) { %>
			
	<div class="products"> 
	
		<img src = "<%= products.getImg() %>" alt="image" height="200px" width="180px">
		<a href="product/details?pdt_id=<%= products.getPdtId() %>"> <h3> <%= products.getName() %> </h3> </a>
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
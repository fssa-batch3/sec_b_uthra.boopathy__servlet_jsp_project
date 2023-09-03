<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
}
.title {
	color: grey;
	font-size: 18px;
}
button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}
a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}
button:hover, a:hover {
	opacity: 0.7;
}
</style>
</head>
<body>
	<h2 style="text-align: center">User Profile Card</h2>
	<div class="card">
	  <img src="https://www.w3schools.com/w3images/team2.jpg" alt="John" style="width: 100%">
		<%
		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetails");

			if (product != null) {
		%>
		<h1><%=product.getName()%></h1>
		<% List<PriceEntity> price = product.getListOfPrices(); %>
		<p> <%= price.get(0).getCurrentPrice() %> </p>
		<s> <%= price.get(0).getActualPrice() %> </s>
		<p> <%= price.get(0).getDiscount() %>

		<p>
			<button>Add to cart</button>
		</p>
	</div>
	<%
	} else {
	%>
	<p>Product not found.</p>
	<%
	}
	%>

</body>
</html>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
   

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-saree1view.css">

<title> Product detail </title>

</head>
<body>

	<%@ include file="/header.jsp" %> 
	
	<%
		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetails");
	
		UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
		
			if (product != null) {
		%>
		
		<div class="detail">
		
		<div class="left">
    <div class="image">
        <img src="<%= product.getImg() %>" alt="ProductName image" height="460px" width="400px">
    </div>
</div>

<div class="right">
    <h3 id="name"> <%=product.getName()%> </h3>
    <h4>Special price</h4>
	
	<% List<PriceEntity> price = product.getListOfPrices(); %>
	
    <div class="price">
        <p id="original_price">&#8377 <%= price.get(0).getCurrentPrice() %></p>
        <p>
            <s id="discount_price">&#8377 <%= price.get(0).getActualPrice() %> </s>
        </p>
        <p>
            <b id="discount_percent"><%= price.get(0).getDiscount() %>% off</b>
        </p>
    </div>

    <strong>Product details:</strong>

    <div class="para">
        <p id="product_detail"> <%= product.getDescription() %> </p>
    </div>
    
    <strong class="paras">Additional offers</strong>
   
    <div class="paras">
        <p id="add_info"> &#8277 Special PriceGet extra 30% off (price inclusive of cash back / coupon)T&C </p>
		<p> &#8277 Bank Offer5% Cash back on Thara's World Axis Bank CardT&C </p>
		<p> &#8277Partner OfferSign up for Thara's World Pay Later and get Thara's World Gift Card worth up to Rs. 500</p>
    </div>
    
     <button class="add" data-add="product_uuid">ADD TO CART
        <i class="fa fa-shopping-cart" style="font-size:24px;color:white;"></i>
    </button> 
    
    <a href="/tharasworldweb/products/buy_now?pdt_id=<%= product.getPdtId() %>">
    
    <button class="buy">BUY NOW
        <i class="fa fa-shopping-bag" style="font-size:24px;color:white;"></i>
    </button>
    
    </a>
    
 <!--    <button class="wish">WISHLIST
        <i class="fa fa-heart" style="font-size:24px;color:white;"></i>
    </button> -->
    
</div>
		
		
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
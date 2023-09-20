<%@page import="in.fssa.tharasworld.model.OrderStatus"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="in.fssa.tharasworld.entity.OrderEntity"%>
<%@page import="java.util.*"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Seller order list </title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
        
 <style>
 
 .container {
 	display: flex;
 	justify-content: space-evenly;
 	background-color: whitesmoke;
    border-radius: 10px;
    margin: 100px; 
    padding: 20px; 
 }
 
 img {
 	boder-radius: 10px;
 }

.pdtDetails {
	margin-left: 2rem;
}

h3 {
	color: maroon;
	font-size: 28px;
	font-weight: bold;
}

 .price {
 
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
   	margin-top: 1rem;
 
 }
 
 .price p, s {
	padding-left: 20px;
	font-size: 23px;
    font-weight: bold;
    color: black;
 }
 
 .actprice{
 	color: darkgrey;
 }
 
 .discount {
 	color: green;
 }

.buttons {
	margin-top: 3rem;
    display: flex;
    justify-content: space-around;
}

.buttons p {
	font-size: 25px;
    font-weight: bold;
    color: black;	
}

.cancel {
	height: 35px;
 	width: 200px;
 	background-color: purple;
 	border-radius: 5px;
 	border: none;
 	color: white;
	font-size: 17px; 
	margin-left: 50px;	
}

a {
	text-decoration: none;
}

 button {
 	height: 35px;
 	width: 100px;
 	background-color: purple;
 	border-radius: 5px;
 	border: none;
 	color: white;
	font-size: 17px; 
	margin-left: 50px;	
 }

.userdetail {
	width: 25%;
	margin-left: 3rem;
	background-color: white;
	border-radius: 5px;
	padding: 10px;
}
  
 </style>

</head>
<body>


	<%@ include file="/header.jsp" %>      
	
	
	<% UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
	
	List<ProductDetailDTO> product = (List<ProductDetailDTO>) request.getAttribute("productList");
		
		List<AddressEntity> address = (List<AddressEntity>) request.getAttribute("addressList");
	
		List<OrderEntity> order = (List<OrderEntity>) request.getAttribute("orderList");
		
	%>                                                                              

	
	<% 
		for (int i = 0; i < order.size(); i++) {
	 %>
	
	<div class="container">
	
	<img src="<%= product.get(i).getImg() %>" alt="photo" style="height:200px; border-radius: 6px; width:200px;">
	
	
	
	<div class="pdtDetails">
	
	<h3> <%= product.get(i).getName() %> </h3>
	
	<div class="price">
	
	<p> &#8377 <%= product.get(i).getListOfPrices().get(0).getCurrentPrice() %> </p>
	
	<s class="actprice"> &#8377 <%= product.get(i).getListOfPrices().get(0).getActualPrice() %> </s>
	
	<p class="discount"> <%= product.get(i).getListOfPrices().get(0).getDiscount() %> % off </p>
	
		</div>
	
	<div class="buttons">
	
	
	         <%
     OrderStatus cancelStatus = (OrderStatus) order.get(i).getOrderStatus(); // Replace with the actual attribute name

    if (cancelStatus == OrderStatus.CANCELLED) {
%>
        <button class="cancel" style="display: block;" > ORDER CANCELLED </button>
<%
    } else if (cancelStatus == OrderStatus.WAITING_LIST) {
%>
       <a href="/tharasworldweb/accept_order?order_id=<%= order.get(i).getOrderId() %>"> <button type="submit"> ACCEPT </button>  </a>	
	
	   <a href="/tharasworldweb/cancel_order?order_id=<%= order.get(i).getOrderId() %>">  <button type="submit"> REJECT </button>  </a>
<%
    } else if (cancelStatus == OrderStatus.ON_THE_WAY) {
    	%>
        <button class="cancel" style="display: block;" > ORDER ACCEPTED </button>
        
       <a href="/tharasworldweb/order_delivered?order_id=<%= order.get(i).getOrderId() %>"> <button class="cancel" style="display: block;" > ORDER DELIVERED </button> </a>
 <%
     } else if (cancelStatus == OrderStatus.DELIVERED) {
    	%>
        <button class="cancel" style="display: block;" > ORDER ACCEPTED </button>
        
        <button class="cancel" style="display: block;" > DELIVERED </button> 
 <%
     } 
%> 
	
	
	</div>
	
	</div>
	
	<div class="userdetail">
	
	<strong> Delivery details : </strong>
	
	<p> Name : <%= address.get(i).getName() %> </p>
	
	<p> Address : <%= address.get(i).getAddress() %>, <%= address.get(i).getPincode() %>, <%= address.get(i).getState() %> </p>
	
	<p> Phone number : <%= order.get(i).getPhoneNumber() %> </p>
	
	<p> Ordered date : <%= order.get(i).getOrderedDate() %> </p>
	
	</div>
	
	</div>
	
	<% } %>

</body>
</html>
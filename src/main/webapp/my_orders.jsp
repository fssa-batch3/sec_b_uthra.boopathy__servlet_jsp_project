<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.tharasworld.model.OrderStatus"%>
<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.tharasworld.entity.OrderEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title> My orders page </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
</head>

<style>
 
 .container {
 	display: flex;
 	justify-content: space-evenly;
 	background-color: whitesmoke;
    border-radius: 10px;
    margin: 100px; 
    padding: 20px; 
 }
 
 .image {
 	display: flex;
 	flex-direction: column;
 }
 
 .de {
 	position: relative;
 	left: -20px;
 	font-size: 20px;
 	font-weight: bold;
 	bottom: 10px;
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
    /* color: black; */
 }
 
 .actprice{
 	color: darkgrey;
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


<body>
   
<%@ include file="/header.jsp" %>  
	
	<% 
		UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
		
		List<ProductDetailDTO> product = (List<ProductDetailDTO>) request.getAttribute("productList");
		
		List<PriceEntity> price = (List<PriceEntity>) request.getAttribute("priceList");
			
			List<AddressEntity> address = (List<AddressEntity>) request.getAttribute("addressList");
		
			List<OrderEntity> order = (List<OrderEntity>) request.getAttribute("orderList");
	
	%>
	


    <div class="arrows">
        <div class="arrow">
            <a href="/tharasworldweb/index">
                <i class="fa-solid fa-arrow-left" title="Back"></i>
            </a>
        </div>
    </div>

    <section>
    
    <% if(order==null){ %>
    
    <div class="container">
        <p class="not">You have not ordered any products yet</p>
        <button class="add">ORDER NOW</button>
    </div>
    
    <% } else { %>
    
    <% 
		for (int i = 0; i < order.size(); i++) {
	 %>
    
    <div class="container">
    
    <div class="image">
    
         <%
     OrderStatus status = (OrderStatus) order.get(i).getOrderStatus(); // Replace with the actual attribute name
    Date currentDate = new Date();

    if (status == OrderStatus.CANCELLED) {
%>
        <span class="de">
            <i class="fa-sharp fa-solid fa-circle-xmark" style="font-size: 28px; color: red;"></i> CANCELLED
        </span>
<%
    } else if (status == OrderStatus.DELIVERED) {
%>
        <span class="de">
            <i class="fa fa-check-circle" style="font-size: 28px; color: green;"></i> DELIVERED
        </span>
<%
    } else if (status == OrderStatus.ON_THE_WAY) {
%>
        <span class="de">
        
            <i class="fa-solid fa-spinner" style="color: #1E3050;"></i> ON THE WAY
        </span>
<%
    } else {
%>
        <span class="de">
        
            <i class="fa-solid fa-spinner" style="color: #1E3050;"></i> WAITING LIST
        </span>
<%
    } 
%>
	
	<img src="<%= product.get(i).getImg() %>" alt="photo" style="height:200px; border-radius: 6px; width:200px;">
	
	</div>
	
	<div class="pdtDetails">
	
	<h3> <%= product.get(i).getName() %> </h3>
	
	<div class="price">
	
	<p> &#8377 <%= product.get(i).getListOfPrices().get(0).getCurrentPrice() %> </p>
	
	<s class="actprice"> &#8377 <%= product.get(i).getListOfPrices().get(0).getActualPrice() %> </s>
	
	<p class="discount"> <%= product.get(i).getListOfPrices().get(0).getDiscount() %> % off </p>
	
		</div>
	
	<div class="buttons">
	
        <a href="/tharasworldweb/ordered_products?order_id=<%= order.get(i).getOrderId() %>" >
        	<button class="view" data-cancel="your_order_id">VIEW PRODUCTS</button> </a>   
         
         <%
     OrderStatus cancelStatus = (OrderStatus) order.get(i).getOrderStatus(); // Replace with the actual attribute name

    if (cancelStatus == OrderStatus.CANCELLED) {
%>
        <button class="cancel" style="display: none" >CANCEL ORDER</button>
<%
    } else if (cancelStatus == OrderStatus.ON_THE_WAY || status == OrderStatus.WAITING_LIST) {
%>
	<a href="/tharasworldweb/cancel_order?order_id=<%= order.get(i).getOrderId() %>">
        <button class="cancel" style="display: block">CANCEL ORDER</button> </a>
<%
    } 
%> 
	
	
	</div>
	
	</div>
	
	<div class="userdetail">
	<strong>DELIVERY DETAILS :</strong>
	<p class="sel">Delivered to : <%= address.get(i).getName() %> </p>
                <p>Ordered on :  <%= order.get(i).getOrderedDate() %> </p>             
                <p>Phone number :  <%= order.get(i).getPhoneNumber() %> </p>
                <p>Address :  <%= address.get(i).getAddress() %> </p>
                <p>Pincode : <%= address.get(i).getPincode() %> </p>
                <p>State : <%= address.get(i).getState() %> </p>
                
                <% if(order.get(i).getOrderStatus() == OrderStatus.ON_THE_WAY){  %>
             
                <p style="display: block; font-weight: bold;"> Your order will be delivered with in 3 days! </p>
                
                <% } else { %>
                
                <p style="display: none;"> Your order will be delivered with in 3 days </p>
                
                <% } %>
	
	</div>
	
	</div>
	
	<% } } %>


    </section>
    <footer>
        <div class="top">
            <div class="about">
                <h4> About: </h4>
                <div class="us">
                    <p>
                        <a href="../homepage/aboutus.html"> About us </a>
                    </p>
                    <p>
                        <a href="#"> Available Products </a>
                    </p>
                    <p>
                        <a href="#"> Security </a>
                    </p>
                    <p>
                        <a href="../homepage/termsofuse.html"> Terms of use </a>
                    </p>
                    <p>
                        <a href="../homepage/return.html"> Return policy </a>
                    </p>
                </div>
            </div>

            <div class="line"></div>

            <div class="contact">

                <div class="socials">

                    <span class="con"> Contact us </span>

                    <div class="insta">

                        <i class="fa-brands fa-instagram" style="font-size:23px"></i>
                    </div>
                    <div class="fb">
                        <i class="fa-brands fa-facebook-f" style="font-size:23px"></i>
                    </div>
                    <div class="twiter">
                        <i class="fa-brands fa-twitter" style="font-size:23px"></i>
                    </div>
                    <div class="wa">
                        <i class="fa-brands fa-whatsapp" style="font-size:23px"></i>
                    </div>
                </div>
                <div>
                    <p>Copyrights@2022</p>
                </div>
            </div>
        </div>

    </footer>

</body>
</html>
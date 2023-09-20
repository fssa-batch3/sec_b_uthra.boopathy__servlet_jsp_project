<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="in.fssa.tharasworld.entity.OrderEntity"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> My orders page </title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/buynow_pdts.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        
<%@ include file="/header.jsp" %>  

<%

	OrderEntity order = (OrderEntity) request.getAttribute("order");

	ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetail");
	
	PriceEntity price = (PriceEntity) request.getAttribute("price");
	
	UserEntity user = (UserEntity) request.getAttribute("userDetails");
	
	UserEntity seller = (UserEntity) request.getAttribute("seller");

%>

        <section>

            <a href="#"> 
                <i class="fa-solid fa-xmark" style="color: red; font-size: 22px;" title="close"></i> 
            </a>

            <h2> PRODUCT LIST </h2>

        <div class = "div">
        
        <div class="details">
        <div>
            <img src="<%= product.getImg() %>" alt="check_name" id="image" height="220px" width="220px">
        </div>
        <div class="info">
            <h5 id="name"> <%= product.getName() %> </h5>
            <p class="price" id="original_price"> <%= price.getCurrentPrice() %> </p>
            <p class="qty">Quantity : <%= order.getQuantity() %> </p>
            <p class="qty">Total amount : <%= price.getCurrentPrice() *  order.getQuantity()%>  </p>
            <p class="qty">Seller Name : <%= seller.getName() %> </p>
            <p class="qty">Seller Phone number : <%= seller.getPhoneNumber() %> </p>
        </div>
    </div>

        </div>

        </section>
        
        <footer>
            <div class="top">
                <div class="about">
                    <h4> About: </h4>
                    <div class="us">
                        <p>
                            <a href="../homepage/aboutus.html"> About us  </a>
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
                                                    <p>Copy rights @ 2022</p>
                                                </div>
                                            </div>
         </div>
   
         </footer>    
   

</body>
</html>
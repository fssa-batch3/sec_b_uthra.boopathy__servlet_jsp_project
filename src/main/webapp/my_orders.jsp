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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style-myorderspage.css">
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
	
	<%  Set<OrderEntity> order = (Set<OrderEntity>) request.getAttribute("orderList"); 
		
		List<AddressEntity> address = (List<AddressEntity>) request.getAttribute("addressList");
	
	%>
	


    <div class="arrows">
        <div class="arrow">
            <a href="/tharasworldweb/index">
                <i class="fa-solid fa-arrow-left" title="Back"></i>
            </a>
        </div>
    </div>

    <section>
    
    
    <% 
    	List<OrderEntity> orderList = new ArrayList<>(order);
		for (int i = 0; i < orderList.size(); i++) {
	 %>
    
       <div class="container">
        <span class="de"> <%= orderList.get(i).getOrderStatus() %> <i class="fa-solid fa-spinner" style="color: #1E3050;"></i></span>
        <p class="pdt" data-id="your_order_id">No of Products :  1</p>
        <!-- <p class="id">Order ID : your_order_id</p> -->
        <div class="deliver">
            <div class="detail">
                <strong>DELIVERY DETAILS :</strong>
                <p class="sel">Delivered to : <%= address.get(i).getName() %> </p>
                <p>Ordered on :  <%= orderList.get(i).getOrderedDate() %> </p>
                <p>Delivered on : <%= orderList.get(i).getDeliveryDate() %> </p>
                <p>Phone number :  <%= orderList.get(i).getPhoneNumber() %> </p>
                <p>Address :  <%= address.get(i).getAddress() %> </p>
                <p>Pincode : <%= address.get(i).getPincode() %> </p>
                <p>State : <%= address.get(i).getState() %> </p>
            </div>
        </div>
        <button class="view" data-cancel="your_order_id">VIEW PRODUCTS</button>
<!--         Conditional button based on order status
        <button class="cancel" style="display: your_display_style" data-cancel="your_order_id">CANCEL ORDER</button> -->
    </div>
    
    <% } %>

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
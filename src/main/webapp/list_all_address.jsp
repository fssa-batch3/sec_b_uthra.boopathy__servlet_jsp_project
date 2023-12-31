<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Address page </title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/address.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    
    <body>
   
<%@ include file="/header.jsp" %> 

<%
		UserEntity user1 = (UserEntity) request.getAttribute("userDetails");

		List<AddressEntity> addressList = (List<AddressEntity>) request.getAttribute("addressList");
		
		AddressEntity address = (AddressEntity) request.getAttribute("defaultAddress");

		
		%>
		
				
		<% String errorMsg = (String) request.getAttribute("errorMessage"); %>


		<% if(errorMsg != null && user1!=null) { %>
		
		<script> alert("<%=errorMsg%>"); </script>
		
		<% } %>


       <div class="arrows">
        <!-- <div class="arrow">
            <a href="user/edit">
                <i class="fa-solid fa-arrow-left" title="Back"></i>
            </a>
        </div> -->
    </div>

        <a href="address/new">
         <button class="add"> ADD ADDRESS </button>
        </a>


		<% if(address != null) { %>
        
       <div class="container">
        <div class="address">
            <i class="fa-sharp fa-solid fa-location-dot" style="font-size: 25px; margin-top: 2rem; margin-left: 3rem" title="Location"></i>
            <h3>DEFAULT ADDRESS :</h3>
            <p id="name"> <%= address.getName() %> </p>
            <p id="address"> <%= address.getAddress() %> </p>
            <p id="code"> <%= address.getPincode() %> </p>
            <p id="states"> <%= address.getState() %> </p>
        </div>
    </div>
            
            <% } else {%>
            
            <div class="container">
        <div class="address">
            <i class="fa-sharp fa-solid fa-location-dot" style="font-size: 25px; margin-top: 2rem; margin-left: 3rem" title="Location"></i>
            <h3>DEFAULT ADDRESS :</h3>
            <p id="address"> You did not add any address as default </p>
        </div>
    </div>
    
    <% } %>

        <section>
        
       
        
         <% for(AddressEntity add : addressList) { %>
         
         
         <div class="add_card">
        <a href="address/edit?address_id=<%= add.getAddressId() %>">  <i id="edit" title="Edit" class="fa-solid fa-pencil" style="color: black; font-size: 18px; margin-top: 1rem; margin-left: 1rem; cursor: pointer;" data-id="your-address-id"></i> </a>
        <a href="address/delete?address_id=<%= add.getAddressId() %>"> <i id="remove" title="Remove" class="fa-solid fa-xmark" style="color: red; font-size: 18px; margin-top: 1rem; margin-left: 16rem; cursor: pointer;" data-id="your-address-id"></i> </a>
        <h6 class="heading">ADDRESS :</h6>
        <div class="detail">
            <p> <%= add.getName() %> </p>
            <p> <%= add.getAddress() %> </p>
            <p> <%= add.getPincode() %> </p>
            <p> <%= add.getState() %> </p>
        </div>
        
        
        <% if(address!=null){ 
        
        
        		if(address.getAddressId() == add.getAddressId()) { %>
    
        		<button class="set" data-id="your-address-id" style="width:200px;margin-left:70px;">DEFAULT ADDRESS</button>
 
				<% } else { %>
					<a href="address/set_as_default?address_id=<%= add.getAddressId() %>">
		    				<button class="set" data-id="your-address-id">SET AS DEFAULT</button>
		      		 </a>
				<% } %>
		
		<% } else { %>
        
        	<a href="address/set_as_default?address_id=<%= add.getAddressId() %>">
    				<button class="set" data-id="your-address-id">SET AS DEFAULT</button>
      		 </a>
		<% } %>
        
        <%-- <% if(address.isSetAsDefaultStatus()){ %>
        
        	<a href="address/set_as_default?address_id=<%= add.getAddressId() %>"> <button class="set" data-id="your-address-id"> DEFAULT ADDRESS </button> </a>
        
        <% } else { %>
        
				<button class="set" data-id="your-address-id"> SET AS DEFAULT </button> 
        
        <% } %> --%>
      
    </div>

 		<%} %>

    </section>

        <footer>
            <div class="top">
                <div class="about">
                    <h4> About: </h4>
                    <div class="us">
                        <p>
                          <a href=#> About us </a>
                        </p> 
                        <p>
                          <a href="#"> Available Products </a>
                        </p>
                        <p>
                          <a href="#"> Security </a>
                        </p> 
                        <p>
                          <a href="#"> Terms of use </a> 
                        </p> 
                        <p>
                          <a href="#"> Return policy </a>
                        </p> 
           </div>
          </div>

                                            <div class="line"></div>

                                            <div class="contact">  
                 
                                                <div class="socials">
                                                    <span class="con"> Contact us: </span>
                                                    <div class="insta">
                                                        <i class="fa-brands fa-instagram"></i> 
                                                    </div>
                                                    <div class="fb">
                                                        <i class="fa-brands fa-facebook-f"></i> 
                                                    </div>
                                                    <div class="twiter">
                                                        <i class="fa-brands fa-twitter"></i> 
                                                    </div>
                                                    <div class="wa">
                                                        <i class="fa-brands fa-whatsapp"></i> 
                                                    </div>
                                                </div>
                                                <div>
                                                    <p>Copy rights @ 2022</p>
                                                </div>
                                            </div> 
       </div>

       </footer>    
       
       
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
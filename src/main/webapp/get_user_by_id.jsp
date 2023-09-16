<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="java.util.*"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page isELIgnored = "false" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Profile page </title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
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
	
	                
                <%
		UserEntity user = (UserEntity) request.getAttribute("userDetails");
                
        AddressEntity address = (AddressEntity) request.getAttribute("address");

			if (user != null) {
		%>

        <div class="arrows"></div>

        <section>

            <form role="form">
            
                <h1> PROFILE</h1>

                <div class="avatar">
                    <img src="<%=request.getContextPath() %>/assets/images/avatar.jpg" alt="photo" height="180px" width="180px">
                </div>
               
                <div class="name">
                    <label> Name: </label>
                    <input type="text" id="uname" value="<%=user.getName() %>" disabled="true">
                </div>

                <div class="age">
                    <label> Age:</label>
                    <input type="number" id="age" value="<%=user.getAge()%>" disabled="true">
                </div>

                <div class="add">
                    <label> Residential address: </label>
                    <textarea id="address" disabled="true"><% if(address!=null){ %><%= address.getAddress() %> , <%= address.getPincode() %> , <%= address.getState() %><% } %></textarea>
                    </div>
                
                <div class="no">
                    <label> Contact number: </label>
                    <input type="number" id="phonenumber" value="<%=user.getPhoneNumber()%>" disabled="true">
                </div>

                <div class="mail">
                    <label> E-Mail Id: </label>
                    <input type="email" id="email" value="<%=user.getEmail()%>" disabled="true">
                </div>

                <div class="des">
                    <label> Your Designation:</label>
                   <input type="text" id="role" value="<%=user.getRole()%>" disabled="true">
                </div>
                
                <div >
                
                 	<a href="delete"><button class="btn-2" type="button"> Delete Account </button>
              
                    <a href="edit"> <button class="btn-1" type="button">   Edit  </button>  </a> 

                    <a href="/tharasworldweb/index"> <button class="btn-3" type="button">  Back </button> </a>

                </div> 
                
                	<%
	} else {
	%>
	<p>User not found.</p>
	<%
	}
	%>       

            </form>
       
        </section>

</body>
</html>

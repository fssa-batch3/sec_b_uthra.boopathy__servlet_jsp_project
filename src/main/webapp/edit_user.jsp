<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
        <title> Profile edit page </title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-profilepage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
   
   <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>
   
   
</head>
<body>
      
<%@ include file="/header.jsp" %>  

<%
	String error = (String) request.getAttribute("errorMessage");
	if (error != null && !("".equals(error))) {
	%>
	<script>
		Notify.error(
		`<%=error%>
		`);
	</script>

	<%
	}
	%>

<%
		UserEntity user1 = (UserEntity) request.getAttribute("editUser");

		AddressEntity address = (AddressEntity) request.getAttribute("address");
		
		%>
		
				
		<% String errorMsg = (String) request.getAttribute("errorMessage"); %>


		<% if(errorMsg != null && user1!=null) { %>
		
		<script> alert("<%=errorMsg%>"); </script>
		
		<script>
			doucument.getElementById("name").value = "<%= user1.getName()%>";
			doucument.getElementById("email").value = "<%= user1.getEmail()%>";
			doucument.getElementById("phonenumber").value = "<%= user1.getPhoneNumber()%>";
			doucument.getElementById("password").value = "<%= user1.getPassword()%>";
			doucument.getElementById("age").value = "<%= user1.getAge()%>";	
			
			if(address != null){}
			
	 		document.getElementById("address").value = "<%=address.getAddress() %>";
			document.getElementById("pincode").value = "<%= address.getPincode() %>";
			document.getElementById("state").value = "<%= address.getState() %>" 
		}
		</script>
		
		<% } %>

<section>

<form action="update" method = "post">
            
                <h1> PROFILE</h1>

                <div class="avatar">
                    <img src="<%=request.getContextPath() %>/assets/images/avatar.jpg" alt="photo" height="180px" width="180px">
                </div>
               
                <div class="name">
                    <label> Name: </label>
                    <input type="text" id="uname" name="name" value=<%= user1.getName() %>>
                </div>

                <div class="age">
                    <label> Age:</label>
                    <input type="tel" id="age" name="age" value=<%=user1.getAge()%> min="1" minlength="2" maxlength="3">
                </div>

                <div class="add">
                    <label> Residential address: </label>
                    <textarea id="address" disabled> <% if(address!=null){ %> <%=address.getAddress() %> <% } %> </textarea>         
                </div>

                <div class="pin">
                    <label> Pincode: </label>
                    <input type="number" id="pincode" name="pincode"  value="  <% if(address!=null){ %> <%= address.getPincode() %> <% } %>"  maxlength="6" disabled>  
                </div>

                <div class="state">
                    <label> State: </label>
                    <input type="text" id="state" value ="<% if(address!=null){ %><%= address.getState() %> <% } %>" disabled>  
                </div>
                
                <div class="no">
                    <label> Contact number: </label>
                    <input type="number" placeholder="+91" id="phonenumber" value=<%= user1.getPhoneNumber() %> disabled>
                </div>

                <div class="mail">
                    <label> E-Mail Id: </label>
                    <input type="email" id="email" placeholder="ghds4729@gmail.com" value=<%= user1.getEmail() %> pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{3,}$" disabled>
                </div>
                
                <div class="pass">
                    <label> Password: </label>
                    <input type="password" id="password" name="password" placeholder="**********" value=<%= user1.getPassword() %> pattern="*" >
                </div>
                
                <div class="form-group">
							<label class="showLabel"> <input type="checkbox"
								id="show"> Show Password
							</label>
						</div>

                 <div class="des">
                    <label> Your Designation:</label>
                    <input type="text" id="des" placeholder="Buyer" value=<%= user1.getRole() %> disabled>
                </div> 
                
                <div >
                  	 <a href="/tharasworldweb/user/details">  <button class="btn-1" type="submit">  Save  </button> </a>
                </div>        

            </form>

            <a href="/tharasworldweb/user/details">
                <button class="btn-2" type="submit">  Cancel </button>  
            </a>


			<a href="/tharasworldweb/address">
                <button class="btn-3" type="submit">  Add Address </button>  
            </a>

</section>

<script>
	 /* password show */
    const Password = document.querySelector("#password");
	const Checkbox = document.querySelector("#show");

	Checkbox.addEventListener("click", () => {
		const type =
			 Password.getAttribute("type") === "password" ? "text" : "password";
				Password.setAttribute("type", type);
});
	</script>

</body>
</html>
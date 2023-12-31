<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <title> Edit address page </title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/addressForm.css">
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
		
		AddressEntity address = (AddressEntity) request.getAttribute("editAddress");

		
		%>
		
				
		<% String errorMsg = (String) request.getAttribute("errorMessage"); %>


		<% if(errorMsg != null && user!=null) { %>
		
		<script> alert("<%=errorMsg%>"); 
		
		document.getElementById("uname").value = "<%= user.getName() %>";
        document.getElementById("address").value = "<%= address.getAddress() %>";
        document.getElementById("pincode").value = "<%= address.getPincode() %>";
        document.getElementById("state").value = "<%= address.getState() %>";
       
        </script>
		
				
		<% } %>

        <div class="arrows"></div>
<section>

    <h3> EDIT ADDRESS </h3>
    
    <form action="update" method="post">

        <div>
            <label> Name :  </label>
            <input type="text" id="uname" name="name" value="<%= address.getName() %>" required>
        </div>

        <div>
            <label class="ads"> Address : </label>
            <textarea id="address" name="address" required> <%= address.getAddress() %> </textarea>
        </div>

        <div>
            <label> Pincode : </label>
            <input type="number" id="pincode" name="pincode" value="<%= address.getPincode() %>" required>
        </div>

        <div>
            <label> State : </label>
            <input type="text" id="state" name="state" value="<%= address.getState() %>" required>
        </div>

        <a href="address">  <button type="submit"> SAVE ADDRESS </button>  </a>
        
        </form>

</section>


</body>
</html>
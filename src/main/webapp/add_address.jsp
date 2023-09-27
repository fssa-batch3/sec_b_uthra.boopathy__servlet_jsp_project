<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
        <title> Address page </title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/addressForm.css">
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

<div class="arrows"></div>

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
		UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
	%>

<!--         <div class="arrows">
        <div class="arrow">
            <a href="address">
                <i class="fa-solid fa-arrow-left" title="Back"></i>
            </a>
        </div>
    </div> -->
<section>

<form action="create" method="post">

    <h3> ADD ADDRESS </h3>

        <div>
            <label> Name :  </label>
            <input type="text" id="uname" name="name" pattern="^[a-zA-Z ]+$">
        </div>

        <div>
            <label class="ads"> Address : </label>
            <textarea id="address" name="address"> </textarea>
        </div>

        <div>
            <label> Pincode : </label>
            <input type="number" id="pincode" name="pincode">
        </div>

        <div>
            <label> State : </label>
            <input type="text" id="state" name="state" pattern="^[a-zA-Z ]+$">
        </div>

	<a href="/tharasworldweb/address">

        <button type="submit"> SAVE ADDRESS </button> </a>
        
        </form>

</section>


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
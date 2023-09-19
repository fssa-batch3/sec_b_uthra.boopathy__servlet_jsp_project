<%@page import="in.fssa.tharasworld.service.TypeService"%>
<%@page import="in.fssa.tharasworld.entity.TypeEntity"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
 <title> Add product page </title>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/addproduct.css">
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


<% String error = (String) request.getAttribute("errorMessage"); %>

<% if(error != null) { %>

<script> 

alert("<%=error%>");

</script>

<%} %>

<section>

    <div class="arrows"> </div>

    <form action="create" method = "post">

      <h2> ADD PRODUCTS </h2>

      <div class="box">

        <div class="photo" id="imgBox">
          <div class="camera">
            <!-- <input type="file" accept="image/*" name="image" id="image" style = "display: none" /> -->
            <label for="image" class="camera">
              <i class="fa fa-camera" style="color: #000;"></i>
            </label>
          </div>

        </div>

        <div class="details">

          <div>
            <label> Image url: </label>
            <br>
            <input type="url" id="image" name="img_url" placeholder="https://....." required>
          </div>

          <div>
            <label> Name of the product: </label>
            <br>
            <input type="text" id="name" name="name" placeholder="Abcde" required>
          </div>

          <div>
            <label> Tpye: </label>
            <select name="type" required>
			
				<option value=""> Select type </option>
					
				<% TypeService typeService = new TypeService();
				
				Set<TypeEntity> types = typeService.findAll(); 
				
				for( TypeEntity type : types ) { %>
				
				<option value="<%= type.getTypeId() %>" > <%= type.getTypeName() %> </option>
				
				<% } %>
			
			</select>

          </div>
          
          <br>
          			
			 <div>
           		 <label> Actual price : </label>
           		 <br>
           		 <input type="number" name="actual_price" placeholder="Rs." required>
         	</div>
         	
         	 <div>
           		 <label>  Discount : </label>
           		 <br>
           		  <input type="number" name="discount" placeholder="10 % off" required>
         	</div> 
          
           <div class="add">
            <label> Product details: </label>
            <br>
            <textarea id="product_detail" required> </textarea>
          </div>

          <div class="add_info">
            <label> Additional information: </label>
            <br>
            <textarea
              id="add_info">*Special PriceGet extra 30% off (price inclusive of cashback/coupon)T&C 
                                *Bank Offer5% Cashback on Thara's World Axis Bank CardT&C                  
                                *Partner OfferSign up for Thara's World Pay Later and get Thara's World Gift Card worth up to Rs.500 </textarea>
          </div>
          
                   <a href="product_list"> <button type="submit"> Submit </button> </a>

        </div>

      </div>

    </form>

  </section>

</body>
</html>
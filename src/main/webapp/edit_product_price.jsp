<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="in.fssa.tharasworld.entity.TypeEntity"%>
<%@page import="in.fssa.tharasworld.service.TypeService"%>
<%@page import="in.fssa.tharasworld.entity.ProductEntity"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Edit product detail</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/addproduct.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>


</head>
<body>

<%@ include file="/header.jsp" %>  

<div class="arrows"></div>

	<% 

		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("editProductPrice");
	
	%>
		
					
<%
	String error = (String) request.getAttribute("errorMessage");
	if (error != null && !("".equals(error))) {
	%>
	<script>
		Notify.error(
		`<%=error%>
		`);
	</script>
		
		<script>
			doucument.getElementById("image").value = "<%= product.getImg()%>";
			doucument.getElementById("name").value = "<%= product.getName()%>";
			
			 <% TypeService typeService = new TypeService();
	           TypeEntity typeName = typeService.findByTypeId(product.getTypeId()); %>
			
			doucument.getElementById("type").value = "<%= typeName.getTypeName()%>";
			
		    <%
	        List<PriceEntity> prices = product.getListOfPrices();
	        PriceEntity price = prices.get(0);
	    %>
			
			doucument.getElementById("actual_price").value = "<%= price.getActualPrice()%>";
			doucument.getElementById("current_price").value = "<%= price.getCurrentPrice()%>";
			doucument.getElementById("discount").value = "<%= price.getDiscount()%>";
			doucument.getElementById("description").value = "<%= product.getDescription()%>";
		</script>
		
		<% } %>
		
		
		
		
		<section>

  <!--   <div class="arrows"> </div> -->

   <form action="update_price?pdt_id=<%= product.getPdtId() %>" method="post">

      <h2> Edit PRODUCT PRICE </h2>

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
            <input type="url" id="image" name="img_url" disabled value="<%= product.getImg() %>"> 
          </div>
	
	 <div>
            <label> Name of the product: </label>
            <br>
           <input type="text" id="name" name="name" disabled value="<%= product.getName() %>">
          </div>

          <div>
            <label> Tpye: </label>
           <select name="type" id="type">
        <% TypeService typeService = new TypeService();
           TypeEntity typeName = typeService.findByTypeId(product.getTypeId()); %>
        <option value="<%= product.getTypeId() %>"> <%= typeName.getTypeName() %> </option>
        
    </select>

<%
        List<PriceEntity> prices = product.getListOfPrices();
        PriceEntity price = prices.get(0);
    %>
   
          </div>
          
          <br>
          			
			 <div>
           		 <label> Actual price : </label>
           		 <br>
           		 <input type="number" id="actual_price" name="actual_price" required value="<%= price.getActualPrice() %>">
         	</div>
         	
         	 <div>
           		 <label>  Discount : </label>
           		 <br>
           		 <input type="number" id="discount" name="discount" required value="<%= price.getDiscount() %>">
         	</div> 
          
           <div class="add">
            <label> Product details: </label>
            <br>
            <textarea rows="5" id="description" name="description" disabled><%= product.getDescription() %></textarea>
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
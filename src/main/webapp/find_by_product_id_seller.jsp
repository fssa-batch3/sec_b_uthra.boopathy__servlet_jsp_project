<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title> List products by seller id </title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-saree1view.css">

</head>
<body>

	<%@ include file="/header.jsp" %> 
	
	<div class="arrows"></div>
	
	<%
		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetails");
		
			if (product != null) {
		%>
		
		<div class="detail">
		
		<div class="left">
    <div class="image">
        <img src="<%= product.getImg() %>" alt="ProductName image" height="460px" width="400px">
    </div>
</div>

<div class="right">
    <h3 id="name"> <%=product.getName()%> </h3>
    <h4>Special price</h4>
	
	<% List<PriceEntity> price = product.getListOfPrices(); %>
    <div class="price">
        <p id="original_price">&#8377 <%= (int) Math.round(price.get(0).getCurrentPrice())%></p>
        <p>
            <s id="discount_price">&#8377 <%= (int) Math.round(price.get(0).getActualPrice())%> </s>
        </p>
        <p>
            <b id="discount_percent"><%= (int) Math.round(price.get(0).getDiscount())%>% off</b>
        </p>
    </div>

    <strong>Product details:</strong>

    <div class="para">
        <p id="product_detail"> <%= product.getDescription() %> </p>
    </div>
    
    <strong class="paras">Additional offers</strong>
   
    <div class="paras">
        <p id="add_info"> &#8277 Special PriceGet extra 30% off (price inclusive of cash back / coupon)T&C </p>
		<p> &#8277 Bank Offer5% Cash back on Thara's World Axis Bank CardT&C </p>
		<p> &#8277Partner OfferSign up for Thara's World Pay Later and get Thara's World Gift Card worth up to Rs. 500</p>
    </div>
    
   <a href="edit_pdt_detail?pdt_id=<%= product.getPdtId() %>"> <button class="add" data-add="product_uuid">Edit Product detail  
   <i class="fa-solid fa-pen-to-square"></i>  </button> </a>
       
   <a href="edit_pdt_price?pdt_id=<%= product.getPdtId() %>"> <button class="buy">Edit Price 
   <i class="fa-solid fa-pen-to-square"></i>  </button> </a>
   
   <a href="delete?pdt_id=<%= product.getPdtId() %>"> <button class="wish" id="delete"> Delete 
    <i class="fa-solid fa-trash"  style="color:white; 
	position: relative;left: 0.5rem; font-size: 20px; "></i>  </button> </a>
    
    
</div>
		
		
		</div>
		
		<%
	} else {
	%>
	<p>Product not found.</p>
	<%
	}
	%>

                <script>

    const delBtn = document.getElementById("delete");
    
    delBtn.addEventListener("click", function(event){
    	
    	const confirmation = confirm("Are you sure to delete this product?");
    	
    	if (!confirmation) {
	        event.preventDefault();
	    }
    	
    });
    
	</script>

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
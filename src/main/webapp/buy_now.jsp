<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy now page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/cart-buynowpage.css">
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


	<%@ include file="/header.jsp"%>
	
	<div class="arrows"></div>

	<%
	ProductDetailDTO pdt = (ProductDetailDTO) request.getAttribute("productDetails");

	AddressEntity address = (AddressEntity) request.getAttribute("address");

	UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
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

	<%
	}
	%>

	<div class="left">
		<div class="images">
			<img src="<%=pdt.getImg()%>" id="image" alt="photo" height="460px"
				width="400px">
		</div>

	</div>

	<div class="right">
		<h3 id="name">
			<%=pdt.getName()%>
		</h3>
		<p>
			<strong id="discount_price"> &#8377 <%=(int) Math.round(pdt.getListOfPrices().get(0).getCurrentPrice())%>
			</strong> <s id="original_price"> &#8377 <%=(int) Math.round(pdt.getListOfPrices().get(0).getActualPrice())%></s> 
			<b id="discount_percent"> <%= (int) Math.round(pdt.getListOfPrices().get(0).getDiscount())%>% off </b>
		</p>

		<h2 class="per">PERSONAL DETAILS</h2>

		<form action="buy_now" method="post">

			<div class="name">
				<label> Name: </label> <input type="text" id="uname" name="name"
					value="<%if (address != null) {%><%=address.getName()%> <%}%>"
					disabled="true">
			</div>

			<div class="add">
				<label> Address: </label>
				<textarea id="address" name="address" disabled="true"> <%
 if (address != null) {
 %> <%=address.getAddress()%> <%=address.getPincode()%> <%=address.getState()%>
					<%
					}
					%> </textarea>
			</div>

			<div class="no">
				<label> Phone number: </label> <input type="tel" id="phonenumber"
					name="phoneNumber" value="<%=user1.getPhoneNumber()%>"
					required="true" placeholder="+91" pattern="[6-9]\d{9}" maxlength="10">
			</div>

			<div class="quantity">
				<label> Quantity: </label> <input type="number"
					id="product_quantity" name="quantity" required="true"
					placeholder="1" value="1" min="1" max="10">
			</div>

			<div class="cash">
				<label> Payment: </label> <input type="text" id="payment"
					name="payment" value="Cash on delivery" disabled="true">
				<!-- <select id="payment" required> 
                    <option value="cash_on_delivery"> Cash on delivery </option>
                </select> -->
			</div>

			<input type="hidden" name="priceId"
				value="<%=pdt.getListOfPrices().get(0).getPriceId()%>" /> <input
				type="hidden" name="addressId"
				value="<%if (address != null) {%><%=address.getAddressId()%><%}%>" />

			<input type="hidden" name="sellerId" value="<%=pdt.getSellerId()%>" />

			<button class="place" type="submit">PLACE ORDER</button>

		</form>

		<a href="/tharasworldweb/address">
			<button class="change" type="submit">Change address</button>
		</a>

	</div>

	<footer>
		<div class="top">
			<div class="about">
				<h4>About:</h4>
				<div class="us">
					<p>
						<a href="#"> About us </a>
					</p>
					<p>
						<a href="/tharasworldweb/index"> Available Products </a>
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
					<span class="con"> Contact us </span>
					<div class="insta">
						<i class="fa-brands fa-instagram" style="font-size: 23px"></i>
					</div>
					<div class="fb">
						<i class="fa-brands fa-facebook-f" style="font-size: 23px"></i>
					</div>
					<div class="twiter">
						<i class="fa-brands fa-twitter" style="font-size: 23px"></i>
					</div>
					<div class="wa">
						<i class="fa-brands fa-whatsapp" style="font-size: 23px"></i>
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
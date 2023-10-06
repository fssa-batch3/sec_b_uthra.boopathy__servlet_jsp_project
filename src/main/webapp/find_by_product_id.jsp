<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
   

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-saree1view.css">

<title> Product detail </title>

</head>
<body>

	<%@ include file="/header.jsp" %> 
	
	<div class="arrows"></div>
	
	<%
		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetails");
	
		UserEntity user1 = (UserEntity) request.getAttribute("userDetails");
		
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
        <p id="original_price">&#8377 <%=(int) Math.round(price.get(0).getCurrentPrice())%></p>
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
    
     <button class="add" data-add="product_uuid">ADD TO CART
        <i class="fa fa-shopping-cart" style="font-size:24px;color:white;"></i>
    </button> 
    
    <a href="/tharasworldweb/products/buy_now?pdt_id=<%= product.getPdtId() %>">
    
    <button class="buy">BUY NOW
        <i class="fa fa-shopping-bag" style="font-size:24px;color:white;"></i>
    </button>
    
    </a>
    
   <button class="wish">WISHLIST
        <i class="fa fa-heart" style="font-size:24px;color:white;"></i>
    </button> 
    
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
	
	//// add to cart
	
	
    const cart_products = document.querySelector("button.add");
    
    <% HttpSession session3 = request.getSession(); %>
    <% Integer userId = (Integer) session3.getAttribute("userId"); %>
    
    cart_products.addEventListener("click", () => {
        <% if (userId == null) { %>
            alert("You are not logged in");
            console.log("add to cart array");
            
        <% } else { %>
            
        let user_id = <%= userId.intValue()%>;
        
        <% if(userId.intValue() == product.getSellerId()){ %>
        
        alert("Seller and buyer cannot be the same person");
        
        <% } else { %>
        
        
            let add_to_cart = JSON.parse(localStorage.getItem("cart")) || [];
            console.log(add_to_cart);
            let id = <%= product.getListOfPrices().get(0).getPriceId() %>;
            
            const exist =
                add_to_cart.length &&
                JSON.parse(localStorage.getItem("cart")).some(
                    (data) => data.price_id == id && data.buyer_id == user_id 
                );
            
            if (exist) {
                alert("This product has already been added");
            } else {
                alert("This product is added to your cart.");
                
                let productName = '<%= product.getName() %>';
                let imageUrl = '<%= product.getImg() %>';
                
                add_to_cart.push({
                    product_quantity: 1,
                    seller_id: <%= product.getSellerId() %>,
                    buyer_id: user_id,
                    product_name: productName,
                    product_image: imageUrl,
                    price_id: <%= product.getListOfPrices().get(0).getPriceId() %>,
                    actual_price: <%= product.getListOfPrices().get(0).getActualPrice() %>,
                    current_price: <%= product.getListOfPrices().get(0).getCurrentPrice() %>,
                    discount: <%= product.getListOfPrices().get(0).getDiscount() %>
                });
                
                const cart_count = add_to_cart.filter((pdt) => pdt.buyer_id == user_id).length;
                console.log(cart_count);

                localStorage.setItem("cart", JSON.stringify(add_to_cart));
                
                localStorage.setItem("cart_count", JSON.stringify(cart_count));

                
                window.location.reload();
            }
            
            <%} } %>

    });
    
    
    
    /////  wishlist
    
    
   const wishlist_products = document.querySelector("button.wish");
    
    <% Integer userid = (Integer) session3.getAttribute("userId"); %>
    
    wishlist_products.addEventListener("click", () => {
        <% if (userid == null) { %>
            alert("You are not logged in");
            console.log("add to cart array");
            
        <% } else { %>
            
        let user_id = <%= userId.intValue()%>;
        
        <% if(userId.intValue() == product.getSellerId()){ %>
        
        alert("Seller and buyer cannot be the same person");
        
        <% } else { %>


        let wishlist = JSON.parse(localStorage.getItem("wishlist")) || [];
        console.log(wishlist);
        let id = <%= product.getListOfPrices().get(0).getPriceId() %>;
        
        const exist =
        	wishlist.length &&
            JSON.parse(localStorage.getItem("wishlist")).some(
                (data) => data.price_id == id && data.buyer_id == user_id 
            );
        
        if (exist) {
            alert("This product has already been added");
        } else {
            alert("This product is added to your wishlist.");

        let productName = '<%= product.getName() %>';
        let imageUrl = '<%= product.getImg() %>';

        wishlist.push({
            product_quantity: 1,
            seller_id: <%= product.getSellerId() %>,
            buyer_id: user_id,
            product_name: productName,
            product_image: imageUrl,
            price_id: <%= product.getListOfPrices().get(0).getPriceId() %>,
            actual_price: <%= product.getListOfPrices().get(0).getActualPrice() %>,
            current_price: <%= product.getListOfPrices().get(0).getCurrentPrice() %>,
            discount: <%= product.getListOfPrices().get(0).getDiscount() %>,
        });

        localStorage.setItem("wishlist", JSON.stringify(wishlist));

        console.log(JSON.parse(localStorage.getItem("wishlist")));

        window.location.reload();
    }

    <% } } %>
});


    
    
    
</script>
	
</body>
</html>
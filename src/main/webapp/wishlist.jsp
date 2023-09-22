<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Wishlist page</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/style-wishlistpage.css">
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
</head>

<body>

	<%@ include file="/header.jsp"%>

	<!-- <div class="arrows"></div> -->

	<section>
		<div class="thumbnail"></div>

	</section>

	<footer>
		<div class="top">
			<div class="about">
				<h4>About:</h4>
				<div class="us">
					<p>
						<a href="../homepage/aboutus.html"> About us </a>
					</p>
					<p>
						<a href="#"> Available Products </a>
					</p>
					<p>
						<a href="#"> Security </a>
					</p>
					<p>
						<a href="../homepage/termsofuse.html"> Terms of use </a>
					</p>
					<p>
						<a href="../homepage/return.html"> Return policy </a>
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
				/* 
				const div_arrow = document.createElement("div");
				div_arrow.setAttribute("class", "arrow");
				//console.log(div_arrow);
				
				//<a> link </a>
				
				const a_arrow = document.createElement("a");
				a_arrow.setAttribute("href", "#");
				div_arrow.append(a_arrow);
				//console.log(a_arrow);
				
				//< i >  arrow </i>
				
				const i_arrow = document.createElement("i");
				i_arrow.setAttribute("title", "Back");
				i_arrow.setAttribute("class", "fa-solid fa-arrow-left");
				a_arrow.append(i_arrow);
				
				document.querySelector("div.arrows").append(div_arrow); */
				
				<%HttpSession session3 = request.getSession();%>
				<%Integer userId = (Integer) session3.getAttribute("userId");%>
				
				let user_id = <%=userId.intValue()%>;
				
				
				const wishlist_products = JSON.parse(localStorage.getItem("wishlist"));
				console.log(wishlist_products);
				
				if(wishlist_products!=null){
				
					const check_pdt = wishlist_products.filter((e) => e.buyer_id == user_id);
				
				if (check_pdt.length == 0) {
				
				//<div class = products >
				
				const div_container = document.createElement("div");
				div_container.setAttribute("class", "container");
				
				const h3_title = document.createElement("h3");
				h3_title.setAttribute("class", "not");
				h3_title.innerText = "You have not added any products yet";
				div_container.append(h3_title);
				
				const button = document.createElement("button");
				button.setAttribute("class", "add");
				button.innerText = "ADD PRODUCTS";
				div_container.append(button);
				
				document.querySelector("section").append(div_container);
				
				
				// order products
				
				document.querySelector("button.add").addEventListener("click",() => {
				window.location.href = "/tharasworldweb/productlist.jsp";
				})
				 
				
				}  else {
				
				for (let j = 0; j < check_pdt.length; j++) {
				
				
				// <div class = products >
				
				const div_products = document.createElement("div");
				div_products.setAttribute("class", "products");
				console.log(div_products);
				
				// <span class = "del" > </div>
				
				const span_del = document.createElement("span");
				span_del.setAttribute("class", "del");
				div_products.append(span_del);
				
				// <i> </i>
				
				const i_del = document.createElement("i");
				i_del.setAttribute("id", "del");
				i_del.setAttribute("data-del", check_pdt[j].price_id);
				i_del.setAttribute("class", "fa-solid fa-trash-can");
				i_del.setAttribute("style", "font-size:24px;color:red;");
				span_del.append(i_del);
				
				const i_cart = document.createElement("i");
				i_cart.setAttribute("id", "cart");
				i_cart.setAttribute("data-del", check_pdt[j].price_id);
				i_cart.setAttribute("class", "fa-sharp fa-solid fa-cart-shopping");
				i_cart.setAttribute("style", "font-size:24px;color:purple;");
				span_del.append(i_cart);
				
				// <img>
				
				const img = document.createElement("img");
				img.setAttribute("src", check_pdt[j].product_image);
				img.setAttribute("alt", "photo");
				img.setAttribute("height", "200px");
				img.setAttribute("width", "180px");
				img.setAttribute("data-id", check_pdt[j].price_id);
				div_products.append(img);
				
				// <h3> </h3>
				
				const h3_title = document.createElement("h3");
				h3_title.setAttribute("id", "name");
				h3_title.innerText = check_pdt[j].product_name;
				div_products.append(h3_title);
				
				// <p> </p>
				
				const p_org = document.createElement("p");
				p_org.setAttribute("id", "original_price");
				p_org.innerText = check_pdt[j].current_price;
				h3_title.append(p_org);
				
				// <p> </p>
				
				p_dis = document.createElement("p");
				h3_title.append(p_dis);
				
				// <s> </s>
				
				const s = document.createElement("s");
				s.setAttribute("id", "discount_price");
				s.innerText = check_pdt[j].actual_price;
				p_org.append(s);
				
				// <span> </span>
				
				const span = document.createElement("span");
				span.setAttribute("class", "percent");
				span.innerText = check_pdt[j].discount;
				p_org.append(span);
				
				document.querySelector("div.thumbnail").append(div_products);
				}
				} 
				} else {
		        	
		        	
		        	const div_container = document.createElement("div");
		      	  div_container.setAttribute("class", "contain");

		      	  // <div class="details"></div>

		      	  const div_details = document.createElement("div");
		      	  div_details.setAttribute("class", "details");
		      	  div_container.append(div_details);

		      	  const h3_title = document.createElement("h3");
		      	  h3_title.setAttribute("class", "not");
		      	  h3_title.innerText = "You have not added any products yet";
		      	  div_details.append(h3_title);

		      	  const button = document.createElement("button");
		      	  button.setAttribute("class", "add");
		      	  button.innerText = "ADD PRODUCTS";
		      	  div_container.append(button);

		      	  document.querySelector("section").append(div_container);

		      	  // add products

		      	document.querySelector("button.add").addEventListener("click",() => {
		      	  window.location.href = "/tharasworldweb/productlist.jsp";
		      	})
		        	
		        }
				
				
				/// delete
				
				
				const products = document.querySelectorAll("#del");
  products.forEach((checking) => {
    checking.addEventListener("click", (e) => {
      const price_id = e.currentTarget.dataset.del;
      localStorage.setItem("price_id", JSON.stringify(price_id));
      console.log(price_id);
      if (window.confirm("Are you sure to remove this product?")) {
        const id = JSON.parse(localStorage.getItem("price_id"));
        const all_products = JSON.parse(localStorage.getItem("wishlist"));
        console.log(all_products);
        const pdts = all_products.find(
          (f) => f.price_id == id && f.buyer_id == user_id
        );

        console.log(pdts);
        const indexOfProduct = all_products.indexOf(pdts);
        
        console.log(indexOfProduct);
        
        all_products.splice(indexOfProduct, 1); 
        console.log(indexOfProduct);
        localStorage.setItem("wishlist", JSON.stringify(all_products));
      }

      window.location.reload();
    });
  });
  
  
  /// move to cart
  
  
   const product = document.querySelectorAll("#cart");
 	
  product.forEach((checking) => {
    
	  checking.addEventListener("click", (e) => {
    
		  const price_id = e.currentTarget.dataset.del;
      
		  localStorage.setItem("price_id", JSON.stringify(price_id));
      
		  console.log(price_id);
        
		  const id = JSON.parse(localStorage.getItem("price_id"));
        
		  const all_products = JSON.parse(localStorage.getItem("wishlist"));
        
		  console.log(all_products);
        
		  const pdts = all_products.find(
          		(g) => g.price_id == id && g.buyer_id == user_id
           );
       
		  console.log(pdts);
        
		  const indexOfProduct = all_products.indexOf(pdts);
        
		  const cart_products = JSON.parse(localStorage.getItem("cart")) || [];
        
		  const check_cart = cart_products.find((o) => o.price_id == id);
        
		  if(check_cart) {
          alert("You have already added this product to your cart.");
        
		  } else {
          if(window.confirm("Are you sure to move this product to your cart ?")) {
            
        	  all_products.splice(indexOfProduct, 1);
            
        	  console.log(indexOfProduct);
            
        	  cart_products.push(pdts);
            
        	  localStorage.setItem("cart", JSON.stringify(cart_products));
            
        	  localStorage.setItem("wishlist", JSON.stringify(all_products));

            window.location.reload();
          }
        }

    });
  });
		
		</script>

</body>
</html>
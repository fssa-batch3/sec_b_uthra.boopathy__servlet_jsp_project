<%@page import="in.fssa.tharasworld.service.ProductService"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title> Add to cart page </title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style-cartpage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    
    <body>
 
	<%@ include file="/header.jsp" %> 

        <div class="arrows">
      
        </div>
        
       

        <section>
        

        </section>

        <footer>
            <div class="top">
                <div class="about">
                    <h4> About: </h4>
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
                                                    <span class="con"> Contact us: </span>
                                                    <div class="insta">
                                                        <i class="fa-brands fa-instagram"></i> 
                                                    </div>
                                                    <div class="fb">
                                                        <i class="fa-brands fa-facebook-f"></i> 
                                                    </div>
                                                    <div class="twiter">
                                                        <i class="fa-brands fa-twitter"></i> 
                                                    </div>
                                                    <div class="wa">
                                                        <i class="fa-brands fa-whatsapp"></i> 
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
        
        <% HttpSession session3 = request.getSession(); %>
        <% Integer userId = (Integer) session3.getAttribute("userId"); %>
        
        let user_id = <%= userId.intValue() %>;
        
        const add_to_cart = JSON.parse(localStorage.getItem("cart")) || [];
       
        const check_pdt = add_to_cart.filter((e) => e.buyer_id == user_id);
        
     /*    if (check_pdt.length == 0) {

        	  // <div class = products >
				
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
	

        	  // add products

        	document.querySelector("button.add").addEventListener("click",() => {
        	  window.location.href = "/tharasworldweb/category_list";
        	});

        	}  else { */

        		for (let k = 0; k < check_pdt.length; k++) {

        		  // <div class = products >

        		  const div_container = document.createElement("div");
        		  div_container.setAttribute("class", "container");

        		  // <img>

        		  const img = document.createElement("img");
        		  img.setAttribute("src", check_pdt[k].product_image);
        		  img.setAttribute("alt", "photo");
        		  img.setAttribute("height", "200px");
        		  img.setAttribute("width", "180px");
        		  div_container.append(img);

        		  // <div class="details"></div>

        		  const div_details = document.createElement("div");
        		  div_details.setAttribute("class", "details");
        		  div_container.append(div_details);

        		  // <h3> </h3>

        		  const h3_title = document.createElement("h3");
        		  h3_title.setAttribute("id", "name");
        		  h3_title.innerText = check_pdt[k].product_name;
        		  div_details.append(h3_title);

        		  // <div> </div>

        		  const div = document.createElement("div");
        		  h3_title.append(div);

        		  // <p> </p>

        		  const p_org = document.createElement("p");
        		  p_org.setAttribute("id", "original_price");
        		  p_org.innerText = '\u20B9' +  Math.round(check_pdt[k].current_price);
        		  div.append(p_org);

        		  // <s> </s>

        		  const s = document.createElement("s");
        		  s.setAttribute("id", "discount_price");
        		  s.innerText = '\u20B9' + Math.round(check_pdt[k].actual_price);
        		  div.append(s);

        		  // <span> </span>

        		  const span = document.createElement("span");
        		  span.setAttribute("class", "percent");
        		  span.innerText = Math.round(check_pdt[k].discount)+"%ff";
        		  div.append(span);

        		  // < div class = "quantity" > </div>

        		  const div_quantity = document.createElement("div");
        		  div.append(div_quantity);

        		  // <p> </p>

        		  const p_qty = document.createElement("p");
        		  // p_qty.setAttribute("class", "quantities");
        		  p_qty.innerText = "Quantity  ";
        		  div.append(p_qty);

        		  // <input>

        		  const input = document.createElement("input");
        		  input.setAttribute("class", "quantity");
        		  input.setAttribute("type", "number");
        		  input.setAttribute("value", check_pdt[k].product_quantity);
        		  input.setAttribute("id", "product_quantity");
        		  input.setAttribute("min", "1");
        		  input.setAttribute("max", "10");
        		  input.setAttribute("data-remove", check_pdt[k].price_id);
        		  input.setAttribute("data-size", check_pdt[k].current_price)
        		  p_qty.append(input);

        		  // < button class = "remove" > </button>

        		  const button_remove = document.createElement("button");
        		  button_remove.setAttribute("class", "remove");
        		  button_remove.setAttribute("data-remove", check_pdt[k].price_id);
        		  button_remove.setAttribute("type", "submit");
        		  button_remove.innerText = "REMOVE";
        		  div_container.append(button_remove);

        		  const button_wish = document.createElement("button");
        		  button_wish.setAttribute("class", "wish");
        		  button_wish.setAttribute("data-remove", check_pdt[k].price_id);
        		  button_wish.setAttribute("type", "submit");
        		  button_wish.innerText = "WISHLIST";
        		  div_container.append(button_wish); 

        		  document.querySelector("section").append(div_container);
        		}
 
        		/* } */
        
        
        //// summary create element

        let total = 0;

     /*    const check_pdt = add_to_cart.filter((e) => e.buyer_id == user_id);
        console.log(check_pdt); */
        
        for (let l = 0; l < check_pdt.length; l++) {
          total += check_pdt[l].current_price * check_pdt[l].product_quantity;
        }

        console.log(total);

         if (check_pdt.length <= 0) {
        	// <div class = products >

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
      	  window.location.href = "/tharasworldweb/category_list";
      	})
        }
        else { 
          const div_total = document.createElement("div");
          div_total.setAttribute("class", "total");
          
        const div = document.createElement("div");
        div.setAttribute("class", "sum");
        div_total.append(div)

        const summary = document.createElement("p");
        summary.innerText = "SUMMARY :";
        div.append(summary);

        // <div>

        const div_price = document.createElement("div");
        div_price.setAttribute("class", "sub");
        div_total.append(div_price);

        // <p>

        const p_sub = document.createElement("p");
        p_sub.innerText = "SUB TOTAL :";
        div_price.append(p_sub);

        // <p>

        const p_del = document.createElement("p");
        p_del.innerText = "DELIVERY CHARGE :";
        p_sub.append(p_del);

        // <p>

        const p_t_a = document.createElement("p");
        p_t_a.innerText = "TOTAL AMOUNT :";
        p_del.append(p_t_a);

        //  <div> <div>

        const div_amt = document.createElement("div");
        div_amt.setAttribute("class", "amt");
        div_total.append(div_amt);

        // <p>

        let p_amt = document.createElement("p");
        p_amt.innerText = '\u20B9' + Math.round(total);
        div_amt.append(p_amt);

        // <p>

        const p_free = document.createElement("p");
        p_free.innerText = "FREE";
        p_amt.append(p_free);

        // <p>

        p_amt = document.createElement("p");
        p_amt.setAttribute("class", "total_amt");
        p_amt.innerText = '\u20B9' + Math.round(total);
        p_free.append(p_amt);

        // <div>

        const div_btn = document.createElement("div");
        div_total.append(div_btn);

        // < button class = "buy" > </button>

        const button_buy = document.createElement("button");
        button_buy.setAttribute("class", "buy");
        button_buy.innerText = "BUY NOW";
        div_btn.append(button_buy);

        document.querySelector("section").append(div_total);
        
        
        document.querySelector("button.buy").addEventListener("click",() => {
        	
        	  window.location.href = "/tharasworldweb/cart_buynow.jsp";
        	});   
               
        
        }
        
    /////    QUANTITY INCREASE OR DECREASE FUNCTION   //////


        const product_quantity = document.querySelectorAll(".quantity");

        product_quantity.forEach((add) => {
          add.addEventListener("change", (e) => {
            
        	const priceId = e.currentTarget.dataset.remove;

            localStorage.setItem("price_id", JSON.stringify(priceId));

            const priceid = JSON.parse(localStorage.getItem("price_id"));
			console.log(priceid);
            
            /* const all_products = JSON.parse(localStorage.getItem("cart"));
            console.log(all_products); */

            const parent = e.currentTarget.closest(".container");

            const qauntity = parent.querySelector(".quantity").value;

            if (qauntity > 11) {
              
              alert("Only 10 items can be ordered at a time.");
            
            } else if(qauntity == 0){
            	alert("Invalid quantity.");
            } else if (qauntity < 0) {
            	alert("Invalid quantity.")
            }

            else {

             /*  const size_0f_pdt = parent.querySelector(".size").innerText;
            console.log(size_0f_pdt);

            
            const parts = size_0f_pdt.split(":");

            const key = parts[0].trim();
          const value = parts[1].trim();   */

          const all_products = JSON.parse(localStorage.getItem("cart"));
          console.log(all_products);
          
          console.log(priceid);
          console.log(user_id);
          
             const pdts = all_products.find(
              (a) => a.price_id == priceid && a.buyer_id == user_id 
            );
            console.log(pdts); 

            let ogPrice = pdts.current_price;

            const cartPrice = ogPrice * qauntity;

            ogPrice = cartPrice;

            pdts.product_quantity = qauntity;

            localStorage.setItem("cart", JSON.stringify(all_products));

            window.location.reload();

            }

          });
        });

        /// remove product

        
        const products = document.querySelectorAll("button.remove");

        products.forEach((check) => {
          check.addEventListener("click", (e) => {
            const price_id = e.currentTarget.dataset.remove;

            localStorage.setItem("price_id", JSON.stringify(price_id));

            if (window.confirm("Are you sure to remove this product?")) {
             
            	const id = JSON.parse(localStorage.getItem("price_id"));

              const all_products = JSON.parse(localStorage.getItem("cart"));

              const pdts = all_products.find(
                (f) => f.product_id == id && f.buyer_id == user_id
              );
              
              console.log(pdts);

              const indexOfProduct = all_products.indexOf(pdts);
              
              console.log(indexOfProduct);

              all_products.splice(indexOfProduct, 1); 

              const cart_count = JSON.parse(localStorage.getItem("cart_count"));

              const cart_length = cart_count-1;

              localStorage.setItem("cart_count", JSON.stringify(cart_length));

              localStorage.setItem("cart", JSON.stringify(all_products));
            }

            window.location.reload();
          });
        });
        
        
        ///// move to wish list
        
        
        const product = document.querySelectorAll("button.wish");

product.forEach((check) => {
  check.addEventListener("click", (e) => {
    const price_id = e.currentTarget.dataset.remove;
    console.log(price_id);

    localStorage.setItem("price_id", JSON.stringify(price_id));

      const id = JSON.parse(localStorage.getItem("price_id"));
      console.log(id);

      const all_products = JSON.parse(localStorage.getItem("cart"));

      const pdts = all_products.find(
        (g) => g.product_id == id && g.buyer_id == user_id
      );

      const indexOfProduct = all_products.indexOf(pdts);

      const wish_products = JSON.parse(localStorage.getItem("wishlist")) || [];

      const check_wish = wish_products.find((o) => o.price_id == id);
      console.log(check_wish);

      if(check_wish) {

        alert("You already added this product to your wishlist.")

      } else {

        if (window.confirm ("Are you sure to move this product to wishlist ?")) {

          all_products.splice(indexOfProduct, 1);

          wish_products.push(pdts); 

          localStorage.setItem("wishlist", JSON.stringify(wish_products));

          localStorage.setItem("cart", JSON.stringify(all_products));

          window.location.reload();

        }

      }
    
    });
});

        
        </script>
       
</body>
</html>
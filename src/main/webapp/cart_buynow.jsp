<%@page import="in.fssa.tharasworld.entity.AddressEntity"%>
<%@page import="in.fssa.tharasworld.service.AddressService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title> Buy now page </title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/cart-buynowpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
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
    
    <% HttpSession session3 = request.getSession(); %>
<% Integer userId = (Integer) session3.getAttribute("userId"); 

UserEntity user1 = UserService.findById(userId.intValue());

AddressEntity address = AddressService.findByDefault(user1.getId());

%>

    <div class="amt">
        Total amount : <p id="amt"> </p>
    </div>

    <div class="left">
       
    </div>

    <div class="right">

        <h2 class="per"> PERSONAL DETAILS </h2>
        
        <form>

<div class="name">
				<label> Name: </label> <input type="text" id="uname" name="name"
					 value="<%if (address != null) {%><%=address.getName()%> <%}%>" 
					disabled="true">
			</div>

			<div class="add">
				<label> Address: </label>
				<textarea id="address" name="address" disabled="true"><%
	 if (address != null) {
 %> <%=address.getAddress()%>
					<%
					}%>  </textarea>
			</div>
			<input type="number" id="pincode" name="pincode"
				placeholder="Pincode"
			    value=" <%if (address != null) {%><%=address.getPincode()%><%}%>" 
				maxlength="6" size="6" disabled> <input type="text"
				id="state" name="state"
				value=" <%if (address != null) {%><%=address.getState()%><%}%>"
				placeholder="State" disabled>



			<div class="no">
				<label> Phone number: </label> <input type="tel" id="phonenumber"
					name="phoneNumber"  value="<%=user1.getPhoneNumber()%>" 
					required="true" placeholder="+91" pattern="[6-9]\d{9}" maxlength="10">
			</div>

			<div class="cash">
				<label> Payment: </label> <input type="text" id="payment"
					name="payment" value="Cash on delivery" required="true">
				<!-- <select id="payment" required> 
                    <option value="cash_on_delivery"> Cash on delivery </option>
                </select> -->
			</div>
			
			<input type="hidden" id="addressId" value="<% if(address != null){%> <%=address.getAddressId()%> <% } %>" />
			
			<input type="hidden" name="sellerId" <%-- value="<%=pdt.getSellerId()%>" --%> />

			<button class="place" type="submit">PLACE ORDER</button>
			
			</form>

       <a href="/tharasworldweb/address">
			<button class="change" type="submit">Change address</button>
		</a>

    </div>

    <footer>
        <div class="top">
            <div class="about">
                <h4> About: </h4>
                <div class="us">
                    <p>
                        <a href="#"> About us </a>
                    </p>
                    <p>
                        <a href="#"> Available Products </a>
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
                        <i class="fa-brands fa-instagram" style="font-size:23px"></i>
                    </div>
                    <div class="fb">
                        <i class="fa-brands fa-facebook-f" style="font-size:23px"></i>
                    </div>
                    <div class="twiter">
                        <i class="fa-brands fa-twitter" style="font-size:23px"></i>
                    </div>
                    <div class="wa">
                        <i class="fa-brands fa-whatsapp" style="font-size:23px"></i>
                    </div>
                </div>
                <div>
                    <p>Copy rights @ 2022</p>
                </div>
            </div>
        </div>

    </footer>


<script>


let user_id = <%= userId.intValue() %>;

const add_to_cart = JSON.parse(localStorage.getItem("cart"));



const check_pdt = add_to_cart.filter((e) => e.buyer_id == user_id);

console.log(check_pdt);


// creating the image

for (let i = 0; i < check_pdt.length; i++) {

    // <div>

    const div = document.createElement("div");
    div.setAttribute("class", "image");
    // console.log(div);

    // <img>

    const img = document.createElement("img");
    img.setAttribute("src", check_pdt[i].product_image);
    img.setAttribute("alt", check_pdt[i].product_name);
    img.setAttribute("height", "150px");
    img.setAttribute("width", "150px");
    img.setAttribute("id", "image");
    div.append(img);

    const div_details = document.createElement("div");
    div_details.setAttribute("class", "details");
    div.append(div_details);

    const h3 = document.createElement("h3");
    h3.innerText = check_pdt[i].product_name;
    div_details.append(h3);

    const p = document.createElement("p");
    p.innerText = check_pdt[i].current_price;
    div_details.append(p);

    const s = document.createElement("s");
    s.innerText = check_pdt[i].actual_price;
    p.append(s);

    const b = document.createElement("b");
    b.innerText = check_pdt[i].discount;
    p.append(b);

    const p_qty = document.createElement("p");
    p_qty.setAttribute("class", "qty");
    p_qty.innerText = "Quantity : " + check_pdt[i].product_quantity;
    p.append(p_qty);

    const total = document.createElement("p");
    total.setAttribute("class", "tot");
    total.innerText = "Total amount : " + check_pdt[i].current_price * check_pdt[i].product_quantity;
    p.append(total);

    document.querySelector(".left").append(div);

    // total amount
    let total_amt = 0;

    for (let l = 0; l < check_pdt.length; l++) {
        total_amt += check_pdt[l].current_price * check_pdt[l].product_quantity;
    }
    console.log(total_amt);

    document.getElementById("amt").innerText = `${total_amt}`;
}


/////   buy now post 


 document.querySelector("button.place").addEventListener("click",(e) => {
	 e.preventDefault();

	const pdts = JSON.parse(localStorage.getItem("cart"));
	console.log(pdts);
	
	const addressId = document.getElementById("addressId").value;
	const phno = document.getElementById("phonenumber").value;
	
	const data = {"cart":pdts,"userAddress":addressId, "phoneNumber":phno};

	  axios.post("http://localhost:8080/tharasworldweb/cart_buy_now", data)
	    .then(function (response) {
	      // handle success
	      console.log(response.data);
	      const serverMsg = response.data;
	      if (serverMsg.trim() == 'success') {
	        console.log("Successfully Registered");
	        
	      } else {
	        console.log("server msg " + serverMsg);
	      }
	    })
	    .catch(function (error) {
	      // handle error
	      console.log("error " + error);
	    });
	  
	  window.location.href="http://localhost:8080/tharasworldweb/orders";
	  
	  pdts = "";
	  
	  localStorage.setItem("cart", JSON.stringify(pdts));

 } );



</script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</body>
</html>
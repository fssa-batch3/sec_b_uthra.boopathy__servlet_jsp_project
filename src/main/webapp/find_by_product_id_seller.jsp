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
<title>Insert title here</title>
<style>
*{
    margin: 0px;
    font-family: 'Kreon', serif;
}

header{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    background-color: purple;
    height: 100px;
}

header div ul{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    list-style: none;
    margin-left: 550px;
}

header div ul li{
    padding-top: 40px;
    padding-left: 30px;
}

header div ul li a{
     text-decoration: none;
     color: white;
     font-size: 24px;
}

#count {
    background-color: white;
    color: purple;
    font-size: 20px;
    border-radius: 50%;
    height: 20px;
    width: 22px;
    margin-top: -70px;
    margin-left: 17px;
    text-align: center;
    font-weight: bold;
}

.menu{
    display: none;
}

h1{
    font-size: 50px;
    font-weight: normal;
    padding-left: 60px;
    padding-top: 20px;
    color: white;
}

.logo{
    height: 70px;
    width: 70px;
    margin-top: 15px;
    margin-left: 50px;
    border-radius: 50px;
}

.login{
   font-size: 25px;
   color: white;
   cursor: pointer;
}

.arrow {
    margin: 2rem;
    font-size: 30px;
}

.arrow a {
    color: black;
}

.image img{
    border-radius: 10px;
}

.sub-images{
    position: relative;
    top: 60px;
    display: inline-block;
    padding: 10px;
}

.sub-images:hover{
   transform: translateY(-5px);
   transition: 0.2s;
   box-shadow: 5px 10px 18px  #888888;
}

.sub-images img{
    border-radius: 5px;
}

.detail{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    margin-top: 70px;
    margin-left: 130px;
}

.right{
    margin-left: 40px;
}


h2{
    font-size: 30px;
}

h3{
    font-size: 25px;
    color: red;
    position: relative;
    top: 15px;
}

h4{
    font-size: 20px;
    color: green; 
    position: relative;
    top: 20px;
}

p{
    font-size: 22px;  
    position: relative;
    top: 28px;  
}

.color{
    margin-top: 70px;
}

s{
    color: gray;
    position: relative;
    left: 10px;
}

b{
    color: green;
    position: relative;
    left: 20px;
}

strong{
    font-size: 22px;
    position: relative;
    top: 50px;
    
}

.para{
    position: relative;
    top: 40px;
    width: 900px;
}

.paras {
    position: relative;
    top: 80px;
    width: 900px;
}

.stars{
    font-size: 25px;
}

.size {
    padding-left: 10px;
    margin-left: 10px;
    margin-top: 3px;
    color: black;
    font-size: 20px;
    background-color: white;
    border: 0;
    cursor: pointer;
}

.star{
    position: relative;
    top: 35px;
    display: flex;
    flex-direction:row;
}

.details{
    position: relative;
    top: 60px;
}

.price {
    display: flex;
}

.add{
    height: 50px;
    width: 200px;
    border: 2px solid purple;
    background-color: purple;
    border-radius: 5px;
    color: white;
    position: relative;
    top: 130px;
    left: 40px;
    font-size: 20px;
    cursor: pointer;
}

.buy{
    height: 50px;
    width: 200px;
    border: 2px solid purple;
    background-color: purple;
    border-radius: 5px;
    color: white;
    position: relative;
    top: 130px;
    left: 120px;
    cursor: pointer;
    font-size: 20px;
}

.wish{
    height: 50px;
    width: 200px;
    border: 2px solid red;
    background-color: red;
    border-radius: 5px;
    color: white;
    position: relative;
    top: 230px;
    right: 230px;
    cursor: pointer;
    font-size: 20px;
}

.comment{
    margin-top: 270px;
    font-size: 20px;
}

.commen{
    margin-top: 30px;
    font-size: 20px;
    margin-left: 114px;
}

.comm{
    margin-top: 20px;
    font-size: 20px;
    margin-left: 114px;
}

input{
    border-radius: 3px;
    border: 1px solid gray;
    height: 50px;
    width: 500px;
    position: relative;
    top: 15px;
    outline: none;
}

h6 {
    font-size: 30px;
    margin-top: 7rem;
    text-align: center;
}

.left-b{
    border-bottom: 1px solid pink;
    width: 450px;
    position: relative;
    top: 8rem;
    left: 50px;
}

.right-b{
    border-bottom: 1px solid pink;
    width: 400px;
    position: relative;
    left: 950px;
    top: -20px;
}


.thumbnail{
    display: flex;
    justify-content: space-evenly;
    align-content: space-evenly;
    padding: 20px;
    margin-top: 2rem;
}

.products{
    border: 1px solid #f8f8f8;
    border-radius: 5px;   
    height: 350px;
    width: 300px;
    background-color: #f8f8f8;
}

.products img{   
    border-radius: 7px;
    margin: 30px 0px 0px 50px;
}

.similar{
    margin-top: 100px;
}

h5{
    margin-left: 20px;
    font-size: 20px;
    margin-top: 10px;
}

.price {
    margin-left: 30px;
}

.dis_price {
    margin-left: 10px;
}

.per {
    color: green;
    margin-left: 20px;
}

.products p{
    margin-left: 50px;
    margin-top: -20px;
}

.title{
    font-size: 20px;
    margin-top: 20px;
}

.percent{
    color: green;
}

.rev {
    margin: 18rem 0 0 30rem;
    font-size: 25px;
}

.rev_sec {
    height: 500px;
    overflow-x: hidden;
    overflow-y: scroll;
    height: 460px;
    scrollbar-width: none;
}

.rev_sec::-webkit-scrollbar {
    display: none;
}


.reviews {
    width: 40rem;
    height: 10rem;
    margin: 1rem 0 0 40rem;
    border-bottom: 1px solid gray;
}

.rname {
    display: flex;
}

#uname {
    margin-top: -15px;
    margin-left: 10px;
}

.com {
    margin-top: -10px;
    font-size: 19px;
}

#reviews {
    margin-top: 20px;
}

.stars_r {
    font-size: 35px;
    margin-top: 20px;
    background-color: unset;
    color: #FFA500;
}

.rev_b {
    background-color: purple;
    color: white;
    height: 35px;
    width: 150px;
    font-size: 17px;
    border-radius: 5px;
    border: none;
    margin-left: 75rem;
    margin-top: -10rem;
    cursor: pointer;
}

footer{
    background-color: purple;
    height: 310px;
    margin-top: 150px;
}

.about{
    margin: 60px 70px;
    padding-top: 10px;
    color: white;
}

.us{
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    font-size: 20px;
    word-spacing: 5px;
}

.us a{
    text-decoration: none;
    color: white;
}

.us p{
   font-size: 20px;
   font-weight: normal;
   margin: 0;
}

.about h4{
    font-size: 25px;
    padding-top: 5px;
    padding-bottom: 15px;
    color: white;
}

.top{
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
}

.contact{
    font-size: 20px;
    margin: 70px 0px;
    color: white;
    display: flex;
    align-items: center;
    flex-direction: column;
}
.contact div{
    margin: 15px 0;
    font-size: 23px;
    color: white;
}

.contact div p{
    font-size: 20px;
   font-weight: normal;
   margin: 0;
   color: white;
}

.con{
    font-size: 23px;
    position: relative;
    top: 10px;
    right: 5px;
}

.line{
    border-right: 2px solid gray;
    height: 190px;
    margin: 70px;
}

.socials{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    justify-content: space-evenly;
}

.socials div{
    margin: 0 10px;
    height: 30px;
    width: 30px;
    text-align: center;
    display: flex;
    align-items: center;
    border-radius: 50%;
    padding: 10px;
    justify-content: center;
    border: 0;
}

.insta{
    background-image: linear-gradient(315deg, #7110d2, #de46a9);
    color: white;
}

.fb{
    background-color: #3b5998;
    color: white;
}

.wa{
    background-color: #25d366;
    color: white;
}

.twiter{
    background-color: #00acee;
    color: white;
}

.collections img{
    border-radius: 150px;
    padding: 40px;
}

.icons div{
    position: relative;
}

.div{
    font-size: 25px;
    font-weight: bold;
    margin-left: 70px;
    display: inline-flex;
    bottom: 20px;
}

.divs{
    font-size: 25px;
    font-weight: bold;
    margin-left: 90px;
    bottom: 20px;
}

.divss{
    font-size: 25px;
    font-weight: bold;
    margin-left: 100px;
    bottom: 20px;
}

</style>
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
        <p id="original_price">&#8377 <%= price.get(0).getCurrentPrice() %></p>
        <p>
            <s id="discount_price">&#8377 <%= price.get(0).getActualPrice() %> </s>
        </p>
        <p>
            <b id="discount_percent"><%= price.get(0).getDiscount() %>% off</b>
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
   
   <a href="delete?pdt_id=<%= product.getPdtId() %>"> <button class="wish"> Delete 
    <i class="fa-solid fa-trash"  style="color:purple; 
	position: relative; top: -11rem; left: -0.8rem; font-size: 20px; "></i>  </button> </a>
    
    
</div>
		
		
		</div>
		
		<%
	} else {
	%>
	<p>Product not found.</p>
	<%
	}
	%>


</body>
</html>
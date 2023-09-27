<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.tharasworld.entity.TypeEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon"
	href="../assets/img/illustration/v-removebg-preview.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
	
<meta charset="ISO-8859-1">

<title> List of types by category  </title>

<style>


.arrow {
    margin: 2rem;
    font-size: 30px;
}

.arrow a {
    color: black;
}


.search {
    display: flex;
    align-items: center;
    justify-content: space-between; 
    padding: 10px; 
    width: 60rem;
    margin-top: 40px;
}

h2 {
    margin-left: 20rem; 
    font-size: 30px;
}

input[type="search"] {
    padding: 5px; 
    border: 1px solid #ccc;
    border-radius: 5px; 
    font-size: 16px; 
    width: 40%; 
    outline: none;
}


.thumbnail{
    display: grid;
    grid-template-columns: repeat(4, 280px);
    justify-content: space-evenly;
    grid-column-gap: 20px;
    grid-row-gap: 30px;
    margin: 40px 0px 0px 0px;
}

img{
    object-fit: unset;
    border-radius: 5px;
    margin-left: 50px;
    margin-top: 15px;
}

h3{
    font-size: 22px;
    font-weight: normal;
    margin-top: 20px;
    width: 250px;
    text-align: center;
    color: rgb(74, 3, 74);
}

a{
    text-decoration: none;
}


.products:hover{
    transform: scale(1.08);
}

.products{
    border: 1px solid #f8f8f8;
    background-color: #f8f8f8;
    margin: 10px 0px 10px 0px;
}</style>

</head>
<body>

	<%@ include file="/header.jsp" %> 
	
	<div class="arrows"></div>
	
	
	<form action="/tharasworldweb/type/products" method="get">

<div class="search">

	<h2> Types </h2> 
	
	<input type="search" name="search_type" placeholder="Search products by type name">

</div>
	

	<%
		Set<TypeEntity> types = (Set<TypeEntity>) request.getAttribute("types");
			
		%>
	<section>
	

		<div class="thumbnail">

		<%   for (TypeEntity type : types) {%>
		
			<a href="types/products?type_id=<%=type.getTypeId()%>">

				<div class="products" style="display:inline-block; height:280px; width: 280px;">

					<img src="<%= type.getImg() %>" alt="image" height="200px" width="180px">
					<h3>
						<%=type.getTypeName()%>
					</h3>

				</div>

			</a>
		<%	}  %>
		</div>
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
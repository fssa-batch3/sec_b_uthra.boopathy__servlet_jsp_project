<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-silksareepage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
   
   <title> Product List page </title>
   
    </head> 
    
    <body>
        
<%@ include file="/header.jsp" %> 

        <div class = "arrows"> 
        
    
<!--     <div class="arrow">
    		<a href="#">
       			 <i title="Back" class="fa-solid fa-arrow-left"></i>
   			 </a>
	 -->	</div>
        
         </div>

        <section>
        
        <div class="thumbnail">
        
        <%
        
        Set<ProductDetailDTO> product =(Set<ProductDetailDTO>) request.getAttribute("ListOfProductsByType"); %>
        
            
            
            <% for(ProductDetailDTO products : product) { %>
	
	<a href="products/details?pdt_id=<%= products.getPdtId() %>">
		
	<div class="products"> 
	
		<img src = "<%= products.getImg() %>" alt="image" heigth="200px" width="180px">
		<h3> <%= products.getName() %> </h3>
		<% List<PriceEntity> priceList = products.getListOfPrices(); %>
        <% if (!priceList.isEmpty()) { %>
        <div class="price">
       	  <p>&#8377 <%= (int) Math.round(priceList.get(0).getCurrentPrice())%> 
          <s>&#8377 <%= (int) Math.round(priceList.get(0).getActualPrice())%></s>
          <span class="percent"> <%=(int)Math.round(priceList.get(0).getDiscount())%>%off </span>
          </p>
        </div>
          <% } %>

	</div>
	
		</a>
	
	<% } %>

            </div>         
          
        </section>

        <footer>
            <div class="top">
                <div class="about">
                    <h4> About: </h4>
                    <div class="us">
                        <p>
                            <a href="#"> About us </a>

                        </p> 
                        <p>
                            <a href="#"> Available Products  </a>
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
                        <p>Copyrights@2022</p>
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
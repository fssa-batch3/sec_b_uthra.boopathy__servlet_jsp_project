<%@page import="in.fssa.tharasworld.entity.CategoryEntity"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style-frontpage.css">
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
       
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Kreon:wght@300;400;500;600;700&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Parisienne&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet">
            
            <title> Home page </title>
            
    </head>

    <body>

        <%@ include file="/header.jsp" %> 

        <div class="sub-heading">

            <a href="productlist.jsp" class="new_release">
                <strong> NEW RELEASE </strong> 
            </a>
            
            
            <form action="category/products" method="get">


            <div class="icon" id="search">

                <div>
                    <input type="text" name="search" placeholder="Search products by category name">
                </div>
                <div class="search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
            </div>

 	</form>

        </div>
        
        <section>
        
         <% Set<CategoryEntity> category =(Set<CategoryEntity>) request.getAttribute("categoryList"); %>    
        
            <div class="icons">
          
            <% for(CategoryEntity categories : category) { %>
                <div>
                   <a href="category/types?category_id=<%= categories.getCateId() %>">
                        <div class="collections">
                           <img src = "<%= categories.getImg() %>" alt="image" height="200px" width="180px">
                        </div>
                        <div class="div">  <%= categories.getCateName() %> </div>
                    </a>
                </div>
                
                	<% } %>

            </div>

            <div class="offers">
                <div class = "slide">
                <div class="image">
                <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/diss.jpg" alt="photo" height="500px" width="1200px">
                </a>
                </div>
                <div class="image">
                    <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/disdress.jpg" alt="photo" height="500px" width="1300px">
                </a>
                </div>
                <div class="image">
                    <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/disdress1.jpg" alt="photo" height="500px" width="1300px">
                </a>
                </div>
                </div>
            </div>

            <div class="price">
                <div class="para">
                    <h3> Lowest Price With Best Quality Products </h3>
                    <div class="dis_img">
                        <div>
                            <a href="productlist.jsp">
                                <img src="<%=request.getContextPath()%>/assets/images/sale.jpg" alt="pic" height="200px" width="200px">
                            </a>
                        </div>
                        <div>
                            <a href="productlist.jsp">
                                <img src="<%=request.getContextPath()%>/assets/images/fifty.jpg" alt="pic" height="200px" width="200px">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="pics">
                    <div>
                        <a href="productlist.jsp">
                            <img src="<%=request.getContextPath()%>/assets/images/99.jpg" alt="photo">
                        </a>
                    </div>
                    <div>
                        <a href="productlist.jsp">
                            <img src="<%=request.getContextPath()%>/assets/images/299.jpg" alt="photo">
                        </a>
                    </div>
                    <div>
                        <a href="productlist.jsp">
                            <img src="<%=request.getContextPath()%>/assets/images/499.jpg" alt="photo">
                        </a>
                    </div>
                    <div>
                        <a href="productlist.jsp">
                            <img src="<%=request.getContextPath()%>/assets/images/999.jpg" alt="photo">
                        </a>
                    </div>
                </div>
            </div>

            <div class="border"></div>
            <h2> TOP SELLING BRANDS </h2>
            <div class="bottom"></div>

            <div class="counts">
                <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/dis jewel.jpg" alt="photo" width="450px">
                </a>
                <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/discos1.jpg" alt="photo" width="240px"> 
                </a>
                <a href="productlist.jsp">
                    <img src="<%=request.getContextPath()%>/assets/images/disjewel1.jpg" alt="photo" width="450px"> 
                </a>
            </div>

            <div class="category-item">
                <div class="category-card">
                    <a href="productlist.jsp"> 
                  <div class="title">
                        Flat upto 50% off
                </div>
                  <img src="<%=request.getContextPath()%>/assets/images/ct4.jpg" height="360px"alt="">
                  </a>
                </div>
                
                <div class="category-card">
                    <a href="productlist.jsp">
                    <div class="title">
                            Flat upto 50% off
                    </div>
                  <img src="<%=request.getContextPath()%>/assets/images/ct5.jpg" height="360px" alt="">
                </a>
                </div>

                <div class="category-card">
                    <a href="productlist.jsp">
                    <div class="title">
                            Flat upto 50% off
                    </div>
                     <img src="<%=request.getContextPath()%>/assets/images/jean5.jpg" height="360px" alt="">
                    </a>
                  </div>
                
                  <div class="category-card">
                    <a href="productlist.jsp">
                    <div class="title">
                            Flat upto 50% off
                    </div>
                  <img src="<%=request.getContextPath()%>/assets/images/leganga.jpg" height="360px" alt="">
                </a>
                </div>
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

    </body>

</html>
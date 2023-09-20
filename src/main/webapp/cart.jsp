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
        
        <div class="arrow">
    <a href="../homepage/frontpage.html">
        <i title="Back" class="fa-solid fa-arrow-left"></i>
    </a>
</div>
        
        </div>

        <section>
        
        <div class="container">
    <img src="match_pdt.image" alt="photo" height="200px" width="180px">
    <div class="details">
        <h3 id="name">match_pdt.name</h3>
        <div>
            <p id="original_price">check_pdt[k].discount_price</p>
            <s id="discount_price">ck_size.original_price</s>
            <span class="percent">ck_size.discount_percent%off</span>
        </div>
        <div class="size">
            <p class="size">Size : check_pdt[k].size</p>
        </div>
        <div class="quantity">
            <p>Quantity</p>
            <input class="quantity" type="number" value="check_pdt[k].product_quantity" id="product_quantity" min="1" max="10" data-remove="check_pdt[k].product_id" data-size="check_pdt[k].size">
        </div>
        <button class="remove" data-remove="check_pdt[k].product_id" type="submit">REMOVE</button>
        <button class="wish" data-remove="check_pdt[k].product_id" type="submit">WISHLIST</button>
    </div>
</div>

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
</body>
</html>
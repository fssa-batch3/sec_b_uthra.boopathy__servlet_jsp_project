<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style-register.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>

<title> Register user </title>

</head>
<body>

<%@ include file="/header.jsp" %>  

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
	
	 <section>
            <form role="form" action="create" method="post">
            
            
                <div class="register">
                
                
            
                    <h2> SIGN UP : </h2>
                    <div>
                        <label> Name: </label>
                        <input type="text" id="uname" name="name" pattern="^[a-zA-Z ]+$" required="true">
                    </div>
                    
                    <div>
                        <label> Age: </label>
                        <input type="number" id="age" name="age" min="1" minlength="2" maxlength="3" required="true">
                    </div>
                    
                    <div>
                        <label> Email: </label>
                        <input type="text" id="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required="true">
                    </div>

                    <div>
                        <label> Phone number: </label>
                        <input type="tel" id="phonenumber" name="phone_number" pattern="[6-9]\d{9}" placeholder="+91" required="true">
                    </div>

                    <div>
                        <label> Create Password: </label>
                        <input type="password" id="password" name="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" required="true" >
                        <p> (Pattern: Atleast 8 characters including uppercase, lowercase, number and special characters) </p>
                    </div>
                    
                    <div class="form-group">
							<label class="showLabel"> <input type="checkbox"
								id="show"> Show Password
							</label>
						</div>
                    
                    <div>
                        <label > Role: </label>
                        <select name="role" required>
                        
                        <option value=""> Select role </option>
                        <option value="Buyer" > Buyer </option>
                        <option value="Seller"> Seller </option>
                        
                        </select>
                    </div>
                
                    <p>
                        Already have an account? <a href="login"> LOG IN </a> 
                    </p>
               
                   <a href="user/login"> <button type="submit" class="submit"> SUBMIT </button> </a>
            
                </div>
            </form>
    
        </section> 
        
        
        <script>
	 /* password show */
    const Password = document.querySelector("#password");
	const Checkbox = document.querySelector("#show");

	Checkbox.addEventListener("click", () => {
		const type =
			 Password.getAttribute("type") === "password" ? "text" : "password";
				Password.setAttribute("type", type);
});
	</script>

</body>
</html>
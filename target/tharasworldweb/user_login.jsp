<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style-loginpage.css">

<title> User login </title>

</head>
<body>

<% String errorMsg = (String) request.getAttribute("errorMessage"); %>

<% if(errorMsg != null) { %>

<script> alert("<%=errorMsg%>"); </script>

<% } %>

 <section>
    <form role="form" action="login" method="post" id="signIn">
      <h2> Login</h2>

      <div class="no">
        <label> Contact number: </label>
        <input type="tel" required="true" placeholder="+91" id="phonenumber" name="phone_number">
        <br>
      </div>

      <div class="password">
        <label> Password: </label>
        <input type="password" placeholder="*******" id="password" name="password" required="true">
      </div>
      
      <div class="form-group">
							<label class="showLabel"> <input type="checkbox"
								id="show"> Show Password
							</label>
	  </div>

      <p>
        Create new account <a href="new"> Sign up </a>
      </p>

      <div>
        <a href="category_list"> <button class="btn" type="submit"> Submit </button> </a>
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
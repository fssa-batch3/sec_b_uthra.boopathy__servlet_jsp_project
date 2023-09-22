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


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"> </script>

</head>
<body>

<%@ include file="/header.jsp" %> 


<% String error = (String) request.getAttribute("errorMessage"); 

if (error != null) {
%>

<script>alert("<%= error %>");</script>

<% } %> 

<%-- <%
	String error = (String) request.getAttribute("errorMessage");
	if (error != null && !("".equals(error))) {
		%>
	
	<script>
		console.log("coming");
		Notify.error(
		`<%=error%>
		`);
	</script>

	<%
	}
	%> --%>

 <section>
    <form role="form" action="login" method="post" id="signIn">
      <h2> Login</h2>

      <div class="no">
        <label> Contact number </label>
        <input type="tel" required="true"  pattern="[6-9]\d{9}" id="phonenumber" name="phone_number">
        <br>
      </div>

      <div class="password">
        <label> Password </label>
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
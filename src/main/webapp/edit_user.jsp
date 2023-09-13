<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kreon:wght@500&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title> Edit user </title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #F4F4F4;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }
    form {
        background-color: #FFFFFF;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 300px;
    }
    input[type="text"],
    input[type="number"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 14px;
    }
    button {
        background-color: purple;
        color: #FFFFFF;
        border: none;
        border-radius: 3px;
        padding: 10px 15px;
        font-size: 14px;
        cursor: pointer;
    }
    button:hover {
        background-color: purple;
    }
</style>


</head>
<body>

<h1> Update user </h1>

<%
		UserEntity user = (UserEntity) request.getAttribute("editUser");

		
		%>
		
				
		<% String errorMsg = (String) request.getAttribute("errorMessage"); %>


		<% if(errorMsg != null && user!=null) { %>
		
		<script> alert("<%=errorMsg%>"); </script>
		
		<script>
			doucument.getElementById("name").value = "<%= user.getName()%>";
			doucument.getElementById("email").value = "<%= user.getEmail()%>";
			doucument.getElementById("phonenumber").value = "<%= user.getPhoneNumber()%>";
			doucument.getElementById("password").value = "<%= user.getPassword()%>";
			doucument.getElementById("age").value = "<%= user.getAge()%>";		
		</script>
		
		<% } %>
		

	<form action="update" method = "post">
		<label> Name : <input type="text" id="name" name="name" required value=<%= user.getName() %>> </label>
		<label> Email : <input type="text" id="email" name="email" disabled value=<%= user.getEmail() %>> </label>
		<label> Phone number : <input type="number" id="phonenumber" name="phone_number" disabled value=<%= user.getPhoneNumber() %>> </label>
		<label> Password : <input type="password" id="password" name="password" required value=<%=user.getPassword() %>> </label>
		<label> Age : <input type="number" id="age" name="age" required value=<%=user.getAge()%>> </label>
		
	 <a href="category_list"> <button type="submit"> Submit </button> </a>
		
	</form>



</body>
</html>
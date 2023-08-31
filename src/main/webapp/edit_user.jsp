<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
        background-color: #007BFF;
        color: #FFFFFF;
        border: none;
        border-radius: 3px;
        padding: 10px 15px;
        font-size: 14px;
        cursor: pointer;
    }
    button:hover {
        background-color: #0056B3;
    }
</style>


</head>
<body>

<h1> Update user </h1>

	<% 

		UserEntity user = (UserEntity) request.getAttribute("editUser");
	
	%>

	<form action="update?id=<%=user.getId() %>" method = "post">
		<label> Name : <input type="text" name="name" required value=<%= user.getName() %>> </label>
		<label> Email : <input type="text" name="email" disabled value=<%= user.getEmail() %>> </label>
		<label> Phone number : <input type="number" name="phone_number" disabled value=<%= user.getPhoneNumber() %>> </label>
		<label> Password : <input type="password" name="password" required value=<%=user.getPassword() %>> </label>
		<label> Age : <input type="number" name="age" required value=<%= user.getAge() %>> </label>
		
		<button type="submit"> Submit </button>
		
	</form>

</body>
</html>
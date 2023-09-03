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
    
    h1 {
    	text-align: centre;
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
    textarea {
        width: 90%;
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

<h1> Create product </h1>


	<form action="create" method = "post">
		<label> Name : <input type="text" name="name" required> </label>
		<label> Actual price : <input type="number" name="email" required> </label>
		<label> Current price : <input type="number" name="phone_number" required> </label>
		<label> Discount : <input type="number" name="password" required> </label>
		<label> Description : </label>
		 <textarea rows="5"></textarea>
		
		<button type="submit"> Submit </button>
		
	</form>

</body>
</html>
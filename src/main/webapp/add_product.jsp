<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
h1 {
    text-align: center;
    margin-top: 20px;
}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 30px;
    border: 1px solid #ccc;
    border-radius: 5px; 
}

label {
    display: block;
    margin-bottom: 10px; 
}

input[type="text"],
input[type="number"],
select,
textarea {
    width: 95%; 
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc; 
    border-radius: 3px; 
}

textarea {
    height: 90px; 
}

button[type="submit"] {
    background-color: #007bff;
    color: #fff; 
    padding: 10px 20px;
    border: none; 
    border-radius: 3px;
    cursor: pointer; 
}

button[type="submit"]:hover {
    background-color: #0056b3; 
}

</style>


</head>
<body>

<h1> Add new product </h1>


	<form action="create" method = "post">
	
		<label> Name : <input type="text" name="name" required> </label>
		<label> Category : </label>
		<select name="category">
		<option value=""> </option>
		</select>
		<label> Type : </label>
		<select name="type">
		<option value=""> </option>
		</select>
		<label> Actual price : <input type="number" name="email" required> </label>
		<label> Current price : <input type="number" name="phone_number" required> </label>
		<label> Discount : <input type="number" name="password" required> </label>
		<label> Description : </label>
		 <textarea rows="5"></textarea>
		
		<button type="submit"> Submit </button>
		
	</form>

</body>
</html>
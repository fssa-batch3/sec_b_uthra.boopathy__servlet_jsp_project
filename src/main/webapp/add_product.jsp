<%@page import="in.fssa.tharasworld.service.TypeService"%>
<%@page import="in.fssa.tharasworld.entity.TypeEntity"%>
<%@page import="java.util.Set"%>
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
input[type="url"],
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
    background-color: purple;
    color: #fff; 
    padding: 10px 20px;
    border: none; 
    border-radius: 3px;
    cursor: pointer;
    margin-left: 10rem; 
}


</style>


</head>
<body>

<h1> Add new product </h1>


	<form action="create" method = "post">
	
	
		<label> Image url : <input type="url" name="img_url" required> </label>
		
		<label> Name : <input type="text" name="name" required> </label>
		<label> Type : </label>
		<select name="type">
		<option value=""> </option>
			
		<% TypeService typeService = new TypeService();
		Set<TypeEntity> types = typeService.findAll(); 
		for( TypeEntity type : types ) { %>
		<option value="<%= type.getTypeId() %>" > <%= type.getTypeName() %> </option>
		<% } %>
		</select>
		<label> Actual price : <input type="number" name="actual_price" required> </label>
		<label> Current price : <input type="number" name="current_price" required> </label>
		<label> Discount : <input type="number" name="discount" required> </label>
		<label> Description : </label>
		 <textarea rows="5" name="description"></textarea>
		
		<a href="product_list"> <button type="submit"> Submit </button> </a>
		
	</form>

</body>
</html>
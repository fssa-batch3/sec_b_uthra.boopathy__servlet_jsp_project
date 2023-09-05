<%@page import="in.fssa.tharasworld.entity.PriceEntity"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.tharasworld.dto.ProductDetailDTO"%>
<%@page import="in.fssa.tharasworld.entity.TypeEntity"%>
<%@page import="in.fssa.tharasworld.service.TypeService"%>
<%@page import="in.fssa.tharasworld.entity.ProductEntity"%>
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
    text-align: center;
    margin-left: 10rem;
}

</style>


</head>
<body>

<h1> Update product </h1>

	<% 

		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("editProduct");
	
	%>

	<form action="update?pdt_id=<%= product.getPdtId() %>" method="post">
    <label> Image url : <input type="url" name="img_url" required value="<%= product.getImg() %>"> </label>
    <label> Name : <input type="text" name="name" required value="<%= product.getName() %>"> </label>
    <label> Type : </label>
    <select name="type">
        <% TypeService typeService = new TypeService();
           TypeEntity typeName = typeService.findByTypeId(product.getTypeId()); %>
        <option value="<%= product.getTypeId() %>"> <%= typeName.getTypeName() %> </option>
        <% Set<TypeEntity> types = typeService.findAll(); 
           for (TypeEntity type : types) { %>
            <option value="<%= type.getTypeId() %>"> <%= type.getTypeName() %> </option>
        <% } %>
    </select>
    <%
        List<PriceEntity> prices = product.getListOfPrices();
        PriceEntity price = prices.get(0); // Assuming the first price in the list is relevant
    %>
    <label> Actual price : <input type="number" name="actual_price" disabled value="<%= price.getActualPrice() %>"> </label>
    <label> Current price : <input type="number" name="current_price" disabled value="<%= price.getCurrentPrice() %>"> </label>
    <label> Discount : <input type="number" name="discount" disabled value="<%= price.getDiscount() %>"> </label>
    <label> Description : </label>
    <textarea rows="5" name="description"><%= product.getDescription() %></textarea>
    <a href="product_list"> <button type="submit"> Submit </button> </a>
</form>



</body>
</html>
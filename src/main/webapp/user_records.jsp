<%@page import="in.fssa.tharasworld.entity.UserEntity"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.tharasworld.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #DDDDDD;
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {
  background-color: #DDDDDD;
}
</style>

</head>

<body>

	<h2>User List</h2>
	
	
	
	<% Set<UserEntity> user =(Set<UserEntity>) request.getAttribute("userList"); %>
		
 	<table>
		
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone number</th>
			<th>Role</th>
			<th> View </th>
			<th> Edit </th>
			
			<th> Delete </th>
		</tr>
		

		
		<% for(UserEntity users : user) { %>
		
		<tr>
			<td> <%= users.getId() %> </td>
			<td> <%= users.getName() %> </td>
			<td> <%= users.getEmail() %> </td>
			<td> <%= users.getPhoneNumber() %> </td>
			<td> <%= users.getRole() %> </td>
			<td> <a href="user_records/details?id=<%= users.getId() %>"> <button type="submit"> View </button> </a> </td>
			<td> <a href="user/edit?id=<%= users.getId() %>"> <button type="submit"> Edit </button> </a> </td>
			<td> <a href="user/delete?id=<%= users.getId()%>"> <button type="submit"> Delete </button> </a> </td>
		</tr>
		
		<% } %>
	
	</table>

</body>
</html>
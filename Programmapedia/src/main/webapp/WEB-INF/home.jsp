<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Programmapedia</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container pt-3">
	
		<div class="mb-4">
			<h1>Welcome ${user.userName }!</h1>
			<div class="align-self-center">
				<a href="/language/add">Add a Language</a>
				<a href="/add">Add an Entry</a>
				<a href="/logout">Logout</a>
			</div>
			
		</div>
		
		
		<div>
		
			<div>
				<h3>Table of Contents:</h3>
				
			</div>
		
			
			<table class="table table-striped table-bordered">
			
				<h3>Your Entries:</h3>
				
				<thead style="background-color: lightgrey;">
					<th>Entry Title</th>
					<th>Language</th>
					<th>Actions</th>
				</thead>
				<tbody>
					<c:forEach var="entry" items="${entries }">
						<tr>
							<td>
								<a href="/views/${entry.id }">
									${entry.title }
								</a>
							</td>
							<td>${entry.language }</td>
							<td>
								<a href="/edit/${entry.id }">
									Edit
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		
		</div>
		
	
	</div>

</body>
</html>
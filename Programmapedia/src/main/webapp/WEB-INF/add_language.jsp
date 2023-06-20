<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
		<div class="mb-4 d-flex justify-content-between">
			<h1>Programmapedia</h1>
			<div class="align-self-center">
				<a class="me-3" href="javascript:history.back()">Go Back</a>
				<a class="me-3" href="/home">Home</a>
				<a href="/logout">Logout</a>
			</div>
		</div>
	
		<div class="w-75">
			<form:form action="/language/create" method="post" modelAttribute="language">
			
				<p class="text-center">Add a Language</p>
				
				<div class="form-group row mb-3">
					<form:label class="col-sm-4 col-form-label" path="programmingLanguage">Programming Language:</form:label>					
					<form:input class="col-sm-5" type="text" path="programmingLanguage" />
					<form:errors class="text-danger" path="programmingLanguage" />
				</div>
				
				<div class="text-center">
					<button class="btn btn-outline-dark">Create</button>
				</div>
			</form:form>	
		</div>
	</div>


</body>
</html>
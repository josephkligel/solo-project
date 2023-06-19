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
</head>
<body>

	<div>
		<h1>Programmapedia</h1>
		<div>
			<a href="/home">Home</a>
			<a href="/logout">Logout</a>
		</div>
	</div>

	<form:form action="/language/create" method="post" modelAttribute="language">
	
		<p>Add a Language</p>
		
		<div class="form-group row mb-3">
			<form:label class="col-sm-4 col-form-label" path="programmingLanguage">Programming Language:</form:label>					
			<form:input class="col-sm-8" type="text" path="programmingLanguage" />
			<form:errors class="text-danger" path="programmingLanguage" />
		</div>
		
		<button>Create</button>
	</form:form>

</body>
</html>
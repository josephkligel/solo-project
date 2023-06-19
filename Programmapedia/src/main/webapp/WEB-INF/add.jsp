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

	<form:form action="/entry/create" method="post" modelAttribute="entry">
	
		<p>Add an Entry</p>
		
		<form:input type="hidden" value="${user.id }" path="user" />
		
		<div class="form-group row mb-3">
			<form:label class="col-sm-4 col-form-label" path="title">Entry Title:</form:label>					
			<form:input class="col-sm-8" type="text" path="title" />
			<form:errors class="text-danger" path="title" />
		</div>
		
		<div class="form-group row mb-3">
			<form:label class="col-sm-4 col-form-label" path="language">Programming Language:</form:label>					
			<form:input class="col-sm-8" type="text" path="language" />
			<form:errors class="text-danger" path="language" />
		</div>
		
		<div class="form-group row mb-3">
			<form:label class="col-sm-4 col-form-label" path="description">Description:</form:label>					
			<form:input class="col-sm-8" type="text" path="description" />
			<form:errors class="text-danger" path="description" />
		</div>
		
		<div class="form-group row mb-3">
			<form:label class="col-sm-4 col-form-label" path="examples">Example(s):</form:label>					
			<form:textarea class="col-sm-8" type="text" path="examples"></form:textarea>
			<form:errors class="text-danger" path="examples" />
		</div>
		
		<button>Create</button>
	</form:form>

</body>
</html>
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
				<a href="javascript:history.back()">Go Back</a>
				<a href="/home">Home</a>
				<a href="/logout">Logout</a>
			</div>
		</div>
	
		<div class="w-75">
			<p class="text-center">Edit an Entry</p>
			
			<form:form action="/entry/update" method="post" modelAttribute="entry">
										
				<input type="hidden" name="_method" value="put" />
				<form:input type="hidden" value="${team.id }" path="id" />
				<form:input type="hidden" value="${user.id }" path="user" />
				
				<div class="form-group row mb-3">
					<form:label class="col-sm-4 col-form-label" path="title">Entry Title:</form:label>					
					<form:input class="col-sm-5" type="text" path="title" />
					<form:errors class="text-danger" path="title" />
				</div>
				
				<div class="form-group row mb-3">
					<form:label class="col-sm-4 col-form-label" path="language">Programming Language:</form:label>					
					<form:select class="col-sm-4" type="text" path="language">
							<c:forEach var="language" items="${languages }">
								
								<form:option itemLabel="language_id" value="${language }">
									<c:out value="${language.programmingLanguage }" />
								</form:option>
							
							</c:forEach>
					</form:select>
					<form:errors path="language" class="text-danger" />
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
				
				<div class="text-center">
					<button class="btn btn-outline-dark">Update</button>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>
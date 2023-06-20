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
				<a class="me-3" href="/logout">Logout</a>
			</div>
		</div>
		
		<div class="mb-3">
			<p>${entry.title }</p>
			<div class="card w-50">
			
				<div class="card-body">
					<p>Language: ${entry.language.programmingLanguage }</p>
					<p>Created By:
						${ user.id == entry.user.id ? "You" : entry.user.userName }
					 </p>
					<p>Description: ${entry.description }</p>
					<p>
						Example(s):
						<div class="ms-5">
							${entry.examples }
						</div>
					</p>
				</div>
			</div>
			
		</div>
		
		<c:if test="${user.id == entry.user.id }">
			<div class="w-50 d-flex justify-content-end">
				<a class="btn btn-outline-dark me-3" href="/edit/${entry.id }">
					Edit
				</a>
				
				<form action="/entry/${entry.id }/delete" method="post">
					<input type="hidden" name="_method" value="delete" />
					<button class="btn btn-danger">Delete</button>
				</form>
			</div>
		</c:if>
		
	
	</div>

</body>
</html>
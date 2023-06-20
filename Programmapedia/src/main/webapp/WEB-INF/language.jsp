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
	
		<div class="w-75">
			<table class="table table-striped table-bordered">
			
				<p>${language.programmingLanguage } Entries:</p>
				
				<thead style="background-color: lightgrey;">
					<th>Entry Title</th>
					<th>Language</th>
					<th>Actions</th>
				</thead>
				<tbody>
					<c:forEach var="entry" items="${language.entries }">
						<tr>
							<td>
								<a href="/views/${entry.id }">
									${entry.title }
								</a>
							</td>
							<td>${entry.language.programmingLanguage }</td>
							<td>
								<c:if test="${ user.id == entry.user.id}">
									<a href="/edit/${entry.id }">
										Edit
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>

	</div>

</body>
</html>
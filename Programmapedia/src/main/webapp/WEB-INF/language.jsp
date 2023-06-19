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

	<table class="table table-striped table-bordered">
		
			<p>${language } Entries:</p>
			
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

</body>
</html>
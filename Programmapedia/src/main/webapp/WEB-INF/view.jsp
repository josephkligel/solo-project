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
	
	<div>
		<p>${entry.title }</p>
		<div>
			<p>Language: ${entry.language }</p>
			<p>Created By:
				${ user.id == entry.user.id ? "You" : entry.user.userName }
			 </p>
			<p>Description: ${entry.description }</p>
			<p>
				Example(s):
				<br>
				${entry.examples }
			</p>
		</div>
		
	</div>
	
	<div>
		<a class="btn" href="/edit/${entry.id }">
			Edit
		</a>
		
		<form action="/entry/${entry.id }/delete" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button>Delete</button>
		</form>
	</div>

</body>
</html>
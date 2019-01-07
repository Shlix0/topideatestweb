<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Add USER</h1>
	<form action="IdeaManagerServlet" method="POST">
		<input type="hidden" id="id" name="id"  value="${ideaObj.id}">
		<label for="title">Title</label>
		<input type="text" name="title" value="${ideaObj.title}">
		<label for="Picture">Picture</label>
		<input type="text" name="picture" value="${ideaObj.picture}">	
		<label for="Content">Content</label>
		<input type="text" name="content" value="${ideaObj.content}">
		<label for="LastName">LastName</label>
		<input type="text" name="lastName" value="${userObj.lastName}">
		<label for="FirstName">FirstName</label>
		<input type="text" name="firstName" value="${userObj.firstName}">
		<label for="category">Category</label>
		<input type="text" name="category" value="${categoryideaObj.title}">
		
		<button type="submit">Ajouter L'idée</button>
	</form>

</body>
</html>
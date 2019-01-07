<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<head>
<meta charset="UTF-8">

<!-- Custom styles for this template -->
<link href="pages/Product.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

<title>Liste des idées : TopIdeas</title>
</head>
<body>

	<nav class="site-header sticky-top py-1">
		<div
			class="container d-flex flex-column flex-md-row justify-content-between">
			<a class="py-2" href="#"> <svg xmlns="http://www.w3.org/2000/svg"
					width="24" height="24" viewBox="0 0 24 24" fill="none"
					stroke="currentColor" stroke-width="2" stroke-linecap="round"
					stroke-linejoin="round" class="d-block mx-auto">
					<circle cx="12" cy="12" r="10"></circle>
					<line x1="14.31" y1="8" x2="20.05" y2="17.94"></line>
					<line x1="9.69" y1="8" x2="21.17" y2="8"></line>
					<line x1="7.38" y1="12" x2="13.12" y2="2.06"></line>
					<line x1="9.69" y1="16" x2="3.95" y2="6.06"></line>
					<line x1="14.31" y1="16" x2="2.83" y2="16"></line>
					<line x1="16.62" y1="12" x2="10.88" y2="21.94"></line></svg>
			</a> <a class="py-2 d-none d-md-inline-block" href="#">Login</a> <a
				class="py-2 d-none d-md-inline-block" href="#">Ideas</a> <a
				class="py-2 d-none d-md-inline-block" href="#">Categories</a> <a
				class="py-2 d-none d-md-inline-block" href="#">Top</a> <a
				class="py-2 d-none d-md-inline-block" href="#">Flop</a> <a
				class="py-2 d-none d-md-inline-block" href="#">Brain</a>
		</div>

	</nav>

	<div
		class="position-relative overflow-hidden p-3 p-md-5 m-md-6 text-center bg-light">
		<div class="col-md-5 p-lg-5 mx-auto my-5">
			<h1 class="display-4 font-weight-normal">TOPAIDI</h1>
			<p class="lead font-weight-normal">Haut lieu de rassemblement
				français des inventeurs, le site Topaidi symbolise toute l’essence
				et l’étendue du concept d’invention en France. Curieux et
				professionnels aux enjeux divers et variés se rendent chaque année
				ici pour y découvrir les inventions de demain !</p>
			<li><a class="btn btn-outline-secondary" href="?action=add">Ajouter
					une idée</a></li>
		</div>
		<div class="product-device shadow-sm d-none d-md-block"></div>
		<div
			class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	</div>

	<c:forEach items="${ideasList}" var="idea">
 <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
      <div class="bg-dark mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
        <div class="my-3 py-3">
					<h2 class="display-5">${idea.title}</h2>
					<p class="lead">${idea.content}</p>
					<a href="?action=delete&id=${idea.id}"><button type="button"
							class="btn btn-delete">Delete</button></a> <a
						href="?action=edit&id=${idea.id}"><button type="button"
							class="btn btn-delete">Edit</button></a>
				</div>
				<div class="bg-light shadow-sm mx-auto"	style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
			</div>
		</div>
	</c:forEach>



 
 


	<!-- <h1>Liste des Idées</h1> -->
	<!-- 	<ul> -->
	<%-- 	<c:forEach items="${userList}" var="u"> --%>
	<%-- 	<li>${u.login} ${u.lastName} (<a href="?action=delete&id=${u.id}">Supprimer</a>)  (<a href="?action=edit&id=${u.id}">Edit</a>)</li> --%>
	<%-- 	</c:forEach> --%>
	<!-- 	<li><a href="?action=add">Ajouter un utilisateur</a></li> -->
	<!-- 	</ul> -->
</body>
</html>
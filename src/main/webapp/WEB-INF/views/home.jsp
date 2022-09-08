<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-white navbar-white">
		<div class="container-fluid">
		<div>
		<%-- 
			<img src="${pageContext.request.contextPath}/img/main0.png" class="ms-3">
		--%>
			<h1 class="ms-5"><a class="text-decoration-none fw-bold text-dark" href="${pageContext.request.contextPath}/home">여긴 어때</a></h1>
		</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item ms-3 fw-bold"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/room/search">SEARCH</a></li>
					<li class="nav-item ms-3 fw-bold"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/qnaboard/qnaList">QnA</a></li>
					<li class="nav-item me-5 ms-3 fw-bold"><a class="nav-link text-dark" href="#">MAP</a></li>
				</ul>
					<c:choose>
						<c:when test="${empty sessionScope.PRINCIPAL}">
							<form action="${pageContext.request.contextPath}/user/login">
	                			<button class="btn btn-outline-dark ms-5" type="submit">LOGIN</button>
	            			</form>
	            			<form action="${pageContext.request.contextPath}/user/register">
	                			<button class="btn btn-outline-dark me-5 ms-2" type="submit">JOIN</button>
	            			</form>
						</c:when>
						 
						<c:otherwise>	
							<form action="${pageContext.request.contextPath}/user/logout" method="POST">
	                			<button class="btn btn-outline-dark me-5" type="submit">Logout</button>
	            			</form> 
						</c:otherwise>	
					</c:choose>
			</div>
		</div>
	</nav>

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- The slideshow/carousel -->

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/img/test1.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test2.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test3.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>


</body>
</html>

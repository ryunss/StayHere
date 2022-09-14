<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/0ea8cc9cbf.js"
	crossorigin="anonymous"></script>

</head>
<body>


	<nav
		class="navbar navbar-expand-sm bg-white navbar-white navbar-fixed-top">
		<div class="container-fluid">
			<div>
				<%-- 
			<img src="${pageContext.request.contextPath}/img/main0.png" class="ms-3">
		--%>
				<h1 class="ms-5">
					<a class="text-decoration-none fw-bold text-dark"
						href="${pageContext.request.contextPath}/home">여긴 어때</a>
				</h1>
			</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">

				<div>

					<a href="${pageContext.request.contextPath}/room/search"
						class="text-decoration-none fw-boldtext-dark"
						style="color: black; font-weight: bold;">어디로 떠날까요 ? </a> <a
						class="mx-2" style="color: black">|</a> <a
						href="${pageContext.request.contextPath}/room/search"
						class="text-decoration-none fw-boldtext-dark "
						style="margin-right: 350px; color: black; font-weight: bold;">
						언제 떠날까요 ? </a>
				</div>

				<ul class="navbar-nav">
					<c:if test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'ROLE_MEMBER' )}">
						<li class="nav-item ms-3 fw-bold">
						<a class="nav-link text-dark" href="${pageContext.request.contextPath}/room/new">숙소 등록</a></li>
					</c:if>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/room/search">숙소 검색</a></li>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/qna/list">문의하기</a></li>
					<li class="nav-item me-5 ms-3 fw-bold"><a
						class="nav-link text-dark" href="#">지도</a></li>
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
						<form action="${pageContext.request.contextPath}/user/logout"
							method="POST">
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
				<img src="${pageContext.request.contextPath}/img/test1.jpg"
					class="mx-auto d-block" alt="New York" class="d-block"
					style="width: 1800px" height="850px">
				<div class="carousel-caption"
					style="width: 250px; height: 250px; background-color: white; margin-left: 1200px; margin-bottom: 75px;">
					<h3 style="color: black">test</h3>
					<p style="color: black">asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test2.jpg"
					class="mx-auto d-block" alt="New York" class="d-block"
					style="width: 1800px" height="850px">
				<div class="carousel-caption"
					style="width: 250px; height: 250px; background-color: white; margin-left: 1200px; margin-bottom: 75px;">
					<h3 style="color: black">test</h3>
					<p style="color: black">asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test3.jpg"
					class="mx-auto d-block" alt="New York" class="d-block"
					style="width: 1800px" height="850px">
				<div class="carousel-caption"
					style="width: 250px; height: 250px; background-color: white; margin-left: 1200px; margin-bottom: 75px;">
					<h3 style="color: black">test</h3>
					<p style="color: black">asdasd</p>
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

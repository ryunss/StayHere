<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- KaKao Login Js -->

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
		<nav class="navbar navbar-expand-sm bg-white navbar-white fixed-top" style="border-bottom: solid 1px gray;">
		<div class="container-fluid">
			<div>
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
						style="color: black; font-weight: bold;">어디로 떠날까요 ? </a>
						<a class="mx-2" style="color: black">|</a> <a
						href="${pageContext.request.contextPath}/room/search"
						class="text-decoration-none fw-boldtext-dark "
						style="margin-right: 400px; color: black; font-weight: bold;">
						언제 떠날까요 ? </a>
				</div>

				<ul class="navbar-nav">
					<c:if
						test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'REGISTER_MEMBER' )}">
						<li class="nav-item ms-3 fw-bold"><a
							class="nav-link text-dark"
							href="${pageContext.request.contextPath}/room/register">숙소 등록</a></li>
					</c:if>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/room/search">숙소 검색</a></li>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/room/list">숙소 목록</a></li>
					<li class="nav-item ms-3 me-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/qna/list">문의하기</a></li>

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
	<hr>
	<div class="container mt-5 text-center">
		<form action="${pageContext.request.contextPath }/user/login"
			method="POST">
			<h1 class="h3 mb-3 fw-normal" style="margin-top:150px;">L O G I N</h1>
			<h5 class="h5 mb-5 fw-normal">로그인</h5>
			<div class="w-50" style="margin: 0 auto">
			</div>
			<div class="row mt-5">
				<div class="col-12 text-danger">${REDIRECT_ATTR.error }</div>
			</div>
			<div class="form-floating w-50 mt-5" style="margin: 0 auto">
				<input type="text" class="form-control" name="username"
					id="username" value="${REDIRECT_ATTR.username }"
					placeholder="User Name" required> <label for="username">Username</label>
			</div>
			<div class="form-floating mt-2 w-50" style="margin: 0 auto">
				<input type="password" class="form-control" name="password"
					id="password" value="" placeholder="Password" required> <label
					for="password">Password</label>
			</div>
			<button class="w-50 btn btn-lg btn-dark mt-5" type="submit">로그인</button>
			<a class="w-50 btn btn-lg btn-outline-dark mt-2"
				href="${pageContext.request.contextPath}/user/register">회원가입</a>
		</form>
	</div>

	

</body>
</html>

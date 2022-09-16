<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/0ea8cc9cbf.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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
					<c:if
						test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'ROLE_MEMBER' )}">
						<li class="nav-item ms-3 fw-bold"><a
							class="nav-link text-dark"
							href="${pageContext.request.contextPath}/room/new">숙소 등록</a></li>
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
	<hr>
	<div id="wrap">
		<div id="s">
			검색조건설정
			<form action="searchOk.jsp" method="post">
				지역 : <select name="region">
					<option value="seoul">서울</option>
					<option value="kwang">광주</option>
					<option value="busan">부산</option>
					<option value="kang">강릉</option>
				</select> 인원 : <select name="personnel">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select> 숙소 유형 : <select name="category">
					<option value="house">게스트하우스</option>
					<option value="hotel">호텔</option>
					<option value="pension">펜션</option>
				</select> 가격 : <select name="price">
					<option value="20000">20000</option>
					<option value="50000">50000</option>
					<option value="100000">100000</option>
					<option value="200000">200000</option>
				</select> <input type="submit" value="검색">
			</form>
		</div>
		<h3>검색결과</h3>
		<hr>
		<div></div>
	</div>

</body>
</html>
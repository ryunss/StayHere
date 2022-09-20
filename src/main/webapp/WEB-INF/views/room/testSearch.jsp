<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700;900&family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#size{
		width: 500px;
		height: hidden;
		margin : 0 auto;
		color : white;
	}
	#all{
		background-color : black;
		width: 100%;
		height: 700px;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-white navbar-white fixed-top"
		style="border-bottom: solid 1px gray;">
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

					<a href="${pageContext.request.contextPath}/room/testSearch"
						class="text-decoration-none fw-boldtext-dark"
						style="color: black; font-weight: bold;">어디로 떠날까요 ? </a> <a
						class="mx-2" style="color: black">|</a> <a
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
						href="${pageContext.request.contextPath}/room/testSearch">숙소 검색</a></li>
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
	
	<br><br><br>
	<div id="all">
<form id="size" action="testSearchOk" method="POST">
<br><br><br><br><br>
	지역	<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="region">
 		<option selected value="서울">서울</option>
  		<option value="경주">경주</option>
 		<option value="부산">부산</option>
 		<option value="강릉">강릉</option>
	</select>

	인원	<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="personnel">
 		<option selected value="1">1명</option>
  		<option value="2">2명</option>
 		<option value="3">3명</option>
 		<option value="4">4명</option>
	</select>

	숙소 유형 <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="category">
 		<option selected value="호텔">호텔</option>
  		<option value="펜션">펜션</option>
	</select>

	가격 <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="price">
 		<option selected value="50000">50,000원</option>
		<option value="100000">100,000원</option>
		<option value="200000">200,000원</option>
		<option value="300000">300,000원</option>
	</select>
	<br>
	<div class="d-grid">
			<button type="submit" class="btn mt-3 btn-block btn-light" >검색</button>
	</div>
</form>
</div>
</body>
</html>
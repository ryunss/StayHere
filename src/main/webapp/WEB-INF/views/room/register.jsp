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

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#frm {
	width: 700px;
	height: hidden;
	margin: 0 auto;
}

h4 {
	text-align: center;
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

					<a href="${pageContext.request.contextPath}/room/search"
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
	<form id="frm" action="register" method="post">

		<h1 class="h3 mb-5 fw-normal text-center" style="margin-top: 120px;">R
			E G I S T E R</h1>

		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				이름</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-name" id="name"
				name="name">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				주소</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-address"
				id="address" name="address">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlTextarea1" class="form-label">숙소
				지역</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-region" id="region"
				name="region">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				유형</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-category"
				id="category" name="category">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				요약</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-summary"
				id="summary" name="summary">
		</div>

		<div class="col-md-12">
			<label for="exampleFormControlTextarea1" class="form-label">숙소
				정보</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="3" placeholder="info" id="info" name="info"></textarea>
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				인원</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-personnel"
				id="personnel" name="personnel">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				금액</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-price" id="price"
				name="price">
		</div>
		<div class="col-md-12">
			<label for="exampleFormControlInput1" class="form-label">숙소
				이미지</label> <input type="text" class="form-control"
				id="exampleFormControlInput1" placeholder="room-image" id="image"
				name="image">
		</div>


		<div class="d-grid">
			<button type="submit" class="btn mt-3 btn-block btn-dark" >등록</button>
		</div>
	</form>
</body>
</html>
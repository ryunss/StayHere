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
	#best{
		border: 2px solid grey;
		width: 355px;
		margin : 0 auto;
	}
</style>
<body>


	<nav class="navbar navbar-expand-sm bg-white navbar-white fixed-top"
		style="border-bottom: solid 1px gray;">
		<div class="container-fluid">
			<div>
				<h1 class="ms-5">
					<a class="text-decoration-none fw-bold text-dark"
						href="${pageContext.request.contextPath}/home">StayHere</a>
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
					<li class="nav-item ms-3 me-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/map">둘러보기</a></li>

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



	<form id="frm">
		<div class="container text-center" style="margin-top: 100px;">
			<h1 class="h3 mb-5 fw-normal">L I S T</h1>
			<br>
			
				<c:forEach var="dtoa" items="${listViewcnt}">
				<img src="${pageContext.request.contextPath}/img/best.png"/>
				<div id="best">
					<tr>
						<td>
							<a  href="detail?num=${dtoa.num}">
								<img src="${pageContext.request.contextPath}/${dtoa.image }" style="width: 350px; height: 150px;"/>
							</a>
							<br><b>${dtoa.name }</b>	
						</td>
					</tr>
				</div>	
				</c:forEach>
			
				<hr>
			<table class="table table-hover">
				<thead class="table-active">
					<tr>
						<th>#</th>
						<th>숙소이미지</th>
						<th>숙소이름</th>
						<th>숙소요약</th>
						<th>지역</th>
						<th>종류</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.num }</td>
							<td><a href="detail?num=${dto.num}"><img
									src="${pageContext.request.contextPath}/${dto.image }"
									style="width: 350px; height: 150px;"/></a></td>
							<td>${dto.name }</td>
							<td>${dto.summary }</td>
							<td>${dto.region }</td>
							<td>${dto.category }</td>
							<td>${dto.price }원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>

</body>


</html>
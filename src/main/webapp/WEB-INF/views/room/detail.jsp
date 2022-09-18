<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0}">
		<script>
			alert("해당 숙소가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="dto" value="${list[0]}" />
		<!DOCTYPE html>
		<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	const conPath = "${pageContext.request.contextPath}";
	const logged_id = ${PRINCIPAL.user_num};
</script>
<script src="${pageContext.request.contextPath }/js/roomDetail.js"></script>

</head>

<script>
	function chkDelete() {
		let answer = confirm("삭제하시겠습니까?");
		if (answer) {
			document.forms['frmDelete'].submit();
		}
	}
</script>

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

	<div class="container ">
		<h1 class="h3 fw-normal mb-2 text-center" style="margin-top: 100px;">D
			E T A I L - ${dto.name }</h1>

		<div class="mb-3 mt-3 clearfix">
			<span class="float-end">조회수 : ${dto.viewcnt}</span>
		</div>

		<section>
			<form name="frmDelete" action="delete" method="POST">
				<input type="hidden" name="num" value="${dto.num }">
			</form>
			<div class="container mt-3">
				<img src="http://localhost:8085/StayHere/${dto.image }"
					alt="${dto.name }" class="mx-auto d-block" style="width: 100%" />
			</div>
			<table class="table text-center mt-3">
				<thead>
					<tr>
						<th>숙소 이름</th>
						<th>숙소 종류</th>
						<th>숙소 가격</th>
						<th>숙소 정원</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-center">
						<td>${dto.name }</td>
						<td>${dto.category }</td>
						<td>${dto.price }원</td>
						<td>${dto.personnel }</td>
					</tr>
				</tbody>
			</table>
			<div class="mb-3 mt-3">
				<label for="info">정보</label> <span class="form-control">${dto.summary}
					<br> ${dto.info}
				</span>
			</div>

			<!-- 하단 링크 -->
			<a class="btn btn-outline-dark mt-3" href="list">목록</a>
			<c:if
				test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'ROLE_MEMBER' )}">
				<a class="btn btn-outline-dark" href="update?num=${dto.num}">수정</a>
				<button type="button" class="btn btn-outline-dark"
					onclick="chkDelete()">삭제</button>
				<a class="btn btn-outline-dark" href="register">작성</a>
			</c:if>
			<!-- 하단 링크 -->

			<!-- 댓글 -->
			<jsp:include page="comment.jsp"></jsp:include>
		</section>
	</div>
	<jsp:include page="footer.jsp" />
</body>
		</html>


	</c:otherwise>
</c:choose>
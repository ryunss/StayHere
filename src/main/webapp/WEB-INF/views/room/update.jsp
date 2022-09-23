<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0}">
		<script>
			alert("해당 숙소가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="dto" value="${list[0]}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
    <div class="container mt-3">
        <h2>수정</h2>
        <hr>
        <div class="mb-3 mt-3 clearfix">
            <span class="float-start me-2">${dto.name }</span>
            <span class="float-end ms-4">Number : ${dto.num}</span>
            <span class="float-end">조회수 : ${dto.viewcnt}</span>
        </div>
 
        <form action="update" method="POST">
            <input type="hidden" name="num" value="${dto.num}"/>
            <div class="mb-3">
                <label for="image">이미지</label>
                <input type="text" class="form-control" id="image" name="image" value="${dto.image}" required>
            </div>    
            <div class="mb-3 mt-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" value="${dto.name}" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="info">정보</label>
                <textarea class="form-control" rows="5" id="info" name="info">${dto.info}</textarea>
            </div>
 
            <!-- 하단 링크 -->
            <button type="submit" class="btn btn-outline-dark">수정완료</button>
            <button type="button" class="btn btn-outline-dark" onclick="history.back()">이전으로</button>
            <a class="btn btn-outline-dark" href="list">목록</a>
            <!-- 하단 링크 -->

        </form>
    </div>
</body>
</html>

	</c:otherwise>
</c:choose>
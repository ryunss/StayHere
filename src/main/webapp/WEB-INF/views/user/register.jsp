<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원가입</title>
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
	                			<button class="btn btn-outline-dark ms-5 w-60" type="submit">LOGIN</button>
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
	<hr>
    <div class="container mt-3">

        <div class="row mt-5">
            <div class="col-12 text-center">
                <h1 class="h3 mb-3 fw-normal">J O I N</h1>
				<h5 class="h5 mb-5 fw-normal">회원가입</h5>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12 text-danger">
                ${REDIRECT_ATTR.error }
            </div>
        </div>
        <div class="row">
            <form method="POST" action="${pageContext.request.contextPath}/user/register">
                <div class="form-group mt-3">
                    <label for="username">사용자 아이디</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="사용자아이디" value="${REDIRECT_ATTR.username }" required>
                </div>
                <div class="form-group mt-3">
                    <label for="name">사용자 이름</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="사용자 이름" value="${REDIRECT_ATTR.name }" required>
                </div>
                <div class="form-group mt-3">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
                </div>
                <div class="form-group mt-3">
                    <label for="re-password">비밀번호 확인</label>
                    <input type="password" class="form-control" id="re-password" name="re-password" placeholder="비밀번호 확인" required>
                </div>
                <div class="text-center">
                <button class="w-50 btn btn-lg btn-dark my-3" type="submit">등록</button>
                </div>
            </form>
        </div>

    </div>
</body>

</html>




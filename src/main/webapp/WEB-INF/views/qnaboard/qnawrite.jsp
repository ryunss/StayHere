<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--	<%-- 웹에디터 Summernote .  jQuery 필요 --%>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->

<title>작성</title>
</head>

<!-- <script>
$(document).ready(function(){
	$('#content').summernote({
		height: 300,
	});
});
</script>  -->


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
	<div class="text-center">
	<h1 class="h3 fw-normal" style="margin-top:100px;">Q & A</h1>
	<h1 class="h3 my-3 fw-normal">R E G I S T E R</h1>
	</div>
	<div class="container mt-3">
		<h2>작성</h2>
		<hr>
		<form name="frm" action="write" method="post"
			enctype="Multipart/form-data">
			<div class="mb-3">
				<label for="name">작성자:</label> <span class="form-control">${PRINCIPAL.user_id }
					(${PRINCIPAL.user_name })</span>
			</div>
			<div class="mb-3 mt-3">
				<label for="subject">제목:</label> <input type="text"
					class="form-control" id="subject" placeholder="제목을 입력하세요"
					name="qna_subject" required>
			</div>
			<div class="mb-3 mt-3">
				<label for="content">내용:</label>
				<textarea class="form-control" rows="5" id="content"
					placeholder="내용을 입력하세요" name="qna_content"></textarea>
			</div>

			<!-- 첨부파일 -->
			<%-- 상단에 jQuery 추가하기--%>
			<div class="container mt-3 mb-3 border rounded">
				<div class="mb-3 mt-3">
					<label>첨부파일:</label>
					<div id="files"></div>
					<button type="button" id="btnAdd" class="btn btn-secondary">추가</button>
				</div>
			</div>
			<script>
			var i = 0;
			$("#btnAdd").click(function(){
			    $("#files").append(`
			                <div class="input-group mb-2">
			                <input class="form-control col-xs-3" type="file" name="upfile\${i}"/>
			                <button type="button" class="btn btn-outline-danger" onclick="$(this).parent().remove()">삭제</button>
			                </div>`);
			    i++;
			});
			</script>
			<!-- 첨부파일 -->


			<button type="submit" class="btn btn-outline-dark">작성완료</button>
			<a class="btn btn-outline-dark" href="list">목록</a>
		</form>

	</div>

</body>

</html>

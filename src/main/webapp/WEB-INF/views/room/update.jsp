<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
<style>
header, footer {
	width: 100%;
	height: 100px;
	background-color: green;
}
#wrap{
	width: 1200px;
	height: hidden;
	margin: 0 auto;
/*	border: 3px solid red; */
}
#img{
	width: 1200px;
	height: 300px;
	border: 1px solid blue;
	margin-bottom: 20px;
}
#name{
	width: 1200px;
	height: 100px;
	border: 1px solid blue;
	margin-bottom: 20px;
}
#info{
	width: 1200px;
	height: 200px;
	border: 1px solid blue;
	margin-bottom: 20px;
}

h3{
	text-align : center;
}
</style>
</head>
<body>
<header>
	메인로고
	<div>임시 조회수 체크 : ${dto.viewcnt }</div>
</header>
<form action="update" method="post">
	<div id="wrap">
		<input type="hidden" name="num" value="${dto.num }"/>
		<div id="img" name="image">${dto.image }</div>
		<input type="text" id="name" name="name"value="${dto.name }"/>
		<input type="textarea" id="info" name="info"value="${dto.info }"/>
		<button type="submit" class="btn btn-outline-info">수정완료</button>
		<button type="button" class="btn btn-outline-info" onclick="histoy.back()">이전으로</button>
		<a href="list" class="btn btn-outline-info">목록</a>


	<h3>숙소후기</h3>
	<hr>
	<table>
		<thead>
			<tr>
				<th style="width: 16.66%">작성자</th>
				<th>내용</th>
				<th style="width: 16.66%">작성일</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
	</div>
</form>	
	<footer>
	project
</footer>
</body>
</html>

	</c:otherwise>
</c:choose>
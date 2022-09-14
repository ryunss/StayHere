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
<style>
header, footer {
	width: 100%;
	height: 100px;
	background-color: green;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap');
        *{
            font-family: 'Noto Sans KR', sans-serif;
            font-size : 20px;
        }
</style>
</head>
<body>
<header>
	메인로고
</header>
    <div class="container mt-3">
        <h2>수정</h2>
        <hr>
        <div class="mb-3 mt-3 clearfix">
            <span class="float-start me-2">image ${dto.image}</span>
            <span class="float-end ms-4">num ${dto.num}</span>
            <span class="float-end">조회수: ${dto.viewcnt}</span>
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
<footer>
	project
</footer>
</body>
</html>

	</c:otherwise>
</c:choose>
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
</style>
</head>

<script>
function chkDelete(){
	let answer = confirm("삭제하시겠습니까?");
	if(answer){
		document.forms['frmDelete'].submit();
	}
}
</script>

<body>
<header>
	메인로고
</header>

<div class="container mt-3">
        <h2>조회 - ${dto.name}</h2>
        <hr>
        <div class="mb-3 mt-3 clearfix">
            <span class="float-start me-2">${dto.image }</span>
            <span class="float-end ms-4">${dto.name}</span>
            <span class="float-end">${dto.viewcnt}</span>
        </div>
 
        <section>
        <form name="frmDelete" action="delete" method="POST">
        	<input type="hidden" name="num" value="${dto.num }">
        </form>
            <div class="mb-3">
                <label for="image">숙소이미지</label>
                <span class="form-control" >${dto.image}</span>
            </div>    
            <div class="mb-3 mt-3">
                <label for="name">숙소명</label>
                <span class="form-control" >${dto.name}</span>
            </div>    
            <div class="mb-3 mt-3">
                <label for="info">정보</label>
                <span class="form-control" >${dto.info}</span>
            </div>    
 
            <!-- 하단 링크 -->
            <a class="btn btn-outline-dark" href="update?num=${dto.num}">수정</a>
            <a class="btn btn-outline-dark" href="list">목록</a>
            <button type="button" class="btn btn-outline-dark" onclick="chkDelete()">삭제</button>
            <a class="btn btn-outline-dark" href="register">작성</a>
            <!-- 하단 링크 -->        
 
        </section>
    </div>
<footer>
	project
</footer>
</body>
</html>

	
	</c:otherwise>
</c:choose>
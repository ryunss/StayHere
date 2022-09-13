<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result == 0}">
		<script>
			alert("등록 실패. 다시 시도해주세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록 성공");
			location.href = "detail?num=${dto.qna_num}";
		</script>
	</c:otherwise>
</c:choose>

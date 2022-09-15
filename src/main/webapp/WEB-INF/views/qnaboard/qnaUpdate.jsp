<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0}">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
<c:otherwise>
    	<c:set var="dto" value="${list[0]}"/>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
<title>수정 - ${dto.qna_subject }</title>
</head>
<body>
    <%-- 인증 헤더 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="container mt-3">
        <h2>수정</h2>
        <hr>
        <div class="mb-3 mt-3 clearfix">
            <span class="float-start me-2">id: ${dto.user_num }</span>
            <span class="float-end ms-4">작성일: ${dto.regDateTime }</span>
        </div>

        <form action="update" method="POST" enctype="Multipart/form-data">
            <input type="hidden" name="qna_num" value="${dto.qna_num }"/>
            <div class="mb-3">
                <label for="name">작성자:</label>
                <span class="form-control" readonly>${dto.user_num.user_id } (${dto.user_num.user_id })</span>
            </div>    
            <div class="mb-3 mt-3">
                <label for="subject">제목:</label>
                <input type="text" class="form-control" id="subject" placeholder="제목을 입력하세요" name="qna_subject" value="${dto.qna_subject}" required>
            </div>
            <div class="mb-3 mt-3">
                <label for="content">내용:</label>
                <textarea class="form-control" rows="5" id="content" placeholder="내용을 입력하세요" name="qna_content">${dto.qna_content}</textarea>
            </div>
            
			<!-- 기존 첨부파일  목록 (삭제 가능) -->
			<c:if test="${not empty fileList && fn:length(fileList) > 0 }">
			<div class="container mt-3 mb-3 border rounded">
			    <div id="delFiles"></div>  <!-- 삭제할 file 의 id 값(들)을 담기위한 div -->
			    <div class="mb-3 mt-3">
			        <label>첨부파일:</label>                
			        <c:forEach var="fileDto" items="${fileList }">
				        <div class="input-group mb-2">
				            <input class="form-control col-xs-3" type="text" readonly value="${fileDto.file_source }">
				            <button type="button" class="btn btn-outline-danger"
				            	onclick="deleteFiles(${fileDto.file_num}); $(this).parent().remove()">삭제</button>
				        </div>
			        </c:forEach>
			    </div>
			</div>
			</c:if>
			<script>
			function deleteFiles(fileNum){
			    $("#delFiles").append(`<input type='hidden' name='delfile' value='\${fileNum}'>`);				
			}
			</script>
			<!-- 기존 첨부파일  목록 (삭제 가능) -->
			
			<!-- 새로운 첨부파일 추가 -->
			<!-- 새로운 첨부파일 (추가가능) -->
			<div class="container mt-3 mb-3 border rounded">
			    <div class="mb-3 mt-3">
			        <label>첨부파일추가:</label>
			        <div id="files">
			       
			        </div>
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
			<!-- 새로운 첨부파일 추가 -->

            <!-- 하단 링크 -->
            <button type="submit" class="btn btn-outline-dark">수정완료</button>
            <button type="button" class="btn btn-outline-dark" onclick="history.back()">이전으로</button>
            <a class="btn btn-outline-dark" href="list?page=${page != null ? page : ''}">목록</a>
            <!-- 하단 링크 -->

        </form>
    </div>
</body>

</html>
	</c:otherwise>
</c:choose>
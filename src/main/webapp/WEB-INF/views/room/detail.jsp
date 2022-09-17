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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   const conPath = "${pageContext.request.contextPath}";
   const logged_id = ${PRINCIPAL.user_num};
</script>
<script src="${pageContext.request.contextPath }/js/roomDetail.js"></script>

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
<jsp:include page="header.jsp"/>

<div class="container mt-3">
        <h2>${dto.name}</h2>
        <hr>
        <div class="mb-3 mt-3 clearfix">
            <span class="float-end">조회수 :  ${dto.viewcnt}</span>
        </div>
 
        <section>
        <form name="frmDelete" action="delete" method="POST">
           <input type="hidden" name="num" value="${dto.num }">
        </form>
            <div class="container mt-3">
           <img src="http://localhost:8085/StayHere/${dto.image }" alt="${dto.name }"
              class="mx-auto d-block" style="width:50%"/> 
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
 
          <!-- 댓글 -->
          <jsp:include page="comment.jsp"></jsp:include>
        </section>
    </div>
<jsp:include page="footer.jsp"/>
</body>
</html>

   
   </c:otherwise>
</c:choose>
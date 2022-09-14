 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#frm{
		width: 700px;
		height: hidden;
		margin : 0 auto;
	}
	
	h4{
		text-align : center;
	}
</style>
</head>
<body>
<form id="frm">
 <div class="container mt-3">
    <h2>숙소 리스트</h2>
	<br>
    <table class="table table-hover">
      <thead class="table-active">
        <tr>
          <th>#</th>
          <th>숙소이미지</th>
          <th>숙소이름</th>
          <th>지역</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="dto" items="${list}">
        <tr>
          <td>${dto.num }</td>
          <td><a href="detail?num=${dto.num}"><img src="${dto.image }" alt="${dto.name }"/></a></td>
          <td>${dto.name }</td>
          <td>${dto.region }</td>
          <td>${dto.viewcnt }</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</form>
</body>
</html>
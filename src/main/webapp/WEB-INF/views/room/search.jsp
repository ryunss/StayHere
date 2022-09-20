<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap{
	width: 1200px;
	height: hidden;
	margin: 0 auto;
}

.wrapper {
	width: 1200px;
	height: 250px;
	margin: 0 auto;
	display: flex;
	align-items: center;
}

.wrapper div {
	margin : 10px;
	width: 300px;
	height: 200px;
	background-color: blanchedalmond;
}

.container {
	justify-content: space-around;
}

#s {
	margin-top : 10px;
	margin-bottom : 10px;
	width: 100%;
	height: hidden;
	text-align : center;
	background-color: black;
	color: white;
	font-size : 40px;
}
.text{
	text-align : center;
}
#sub{
	height: hidden;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<br><br><br><br>
<div id="wrap">
<div id="s">SEARCH</div>
<form action="searchOk" method="post">
	지역 : <select name="region">
		<option value="seoul">서울</option>
		<option value="kwang">광주</option>
		<option value="busan">부산</option>
		<option value="kang">강릉</option>
	</select>
	인원 : <select name="personnel">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
	</select>
	숙소 유형 : <select name="category">
		<option value="house">게스트하우스</option>
		<option value="hotel">호텔</option>
		<option value="pension">펜션</option>
	</select>
	가격 : <select name="price">
		<option value="20000">20000</option>
		<option value="50000">50000</option>
		<option value="100000">100000</option>
		<option value="200000">200000</option>
	</select>
	<input type="submit" value="검색"> 
</form>
<h3>검색결과</h3>
<hr>
	<div id="sub">
	    <div class="wrapper container">
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test11.jpg">슬로우소랑</div>
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test22.jpg">생활서가</div>
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test33.jpg">공간동백</div>
	    </div>
	    <div class="wrapper container">
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test44.jpg">선현재</div>
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test55.jpg">테오리아</div>
	      <div class="text"><img src="${pageContext.request.contextPath}/img/test66.jpg">브리드호텔</div>
	    </div>
    </div>
</div>
</body>
</html>
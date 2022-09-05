<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}

.wrapper {
	width: 1200px;
	height: 250px;
	margin: 0 auto;
	display: flex;
	align-items: center;
}

.wrapper div {
	border: 2px solid black;
	width: 300px;
	height: 200px;
	background-color: blanchedalmond;
}

.container {
	justify-content: space-evenly;
}

#s {
	margin-top : 10px;
	margin-bottom : 10px;
	border : 3px solid black;
	width: 100%;
	height: 100px;
	text-align : center;
	background-color: skyblue;
}
</style>
</head>
<body>
<header>
	메인로고
</header>
<div id="wrap">
<div id="s">검색조건설정</div>
<form action="FormOk" method="post">
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
	<div>
	    <div class="wrapper container">
	      <div><p>img1</p></div>
	      <div><p>img2</p></div>
	      <div><p>img3</p></div>
	    </div>
	    <div class="wrapper container">
	      <div><p>img4</p></div>
	      <div><p>img5</p></div>
	      <div><p>img6</p></div>
	    </div>
    </div>
</div>
<footer>
	project
</footer>
</body>
</html>
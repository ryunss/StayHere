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
	border: 3px solid red;
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
</header>

<div id="wrap">
	<div id="img">숙소 이미지</div>
	<div id="name">숙소이름</div>
	<div id="info">숙소정보</div>
	
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
<footer>
	project
</footer>
</body>
</html>
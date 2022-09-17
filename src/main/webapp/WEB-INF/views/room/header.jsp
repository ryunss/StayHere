<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400;700;900&family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	width: 100%;
	height: 170px;
	margin: 0 auto;
	text-align: center;
	padding: 25px 0px;
	color: white;
	background-color : black;	
}

header ul {
  display: inline-block;
  overflow: hidden;
}

header li {
  float: left;
  margin: 20px;
  text-align: center;
  font-weight: 600;
  color: #222;
}

header li:hover {
  border-bottom: 2px solid red;
}

ul, ol {
  list-style: none;
}

a {
  text-decoration: none;
  color: white;
}

@import
	url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap');

* {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}
#header{
font-size: 35px;
color: skyblue;
}

</style>
</head>
<body>
<header>
	<a id="header" href="${pageContext.request.contextPath}/home" class="logo">여긴어때<br /></a>
        <ul>
          <li><a href="${pageContext.request.contextPath}/room/list">LIST</a></li>
          <li><a href="${pageContext.request.contextPath}/room/search">SEARCH</a></li>
          <li><a href="${pageContext.request.contextPath}/qna/qnaList">Q&A</a></li>
          <li><a href="#">MAP</a></li>
        </ul>
</header>
</body>
</html>
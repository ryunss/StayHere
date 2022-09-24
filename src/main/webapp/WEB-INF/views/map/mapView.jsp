<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/0ea8cc9cbf.js" crossorigin="anonymous"></script>

<script>
   	const conPath = "${pageContext.request.contextPath}";
</script>

<title>둘러보기</title>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-white navbar-white fixed-top" style="border-bottom: solid 1px gray;">
		<div class="container-fluid">
			<div>
				<h1 class="ms-5">
					<a class="text-decoration-none fw-bold text-dark"
						href="${pageContext.request.contextPath}/home">StayHere</a>
				</h1>
			</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">

				<div>

					<a href="${pageContext.request.contextPath}/room/search"
						class="text-decoration-none fw-boldtext-dark"
						style="color: black; font-weight: bold;">어디로 떠날까요 ? </a>
						<a class="mx-2" style="color: black">|</a> <a
						href="${pageContext.request.contextPath}/room/search"
						class="text-decoration-none fw-boldtext-dark "
						style="margin-right: 400px; color: black; font-weight: bold;">
						언제 떠날까요 ? </a>
				</div>

				<ul class="navbar-nav">
					<c:if
						test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'REGISTER_MEMBER' )}">
						<li class="nav-item ms-3 fw-bold"><a
							class="nav-link text-dark"
							href="${pageContext.request.contextPath}/room/register">숙소 등록</a></li>
					</c:if>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/room/testSearch">숙소 검색</a></li>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/room/list">숙소 목록</a></li>
					<li class="nav-item ms-3 me-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/qna/list">문의하기</a></li>
					<li class="nav-item ms-3 me-3 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/map">둘러보기</a></li>

				</ul>
				<c:choose>
					<c:when test="${empty sessionScope.PRINCIPAL}">
						<form action="${pageContext.request.contextPath}/user/login">
							<button class="btn btn-outline-dark ms-5" type="submit">LOGIN</button>
						</form>
						<form action="${pageContext.request.contextPath}/user/register">
							<button class="btn btn-outline-dark me-5 ms-2" type="submit">JOIN</button>
						</form>
					</c:when>

					<c:otherwise>
						<form action="${pageContext.request.contextPath}/user/logout"
							method="POST">
							<button class="btn btn-outline-dark me-5" type="submit">Logout</button>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
	<hr>
<!-- 지도를 표시할 div 입니다 -->

<div id="map" style="height:550px; width:100%;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d05889940ade5136b8cb7f67c11d98e"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826004661, 126.978652258309), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '그로브동산', 
        latlng: new kakao.maps.LatLng(37.9809766783071, 128.758107504444)
    },
    {
        title: '테오리아', 
        latlng: new kakao.maps.LatLng(35.8184817416167, 127.151035925363)
    },
    {
        title: '슬로우소랑', 
        latlng: new kakao.maps.LatLng(34.8345011754368, 128.557738596639)
    },
    {
        title: '브리도호텔',
        latlng: new kakao.maps.LatLng(37.9709440747767, 128.762096534783)
    },
    {
        title: '윌로우 하우스',
        latlng: new kakao.maps.LatLng(37.9476094212341, 127.775438959201)
    },
    {
        title: '호미양양',
        latlng: new kakao.maps.LatLng(38.0215614061244, 128.724324496461)
    },
    {
        title: '선현재',
        latlng: new kakao.maps.LatLng(33.5369621366778, 126.617263506519)
    },
    {
        title: '프룩스 플럭스 호텔',
        latlng: new kakao.maps.LatLng(35.6824432487055, 129.470756991552)
    },
    {
        title: '생활서가',
        latlng: new kakao.maps.LatLng(37.6428978206228, 126.939206630306)
    },
    {
        title: '토리코티지X하시시박',
        latlng: new kakao.maps.LatLng(33.5418643628924, 126.638198727718)
    },
    {
        title: '공간동백',
        latlng: new kakao.maps.LatLng(33.5161499607196, 126.70606459096)
    },
    {
        title: '하은재',
        latlng: new kakao.maps.LatLng(37.5818820409301, 126.971261467596)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}


</script>

</body>
</html>
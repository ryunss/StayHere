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

<form id="frm"action="register" method="post">

<br><hr><h4>숙소 등록</h4><hr><br>
	
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 이름</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-name" id="name" name="name">
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 주소</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-address" id="address" name="address">
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 유형</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-category" id="category" name="category">
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlTextarea1" class="form-label">숙소 정보</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="info" id="info" name="info"></textarea>
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlTextarea1" class="form-label">숙소 지역</label>
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-region" id="region" name="region">
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 인원</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-personnel" id="personnel" name="personnel"> 
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 금액</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-price" id="price" name="price">
	</div>
	<div class="col-md-12">
		<label for="exampleFormControlInput1" class="form-label">숙소 이미지</label> 
		<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="room-image" id="image" name="image">
	</div>
	<button type="submit" class="btn btn-info">등록</button>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

<title>로그인</title>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="1059151165091-l4hdvpjtr28k6pstr1sn621k17re7o12.apps.googleusercontent.com">
<!-- KaKao Login Js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/kakao.js"></script>
<!-- Google Login Js -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async
	defer></script>
<script
	src="https://apis.google.com/js/platform.js?onload=triggerGoogleLoaded"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<script src="${pageContext.request.contextPath}/platform.js" async defer></script>
<!-- Naver Login Js -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>

<body>
	<nav class="navbar navbar-expand-sm bg-white navbar-white">
		<div class="container-fluid">
			<img src="${pageContext.request.contextPath}/img/mainlogo.png"
				class="ms-5" height="75px">

			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark" href="#">SEARCH</a></li>
					<li class="nav-item ms-3 fw-bold"><a
						class="nav-link text-dark" href="#">QnA</a></li>
					<li class="nav-item me-3 ms-3 fw-bold"><a
						class="nav-link text-dark" href="#">MAP</a></li>
					<li class="nav-item me-5 ms-5 fw-bold"><a
						class="nav-link text-dark"
						href="${pageContext.request.contextPath}/user/login">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-3 text-center">
		<form action="${pageContext.request.contextPath }/user/login"
			method="POST">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<div class="row mt-5">
				<div class="col-12 text-danger">${REDIRECT_ATTR.error }</div>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="username"
					id="username" value="${REDIRECT_ATTR.username }"
					placeholder="name@example.com" required> <label
					for="username">Username</label>
			</div>
			<div class="form-floating mt-1">
				<input type="password" class="form-control" name="password"
					id="password" value="" placeholder="Password" required> <label
					for="password">Password</label>
			</div>


			<button class="w-100 btn btn-lg btn-primary my-1" type="submit">로그인</button>
			<a class="w-100 btn btn-lg btn-primary my-1"
				href="${pageContext.request.contextPath}/user/register">회원가입</a>

		</form>
	</div>
	<hr>
<div>
	<!--  Google Login Btn -->
	<div class="g-signin2" style="max-width: 400px; max-height: 60px"
		data-onsuccess="onSignIn" data-theme="dark" data-width="auto"
		data-height="60">
	</div>
	<!--  Naver Login Btn -->
	<div id="naverIdLogin">
		<a id="naverIdLogin_loginButton"> 
		<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0"
			width="100%" height="auto" style="max-width: 400px; max-height: 60px" />
		</a>
	</div>
	<!--  KaKao Login Btn -->
	<div>
		<a id="login-form-btn" href="javascript:loginFormWithKakao()"> <img
			src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
			width="100%" height="auto" style="max-width: 400px; max-height: 60px" />
		</a>
	</div>
</div>
</body>

</html>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-white navbar-white">
		<div class="container-fluid">
			<img src="${pageContext.request.contextPath}/img/mainlogo.png" class="ms-5" height="75px">

			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item ms-3 fw-bold"><a class="nav-link text-dark" href="#">SEARCH</a></li>
					<li class="nav-item ms-3 fw-bold"><a class="nav-link text-dark" href="#">QnA</a></li>
					<li class="nav-item me-3 ms-3 fw-bold"><a class="nav-link text-dark" href="#">MAP</a></li>
					<li class="nav-item me-5 ms-5 fw-bold"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/user/login">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- The slideshow/carousel -->

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/img/test1.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test2.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/img/test3.jpg" class="mx-auto d-block"
					alt="New York" class="d-block" style="width: 1800px" height="850px">
				<div class="carousel-caption">
					<h3>test</h3>
					<p>asdasd</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>


</body>
</html>

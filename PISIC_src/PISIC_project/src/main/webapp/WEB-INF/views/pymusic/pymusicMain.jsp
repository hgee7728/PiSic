<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PISIC CHART</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<style>
.grid-5 {
	flex: 0 0 20%;
	max-width: 20%;
}

.content {
	text-align: center;
}

.btn_genre {
	width: 100%;
	font-size: 30px;
	text-align: center;
}

div.row>div>div{
	background-color: #000000;
}

div.ro1>div:nth-child(1)>div,
div.ro1>div:nth-child(5)>div {
	background-color: #000000;
	border-color: #fc424a;
}

div.ro1>div:nth-child(2)>div,
div.ro1>div:nth-child(6)>div {
	border-color: #ffab00;
}

div.ro1>div:nth-child(3)>div,
div.ro1>div:nth-child(7)>div {
	border-color: #00d25b;
}

div.ro1>div:nth-child(4)>div,
div.ro1>div:nth-child(8)>div {
	border-color: #007bff;
}



div.ro2>div:nth-child(1)>div,
div.ro2>div:nth-child(6)>div {
	border-color: #fc424a;
}

div.ro2>div:nth-child(2)>div,
div.ro2>div:nth-child(7)>div {
	border-color: #ffab00;
}

div.ro2>div:nth-child(3)>div,
div.ro2>div:nth-child(8)>div {
	border-color: #00d25b;
}

div.ro2>div:nth-child(4)>div,
div.ro2>div:nth-child(9)>div {
	border-color: #007bff;
}

div.ro2>div:nth-child(5)>div,
div.ro2>div:nth-child(10)>div {
	border-color: #8f5fe8;
}
</style>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="../_navbar.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">

					<h2 class=" card-title">PICK YOUR MUSIC</h2>
					<br>
					<h3>장르별</h3>
					<div class="row ro1">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=1'">댄스</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=2'">발라드</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=3'">락</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=4'">랩/힙합</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=6'">R&amp;B/소울</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=7'">POP</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=8'">트로트</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=11'">인디</button>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<h3>날씨별</h3>
					<div class="row ro2">
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/weather?'">맑음</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/weather?'">구름
										많음</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/weather?'">흐림</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/weather?'">비</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/weather?'">눈</button>
								</div>
							</div>
						</div>

					</div>
					<br> <br>
					<h3>성별/연령대별</h3>
					<div class="row ro2">
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=101'">10대
										남</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=201'">20대
										남</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=301'">30대
										남</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=401'">40대
										남</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=501'">50대
										남</button>
								</div>
							</div>
						</div>

						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=102'">10대
										여</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=202'">20대
										여</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=302'">30대
										여</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=402'">40대
										여</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/agender?agender=502'">50대
										여</button>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<h3>시간대별</h3>
					<div class="row ro2">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">새벽
										MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">아침
										MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">오후
										MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
										onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">밤
										MIX</button>
								</div>
							</div>
						</div>
					</div>



				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<jsp:include page="../_footer.jsp" />
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/chart.js/Chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<!-- End custom js for this page -->
</body>
</html>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					<div class="row ">
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
										onclick="location.href='<%=request.getContextPath()%>/pymusic/genre?g_no=8'">R&amp;B/소울</button>
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
					
<script>
let latitude ="";
let longitude ="";
function goPyWeather(thisElem){
	var sky = $(thisElem).data("sky");
	var pty = $(thisElem).data("pty");
	sky = (sky)? sky : "";
	pty = (pty)? pty : ""; 
	location.href='<%=request.getContextPath()%>/pymusic/weather?sky='+sky+'&pty='+pty+'&currentLat='+latitude+'&currentLon='+longitude;
}
$(document).ready(function() {
	if ("geolocation" in navigator) { /* geolocation 사용 가능 */
		navigator.geolocation.getCurrentPosition(
			function(data) {
				latitude = data.coords.latitude;
				longitude = data.coords.longitude;
			}, function(error) {
				alert(error);
			}, {
				enableHighAccuracy : true,
				timeout : Infinity,
				maximumAge : 0
			}
		);
	} else { /* geolocation 사용 불가능 */
		alert('geolocation 사용 불가능');
	}
});
</script>
					<div class="row ">
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre" data-sky="맑음"
									onclick="goPyWeather(this);">맑음</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre" data-sky="구름 많음"
									onclick="goPyWeather(this);">구름 많음</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre" data-sky="흐림"
									onclick="goPyWeather(this);">흐림</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre" data-pty="1"
									onclick="goPyWeather(this);'">비</button>
								</div>
							</div>
						</div>
						<div class="grid-5 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre" data-pty="3"
									onclick="goPyWeather(this);">눈</button>
								</div>
							</div>
						</div>

					</div>
					<br> <br>
					<h3>성별/연령대별</h3>
					<div class="row ">
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
					<div class="row ">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
									onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">새벽 MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
									onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">아침 MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
									onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">오후 MIX</button>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<button class="btn btn_genre"
									onclick="location.href='<%=request.getContextPath()%>/pymusic/time?'">밤 MIX</button>
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
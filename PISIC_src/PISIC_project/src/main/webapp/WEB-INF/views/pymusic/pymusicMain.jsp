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
									<div>
										<button class="btn btn_genre">댄스</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">발라드</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">락</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">랩/힙합</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">R&B/소울</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">POP</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">트로트</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">인디</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<h3>날씨별</h3>
					<div class="row ">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">맑은날</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">흐린날</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">비 오는 날</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">눈오는 날</button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<br> <br>
					<h3>성별/연령대별</h3>
					<div class="row ">
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">10대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">10대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">20대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">30대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">40대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">50대 남</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">10대 여</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">10대 여</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">20대 여</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">30대 여</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">40대 여</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-2 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">50대 여</button>
									</div>
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
									<div>
										<button class="btn btn_genre">0-3</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">3-6</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">6-9</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">9-12</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">12-15</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">15-18</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">18-21</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div>
										<button class="btn btn_genre">21-24</button>
									</div>
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
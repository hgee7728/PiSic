<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PISIC</title>
<link
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css"
	rel="stylesheet" type="text/css">
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />

<style>
.artistimg {
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 20px;
	margin: 10px;
}

.one {
	grid-column: 1/3;
	grid-row: 1/3;
	width: 300px;
 	align-self : center;
}
.two {
	grid-column: 3;
	grid-row: 1;
}

.three {
	grid-column: 4;
	grid-row: 1;
}

.four {
	grid-column: 3;
	grid-row: 2;
}

.five {
	grid-column: 4;
	grid-row: 2;
}
</style>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="_navbar.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card corona-gradient-card">
								<div class="card-body py-0 px-0 px-sm-3">
									<div class="row align-items-center">
										<div class="col-4 col-sm-3 col-xl-2">
											<img
												src="<%=request.getContextPath()%>/resources/assets/images/dashboard/Group126@2x.png"
												class="gradient-corona-img img-fluid" alt="">
										</div>
										<div class="col-5 col-sm-7 col-xl-8 p-0">
											<h4 class="mb-1 mb-sm-0">Explore Top Music Powered by
												your PISIC</h4>
											<p class="mb-0 font-weight-normal d-none d-sm-block">We
												bring together your favourite music services and join up
												listening, watching and sharing to connect your musical
												world. Below you can visualise, in real-time, the listening
												habits & trends of PISIC's global community. Go Explore.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<h4 class="card-title">PISICs ARTIST</h4>
					<div class="row">
						<div class="col-lg-6 ">
							<!-- TODO hg : 랜덤으로 아티스트 사진 등록하기 -->
							<div class="row artistimg">
								<img
									src="https://image.bugsm.co.kr/artist/images/200/802291/80229195.jpg?version=20220427063911.0"
									alt="" class=" gradient-corona-img  one"> <img
									src="//image.genie.co.kr/Y/IMAGE/IMG_ARTIST/080/441/365/80441365_1650950486919_26_200x200.JPG/dims/resize/Q_80,0"
									alt="" class=" gradient-corona-img  two"> <img
									src="//image.genie.co.kr/Y/IMAGE/IMG_ARTIST/080/441/365/80441365_1650950486919_26_200x200.JPG/dims/resize/Q_80,0"
									alt="" class=" gradient-corona-img  three"> <img
									src="//image.genie.co.kr/Y/IMAGE/IMG_ARTIST/080/441/366/80441366_1650950454192_17_200x200.JPG/dims/resize/Q_80,0"
									alt="" class=" gradient-corona-img  four"> <img
									src="//image.genie.co.kr/Y/IMAGE/IMG_ARTIST/080/441/366/80441366_1650950454192_17_200x200.JPG/dims/resize/Q_80,0"
									alt="" class=" gradient-corona-img  five">
							</div>
						</div>
					</div>

					<br>

					<h4 class=" card-title">
						실시간 TOP 10
						<p class="card-description">
							<i class="mdi mdi-reload"></i>
							<code>yyyy년 mm월 dd일 hh:mm:ss</code>
						</p>
					</h4>

					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card-body">

							<div class="table-responsive">
								<table class="table" style="text-align: center;">
									<thead>
										<tr>
											<th>순위</th>
											<th>앨범커버</th>
											<th>노래제목</th>
											<th>가수</th>
											<th>앨범명</th>
										</tr>
									</thead>
									<tbody>


										<!-- TODO hg : 순위 for문 돌리기 -->
										<tr>
											<td>1</td>
											<td><img
												src="<%=request.getContextPath()%>/resources/assets/images/dashboard/Group126@2x.png"
												alt="image" /></td>
											<td>LOVE</td>
											<td>몬스타엑스</td>
											<td>shape of love</td>
										</tr>


									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 corona-gradient-card">
							<h4 class="card-title">ALL TIME SCOROBBLES</h4>
							<!-- TODO mg : total count 등록하기 -->
						</div>

						<div class="col-lg-6 corona-gradient-card">
							<h4 class="card-title">지역별 플레이리스트 보기</h4>
							<div class="card-body">
								<!-- TODO hg : 서울 지역구 지도 등록하기 -->
								<img
									src="<%=request.getContextPath()%>/resources/assets/images/dashboard/seoul_map(1).JPG"
									alt="" class="img-fluid">
							</div>
						</div>
					</div>





				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<jsp:include page="_footer.jsp" />
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
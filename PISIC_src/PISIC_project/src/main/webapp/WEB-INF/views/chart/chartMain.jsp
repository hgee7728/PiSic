<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>PISIC CHART</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/_soundList.js"></script>
<style>
.btn_more {
	width: 70px;
	margin: 130px 0;
	border-radius: 50%;
	background-color: black;
	color: #ffffff;
	font-size: 50px;
}
</style>
<style>
.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}
</style>
<style>
table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(6), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8) {
	width: 5%;
}

table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(4),
	table.sound_list  tr>td:nth-child(5) {
	width: 20%;
}

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(6),
	table.sound_list  tr>td:nth-child(7), table.sound_list  tr>td:nth-child(8)
	{
	text-align: center;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}

table.sound_list a {
	color: #6c7293;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';

let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');

$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}

});
</script>
</head>
<body>
	<jsp:include page="../commonSoundList.jsp" />
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

					<h2 class=" card-title">PISIC CHART</h2>

					<br>
					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">PISIC TOP 10</h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>

															<td>순위</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${chartTopten}" var="sounds">
															<tr>

																<td>${sounds.chart }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																<td><c:forEach items="${ sounds.singers}"
																		var="singer">
																		<a
																			href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
																<td><a
																	href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a
																	href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
																<td><a
																	href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class=" grid-margin stretch-card">
							<a
								href="<%=request.getContextPath()%>/chart/chartDetail?chartType=top">
								<button class="btn_more">
									<i class="mdi mdi-chevron-right"></i>
								</button>
							</a>
						</div>
					</div>



					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">월간 TOP 10</h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>

															<td>순위</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${monthlyTopten}" var="sounds">
															<tr>

																<td>${sounds.chart }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																<td><c:forEach items="${ sounds.singers}"
																		var="singer">
																		<a
																			href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
																<td><a
																	href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a
																	href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
																<td><a
																	href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class=" grid-margin stretch-card">
							<a
								href="<%=request.getContextPath()%>/chart/chartDetail?chartType=monthly">
								<button class="btn_more">
									<i class="mdi mdi-chevron-right"></i>
								</button>
							</a>
						</div>
					</div>





					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">주간 TOP 10</h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>

															<td>순위</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${weeklyTopten}" var="sounds">
															<tr>

																<td>${sounds.chart }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																<td><c:forEach items="${ sounds.singers}"
																		var="singer">
																		<a
																			href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
																<td><a
																	href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a
																	href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
																<td><a
																	href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class=" grid-margin stretch-card">
							<a
								href="<%=request.getContextPath()%>/chart/chartDetail?chartType=weekly">
								<button class="btn_more">
									<i class="mdi mdi-chevron-right"></i>
								</button>
							</a>
						</div>
					</div>


					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">일간 TOP 10</h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>

															<td>순위</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${dailyTopten}" var="sounds">
															<tr>

																<td>${sounds.chart }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																<td><c:forEach items="${ sounds.singers}"
																		var="singer">
																		<a
																			href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
																<td><a
																	href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a
																	href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
																<td><a
																	href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class=" grid-margin stretch-card">
							<a
								href="<%=request.getContextPath()%>/chart/chartDetail?chartType=daily">
								<button class="btn_more">
									<i class="mdi mdi-chevron-right"></i>
								</button>
							</a>
						</div>
					</div>



					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">좋아요 TOP 10</h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>

															<td>순위</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${likeTopten}" var="sounds">
															<tr>

																<td>${sounds.chart }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																<td><c:forEach items="${ sounds.singers}"
																		var="singer">
																		<a
																			href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach></td>
																<td><a
																	href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a
																	href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
																<td><a
																	href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class=" grid-margin stretch-card">
							<a
								href="<%=request.getContextPath()%>/chart/chartDetail?chartType=like">
								<button class="btn_more">
									<i class="mdi mdi-chevron-right"></i>
								</button>
							</a>
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
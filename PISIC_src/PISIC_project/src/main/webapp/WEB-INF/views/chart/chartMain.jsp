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
.btn_more {
	width: 70px;
	margin: 100px 0;
	border-radius: 50%;
	background-color: black;
	color: #ffffff;
	font-size: 50px;
}

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8), table.sound_list  tr>td:nth-child(9)
	{
	width: 5%;
}

table.sound_list  tr>td:nth-child(7), table.sound_list  tr>td:nth-child(8),
	table.sound_list  tr>td:nth-child(9) {
	text-align: center;
}

.intro_box {
	font-size: 14px;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
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

					<h2 class=" card-title">PISIC CHART</h2>

					<br>
					<h4 class=" card-title">PISIC TOP 10</h4>

					<div class="row">
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
											<tr>
												<td>1</td>
												<td><img
													src="<%=request.getContextPath()%>/resources/assets/images/dashboard/Group126@2x.png"
													alt="image" /></td>
												<td>LOVE</td>
												<td>몬스타엑스</td>
												<td>shape of love</td>
											</tr>
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
							<div class=" grid-margin stretch-card">
								<a href="<%=request.getContextPath()%>/chart/chartDetail">
									<button class="btn_more">
										<i class="mdi mdi-chevron-right"></i>
									</button>
								</a>
							</div>
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
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all">
																	</label>
																</div>
															</td>
															<td>No</td>
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
														<c:forEach items="${ album.sounds}" var="sounds">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> <input
																			type="checkbox"
																			class="form-check-input sound_checkbox"
																			value="${sounds.s_no }" name="s_no">
																		</label> <input type="hidden" value="${album.a_no }"
																			name="a_no">
																	</div>
																</td>
																<td>${sounds.s_no }</td>
																<td><img src="${album.a_cover }" alt="image" /></td>
																<td>${sounds.s_name}</td>
																<td><c:forEach items="${ sounds.artist_names}"
																		var="singer">
                                               							${singer} 
                                                					</c:forEach></td>
																<td>${album.a_name }</td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-heart list_icon like_after"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-plus-box list_icon"></i></a></td>
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
							<a href="<%=request.getContextPath()%>/chart/chartDetail">
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
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all">
																	</label>
																</div>
															</td>
															<td>No</td>
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
														<c:forEach items="${ album.sounds}" var="sounds">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> <input
																			type="checkbox"
																			class="form-check-input sound_checkbox"
																			value="${sounds.s_no }" name="s_no">
																		</label> <input type="hidden" value="${album.a_no }"
																			name="a_no">
																	</div>
																</td>
																<td>${sounds.s_no }</td>
																<td><img src="${album.a_cover }" alt="image" /></td>
																<td>${sounds.s_name}</td>
																<td><c:forEach items="${ sounds.artist_names}"
																		var="singer">
                                               							${singer} 
                                                					</c:forEach></td>
																<td>${album.a_name }</td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-heart list_icon like_after"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-plus-box list_icon"></i></a></td>
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
							<a href="<%=request.getContextPath()%>/chart/chartDetail">
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
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all">
																	</label>
																</div>
															</td>
															<td>No</td>
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
														<c:forEach items="${ album.sounds}" var="sounds">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> <input
																			type="checkbox"
																			class="form-check-input sound_checkbox"
																			value="${sounds.s_no }" name="s_no">
																		</label> <input type="hidden" value="${album.a_no }"
																			name="a_no">
																	</div>
																</td>
																<td>${sounds.s_no }</td>
																<td><img src="${album.a_cover }" alt="image" /></td>
																<td>${sounds.s_name}</td>
																<td><c:forEach items="${ sounds.artist_names}"
																		var="singer">
                                               							${singer} 
                                                					</c:forEach></td>
																<td>${album.a_name }</td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-heart list_icon like_after"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-plus-box list_icon"></i></a></td>
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
							<a href="<%=request.getContextPath()%>/chart/chartDetail">
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
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all">
																	</label>
																</div>
															</td>
															<td>No</td>
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
														<c:forEach items="${ album.sounds}" var="sounds">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> <input
																			type="checkbox"
																			class="form-check-input sound_checkbox"
																			value="${sounds.s_no }" name="s_no">
																		</label> <input type="hidden" value="${album.a_no }"
																			name="a_no">
																	</div>
																</td>
																<td>${sounds.s_no }</td>
																<td><img src="${album.a_cover }" alt="image" /></td>
																<td>${sounds.s_name}</td>
																<td><c:forEach items="${ sounds.artist_names}"
																		var="singer">
                                               							${singer} 
                                                					</c:forEach></td>
																<td>${album.a_name }</td>
																<td><a
																	href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																		class="mdi mdi-play list_icon"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-heart list_icon like_after"></i></a></td>
																<td><a href=""><i
																		class="mdi mdi-plus-box list_icon"></i></a></td>
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
							<a href="<%=request.getContextPath()%>/chart/chartDetail">
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
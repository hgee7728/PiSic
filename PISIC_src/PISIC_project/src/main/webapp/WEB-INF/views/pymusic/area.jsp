<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>PISIC CHART DETAIL</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
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
<script src="<%=request.getContextPath()%>/resources/assets/js/_soundList.js"></script>
<style>
.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}

.content-wrapper a {
	color: #6c7293;
}
</style>
<style>
table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8), table.sound_list  tr>td:nth-child(9)
	{
	width: 5%;
}

table.sound_list  tr>td:nth-child(2), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8), table.sound_list  tr>td:nth-child(9)
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

					<h2 class=" card-title">
						Pick Your Area &nbsp;&nbsp;${serverTime}
					</h2>
					<br>
					<p>지역별 전체 재생 수 기준 랭킹 조회</p>
					<div class="content_div3">
						<div class="select_btns">
							<button type="button" id="select_play" class="btn btn-info btn-fw">선택재생</button>
							<button type="button" id="select_insert" class="btn btn-info btn-fw">선택담기</button>
						</div>
						<div class="row ">
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<c:set var="area" value="${pyArea[1].area_name }"	/>
										<h3 class="card-title">${area } TOP 10</h3>
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
														<c:forEach items="${pyArea}" var="sounds">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> <input
																			type="checkbox"
																			class="form-check-input sound_checkbox"
																			value="${sounds.s_no }" name="s_no">
																		</label> <input type="hidden" value="${sounds.a_no }"
																			name="a_no"> 
																	</div>
																</td>
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
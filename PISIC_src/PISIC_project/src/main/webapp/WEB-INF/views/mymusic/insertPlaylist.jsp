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
<title>Corona Admin</title>
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
<script
	src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	/* 대표사진 사진 변경 */
	UPLOADCARE_LOCALE = "ko"
	UPLOADCARE_LOCALE_TRANSLATIONS = {
		buttons : {
			choose : {
				files : {
					one : '사진 등록'
				}
			}
		}
	}
	$(function() {
		// 사진 등록하면 미리보기 + input-hidden에 값 넣기
		var singleWidget = uploadcare
				.SingleWidget('[role=uploadcare-uploader]');
		singleWidget.onUploadComplete(function(info) {
			console.log(info.cdnUrl);
			var fileUrl = info.cdnUrl;
			$("#main_img").attr("src", fileUrl);
			$('input[name=l_image]').val(fileUrl);

		});
		$("#myplaylist_select").change(function() {

		});
		
		// 최근 들은 곡 리스트 불러오기
		$("#recent_sound").click(function(){
			$.ajax({
				url: "<%=request.getContextPath() %>/mymusic/selectSoundRecent",
				type: "post",
				dataType:"json",
				success: function(result) {
					var html = "";
					for(var i = 0; i < result.length; i++){
						var resultData = result[i];
						html += 
					}
					$(".preview-list").nextAll().remove();
					$(".preview-list").append(html);
				},
			}); // ajax 끝
		});
	});
	/* <tbody>
	<c:forEach items="${ album.sounds}" var="sounds">
		<tr>
			<td>
				<div class="form-check form-check-muted m-0">
					<label class="form-check-label"> 
						<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
					</label>
					<input type="hidden" value="${album.a_no }" name="a_no">
				</div>
			</td>
			<td>${sounds.s_no }</td>
			<td><img src="${album.a_cover }" alt="image" /></td>
			<td><a href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
			<td>
				<c:forEach items="${ sounds.singers}" var="singer">
				<a href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
				</c:forEach>
			</td>
			<td>
				<a href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-plus-box list_icon"></i></a>
				<!-- <i class="mdi mdi-minus-box list_icon"></i> -->
			</td>
		</tr>
	</c:forEach>
</tbody> */

</script>
<style>
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	margin-right: 20px;
}

.img_btn {
	text-align: center;
	margin: 10px 0px;
}

.radio_div {
	margin: 0px 10px;
}

.card {
	position: relative;
	top: 50px;
	height: 200px;
}

.content_div2 {
	clear: both;
	margin: 30px 0px;
}

.select_op {
	color: white;
}
.grid-2 {
	flex: 0 0 50%;
	max-width: 50%;
}
.sound_list_div{
	flex-wrap:nowrap;
}
.sound_select_btn{
	margin-top:20px;
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
			<%-- <jsp:include page="_navbar.jsp" /> --%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">내 플레이 리스트 만들기</h2>
					</div>
					<form action="<%=request.getContextPath()%>/mymusic/insertPlaylist"
						method="post">
						<div class="content_div1">
							<div class="main_img_div">
								<div>
									<img id="main_img"
										src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"
										width="300" height="300">
								</div>
								<div class="img_btn">
									<input type="hidden" role="uploadcare-uploader"
										data-public-key="43cc829c5d2fae8676a5"
										data-tabs="file gdrive gphotos" /> <input type="hidden"
										name="l_image"
										value="https://ucarecdn.com/2b64b0bc-55d9-4e3f-89c4-4b20ad5308e2/">
								</div>
							</div>
							<div class="content_info  card">
								<div class="card-body">
									<table class="table intro_table">
										<thead>
											<tr>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2"><input type="text" class="form-control"
													placeholder="플레이리스트명" required maxlength="16"></td>
											</tr>
											<tr>
												<td>공개 여부 :</td>
												<td>
													<div class="row">
														<div class="form-check radio_div">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input"
																name="l_private_yn" id="optionsRadios1" value="Y"
																checked> 공개
															</label>
														</div>
														<div class="form-check radio_div">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input"
																name="l_private_yn" id="optionsRadios2" value="N">
																비공개
															</label>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="content_div2">
							<div>
								<h3 class="card-title">곡 담기</h3>
							</div>
							<hr color="white">
							<div>
								<select class="form-control" id="myplaylist_select"
									style="width: 500px; color: white;">
									<option class="select_op">플레이 리스트를 선택하세요.</option>
									<c:forEach items="${mymusicList }" var="items">
										<option class="select_op">${items.l_name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="sound_select_btn">
								<button type="button" id="recent_sound"
									class="btn btn-info btn-fw">최근 들은 곡</button>
								<button type="button" id="often_sound"
									class="btn btn-info btn-fw">자주 들은 곡</button>
								<button type="button" id="like_sound"
									class="btn btn-info btn-fw">좋아요 곡</button>
							</div>
							<div class="row grid-2 sound_list_div">
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<h3 class="card-title left_title"></h3>
										<div class="table-responsive">
											<table class="table left_sound_list">
												<thead>
													<tr>
														<td>
															<div class="form-check form-check-muted m-0">
																<label class="form-check-label"> <input
																	type="checkbox" class="form-check-input" id="check_all">
																</label>
															</div>
														</td>
														<td>No</td>
														<td></td>
														<td>노래명</td>
														<td>가수명</td>
														<td>앨범명</td>
														<td>담기</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>												
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<c:forEach items="${ album.sounds}" var="sounds">
														<tr>
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> 
																		<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
																	</label>
																	<input type="hidden" value="${album.a_no }" name="a_no">
																</div>
															</td>
															<td>${sounds.s_no }</td>
															<td><img src="${album.a_cover }" alt="image" /></td>
															<td><a href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
															<td>
																<c:forEach items="${ sounds.singers}" var="singer">
																<a href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach>
															</td>
															<td>
																<a href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-plus-box list_icon"></i></a>
																<!-- <i class="mdi mdi-minus-box list_icon"></i> -->
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<h3 class="card-title right_title">담을 곡</h3>
										<div class="table-responsive">
											<table class="table right_sound_list">
												<thead>
													<tr>
														<td>
															<div class="form-check form-check-muted m-0">
																<label class="form-check-label"> <input
																	type="checkbox" class="form-check-input" id="check_all">
																</label>
															</div>
														</td>
														<td>No</td>
														<td></td>
														<td>노래명</td>
														<td>가수명</td>
														<td>앨범명</td>
														<td>빼기</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>												
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<c:forEach items="${ album.sounds}" var="sounds">
														<tr>
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> 
																		<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
																	</label>
																	<input type="hidden" value="${album.a_no }" name="a_no">
																</div>
															</td>
															<td>${sounds.s_no }</td>
															<td><img src="${album.a_cover }" alt="image" /></td>
															<td><a href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
															<td>
																<c:forEach items="${ sounds.singers}" var="singer">
																<a href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach>
															</td>
															<td>
																<a href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-plus-box list_icon"></i></a>
																<!-- <i class="mdi mdi-minus-box list_icon"></i> -->
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>












						</div>

					</form>




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
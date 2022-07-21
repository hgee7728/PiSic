<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>Playlist Detail</title>
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
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	margin-right: 20px;
}

table.intro_table tr > td:nth-child(1){
	width:50px;
} 
table.intro_table a {
	color:#6c7293;
}
.content_info {
	vertical-align: middle;
}

.content_div3 {
	margin: 30px 0px;
}
table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(3),
table.sound_list  tr > td:nth-child(7),
table.sound_list  tr > td:nth-child(8){
	width: 5%;
}

table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(7),
table.sound_list  tr > td:nth-child(8),
table.sound_list  tr > td:nth-child(9){
	text-align:center;
}

.intro_box {
	font-size:14px;
}
.list_icon{
	font-size:30px;
	margin: 0px 5px;
}
table.sound_list a {
	color:#6c7293;
}
div.table-responsive{
	width:1200px;
	height:700px;
	overflow: auto;
}
btn#delete_playlist, btn#update_playlist{
	width:50px;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}

	// 미니 버튼들 a태그 색상 바꾸기
	$("i.mdi").parent('a').css('color','#8f5fe8');

    $("#delete_playlist").click(function(){
    	var confm = confirm("선택된 플레이리스트를 삭제 하시겠습니까?");
    	if (confm == false) {
    		preventClick(e);
    		alert("취소하셨습니다.")
    	} else {
    		playlist_delete_frm.submit();
    	}
    });
    
	
}); // $(function(){}) 끝

</script>
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
						<h2 class="card-title">내 플레이 리스트</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img" src="${MyMusic.l_image }" width="300" height="300">
						<div class="content_info  card">
							<div class="card-body">
								<table class="table intro_table">
									<thead>
										<tr>
											<th colspan="2">${MyMusic.l_name}</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제작자 :</td>
											<td><a href="javascript:selectMemberDetail('${MyMusic.m_id }')">${MyMusic.m_nickname}</a></td>
										</tr>
										<tr>
											<td>수록곡 :</td>
											<td>${MyMusic.sound_cnt}</td>
										</tr>
										<tr>
											<td>공개여부 :</td>
											<c:choose>
												<c:when test="${MyMusic.l_private_yn == 'Y'}">
													<td>공개</td>
												</c:when>
												<c:when test="${MyMusic.l_private_yn == 'N'}">
													<td>비공개</td>
												</c:when>
											</c:choose>
											
										</tr>
										<tr>
											<td>
												<form name="playlist_update_frm" action="<%=request.getContextPath() %>/mymusic/updatePlaylist" method="post">
												<!-- csrf 공격 방지 -->
                      							<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
													<input type="hidden" name="l_no" value="${MyMusic.l_no }">
													<button type="submit" id="update_playlist" class="btn">변경</button>
												</form>
											</td>
											<td>
												<form name="playlist_delete_frm" action="<%=request.getContextPath() %>/mymusic/deletePlaylist" method="post">
												<!-- csrf 공격 방지 -->
                      							<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
													<input type="hidden" name="l_no" value="${MyMusic.l_no }">
													<button type="button" id="delete_playlist" class="btn">삭제</button>
												</form>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="soundList_div">
						<div class="row ">
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<div style="display: flex; justify-content: space-between;">
											<h3 class="card-title left_title">수록곡</h3>
											<button type="button" id="select_play" class="btn btn-info btn-fw" style="height: 30px;">선택재생</button>
										</div>
										<div class="table-responsive">
										<form name="sound_frm">
										<!-- csrf 공격 방지 -->
                      					<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
											<table class="table sound_list">
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
														<td>듣기</td>
														<td>좋아요</td>
													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${empty MyMusic.sounds}">
														<tr>
															<td colspan="8" style="text-align: center"><h4 class="card-title">수록곡이 없어요</h4></td>
														</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${ MyMusic.sounds}" var="sounds" varStatus="status">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> 
																			<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
																		</label>
																		<input type="hidden" value="${sounds.a_no }" name="a_no">
																		<input type="hidden" value="${sounds.s_path }" name="s_path">
																	</div>
																</td>
																<td>${status.index+1 }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a href="javascript:selectSoundDetail(${sounds.a_no },${sounds.s_no})">${sounds.s_name}</a></td>
																<td>
																	<c:forEach items="${ sounds.singers}" var="singer">
																	<a href="javascript:selectArtistDetail(${singer.artist_no})">${singer.artist_name}</a>&nbsp;
																	</c:forEach>
																</td>
																<td><a href="javascript:selectAlbumDetail(${sounds.a_no })">${sounds.a_name }</a></td>
																<td>
																	<a href="javascript:playOne(${sounds.a_no },${sounds.s_no})"><i class="mdi mdi-play list_icon"></i></a>
																</td>
																<td>
																	<a href="javascript:soundLike(${sounds.a_no },${sounds.s_no})"><i class="mdi mdi-heart list_icon like_after"></i></a>
																	<!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																</td>
															</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
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
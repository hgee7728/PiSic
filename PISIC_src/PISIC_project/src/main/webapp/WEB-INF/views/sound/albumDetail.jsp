<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
<title>Album Detail</title>
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

.content_div2 {
	clear: both;
	margin: 30px 0px;
}

.intro_box {
	font-size:14px;
}
.intro_box {
	white-space: pre-line;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	// 더보기 기능
	var content = $(".intro_box");
    var content_txt = content.text();
    var content_html = content.html();
    var content_txt_short = content_txt.substring(0,100)+"...";
    
    if(content_txt.length >= 100){
        content.html(content_txt_short)
        
    }else{
        $(".btn_more").hide()
    }
    
    $(".btn_more").click(toggle_content);
    function toggle_content(){
        if($(this).hasClass('short')){
            // 접기 상태
            $(this).html('더보기');
            content.html(content_txt_short)
            $(this).removeClass('short');
        }else{
            // 더보기 상태
            $(this).html('접기');
            content.html(content_html);
            $(this).addClass('short');

        }
    }
    
    
});

let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
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
			<%-- <jsp:include page="_navbar.jsp" /> --%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">앨범정보</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img"
								src="${album.a_cover }"
								width="300" height="300">
						</div>
						<div class="content_info  card">
							<div class="card-body">
								<table class="table intro_table">
									<thead>
										<tr>
											<th colspan="2"><a href="javascript:selectAlbumDetail('${album.a_no }')">${album.a_name}</a></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>가수명 :</td>
											<td><a href="javascript:selectArtistDetail('${album.artist_no }')">${album.artist_name}</a></td>
										</tr>
										<tr>
											<td>발매일 :</td>
											<td><fmt:formatDate value="${album.a_date}" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr>
											<td>발매사 :</td>
											<td>${album.a_publishing}</td>
										</tr>
										<tr>
											<td>기획사 :</td>
											<td>${album.a_agency}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="content_div2">
						<div>
							<h3 class="card-title">앨범 소개</h3>

						</div>
						<hr color="white">
						<blockquote class="blockquote">
						<div class="intro_box">
						${album.a_introduce1}${album.a_introduce2}
						</div>
						</blockquote>
						<div style="text-align:center">
							<button type="button" class="btn btn-outline-light btn-fw btn_more">더보기</button>
						</div>
					</div>
					<div class="content_div3">
						<div class="select_btns">
							<button type="button" id="select_play" class="btn btn-info btn-fw">선택재생</button>
							<button type="button" id="select_insert" class="btn btn-info btn-fw">선택담기</button>
						</div>
						<div class="row ">
							<div class="col-12 grid-margin">
								<div class="card">
									<div class="card-body">
										<h3 class="card-title">수록곡</h3>
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
														<td>담기</td>
													</tr>
												</thead>
												<tbody>
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
															<td>
																<a href="javascript:playlistInsert(${sounds.a_no },${sounds.s_no})"><i class="mdi mdi-plus-box list_icon"></i></a>
																<!-- <i class="mdi mdi-minus-box list_icon"></i> -->
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
					<div class="content_div4">
					
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
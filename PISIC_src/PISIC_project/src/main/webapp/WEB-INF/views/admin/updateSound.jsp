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
<title>PISIC ADMIN</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css"
	rel="stylesheet" type="text/css">
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
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
	
<style>
.btn-primary {
	background-color: #8f5fe8;
	border-color: #8f5fe8;
	width: 100px;
}

.btn-dark {
	width: 100px;
}

.btn-fw {
	border-color: black;
}
input[type=file]::file-selector-button{
  padding: 6px 25px;
  background-color:#8f5fe8;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
</style>
<style>
#ImgProfilePre {
  		margin-right: 10px;
  		width: calc(50% - 160px);
  		border-radius: 2px;
  	}
@media (max-width: 321px) {
  		#ImgProfilePre {
			max-width: 172px;
		}
  	}
.uploadcare--widget__button, .uploadcare--widget__file-name,
	.uploadcare--widget__file-size, .uploadcare--widget__text {
	display: none;
}

/* modal 검색*/
#search_album_modal.search_album_modal_overlay,
#search_artist_modal.search_artist_modal_overlay,
#search_artist_modal_plus.search_artist_modal_overlay_plus,
#search_writer_modal.search_writer_modal_overlay,
#search_writer_modal_plus.search_writer_modal_overlay_plus,
#search_composer_modal.search_composer_modal_overlay,
#search_composer_modal_plus.search_composer_modal_overlay_plus {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: rgba(0, 0, 0, 0.7);
	border-radius: 10px;
	border: 1px solid black;
	z-index: 1000;
	
}
#search_album_modal .search_album_modal_window,
#search_artist_modal .search_artist_modal_window,
#search_artist_modal_plus .search_artist_modal_window_plus,
#search_writer_modal .search_writer_modal_window,
#search_writer_modal_plus .search_writer_modal_window_plus,
#search_composer_modal .search_composer_modal_window,
#search_composer_modal_plus .search_composer_modal_window_plus {
	border-radius: 10px;
	width: 600px;
	height: 700px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow: auto;
}
.search_album_modal_new,
.search_artist_modal_new,
.search_writer_modal_new,
.search_composer_modal_new{
	padding:30px !important;
	display: flex;
}
.search_album_modal_content p.modal_content,
.search_artist_modal_content p.modal_content,
.search_wrtier_modal_content p.modal_content,
.search_composer_modal_content p.modal_content {
	line-height: 40px !important;
}
.search_album_modal,
.search_artist_modal,
.search_artist_modal_plus,
.search_wrtier_modal,
.search_writer_modal_plus,
.search_composer_modal,
.search_composer_modal_plus{
	overflow: auto !important;
}
table#search_album_table a,
table#search_artist_table a,
table#search_artist_table_plus a,
table#search_writer_table a,
table#search_writer_table_plus a,
table#search_composer_table a,
table#search_composer_table_plus a{
	cursor: pointer;
}
</style>
<script>
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
</script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../_sidebar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">Sound Update Page</h2>
					</div>
					<br>
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								
								<form id="frm_sound" class="frm_sound" action="<%=request.getContextPath() %>/admin/updateSound" 
									method="post" enctype="multipart/form-data">
								<!-- csrf 공격 방지 -->
                   				<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<h4 class="card-title">곡 정보 입력</h4>
								<br>
								
									<div class="form-group">
										<label for="a_no">노래 코드 : (자동 부여)</label> 
									</div>
									<div class="form-group">
										<label id="label_g_no" for="SelectGenre">장르 *</label>
										<select class="form-control" id="SelectGenre" name="g_no">
											<option value="1">가요 / 댄스</option>
											<option value="2">가요 / 발라드</option>
											<option value="3">가요 / 락</option>
											<option value="4">가요 / 랩/힙합</option>
											<option value="5">OST / 드라마</option>
											<option value="6">가요 / R&B/소울</option>
											<option value="7">POP / 팝</option>
											<option value="8">가요 / 트로트</option>
											<option value="9">POP / 랩/힙합</option>
											<option value="10">POP / R&B/소울</option>
											<option value="11">가요 / 인디</option>
											<option value="12">POP / 일렉트로니카</option>
											<option value="13">재즈 / 정통</option>
											<option value="14">가요 / 블루스/포크</option>
											<option value="15">가요 / 일렉트로니카</option>
											<option value="16">가요 / 전체</option>
											<option value="17">기타</option>
										</select>
									</div>
									<div class="form-group">
										<label for="s_name" id="label_s_name">노래 이름*</label> 
										<input type="text" class="form-control" placeholder="Name" name="s_name" value="${sound.s_name }">
										<input type="hidden" name="s_no" value="${sound.s_no }">
									</div>
									<div class="form-group">
										<label for="a_name" id="label_a_name">앨범명*</label> 
										<input type="text" class="form-control" placeholder="검색하세요" name="a_name" value="${sound.a_name }" readonly>
										<input type="hidden" name="a_no" value="${sound.a_no }">
										<button type="button" class="btn btn-info btn-fw" id="search_album_btn">검색</button>
									</div>
									<div class="form-group">
										<img id="ImgProfilePre"
												src="${sound.a_cover }" style="width:150px; height:150px;">
									</div>
									<div class="form-group singer_name">
										<label for="singer_name" id="label_singer_name">가수명*</label>
										<input type="text" class="form-control" placeholder="검색하세요" name="singer_name" value="${sound.singers[0].artist_name }" readonly>
										<input type="hidden" name="singer_no" value="${sound.singers[0].artist_no }">
										<button type="button" class="btn btn-info btn-fw search_aritst_btn" id="search_aritst_btn">검색</button>
										<button type="button" class="btn btn-info btn-fw" id="artist_plus">추가</button>
									</div>
									<c:forEach items="${sound.singers}" var="singers" begin="1">
										<div class="form-group">
											<label for="singer_name">가수명</label>
											<input type="text" class="form-control" name="singer_name" value="${singers.artist_name }" readonly>
											<input type="hidden" name="singer_no" value="${singers.artist_no }">
											<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>
										</div>
									</c:forEach>
									<div class="form-group writer_name">
										<label for="writer" id="label_writer_name">작사가1*</label> 
										<input type="text" class="form-control" placeholder="검색하세요" name="writer_name" value="${sound.sound_writers[0].artist_name }" readonly>
										<input type="hidden" name="writer_no" value="${sound.sound_writers[0].artist_no }">
										<button type="button" class="btn btn-info btn-fw search_aritst_btn" id="search_writer_btn">검색</button>
										<button type="button" class="btn btn-info btn-fw" id="writer_plus">추가</button>
									</div>
									<c:forEach items="${sound.sound_writers}" var="writers" begin="1" varStatus="status">
											<div class="form-group">
												<label for="writer">작사가${status.index+1 }</label>
												<input type="text" class="form-control" name="writer_name" value="${writers.artist_name }" readonly>
												<input type="hidden" name="writer_no" value="${writers.artist_no }">
												<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>
											</div>
									</c:forEach>
									<div class="form-group composer_name">
										<label for="composer" id="label_composer_name">작곡가1*</label> 
										<input type="text" class="form-control" placeholder="검색하세요" name="composer_name" value="${sound.sound_composers[0].artist_name }" readonly>
										<input type="hidden" name="composer_no" value="${sound.sound_composers[0].artist_no }">
										<button type="button" class="btn btn-info btn-fw search_aritst_btn" id="search_composer_btn">검색</button>
										<button type="button" class="btn btn-info btn-fw" id="composer_plus">추가</button>
									</div>
									<c:forEach items="${sound.sound_composers}" var="composers" begin="1" varStatus="status">
										<div class="form-group">
											<label for="composer">작곡가${status.index+1 }</label>
											<input type="text" class="form-control" name="composer_name" value="${composers.artist_name }" readonly>
											<input type="hidden" name="composer_no" value="${composers.artist_no }">
											<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>
										</div>
									</c:forEach>
									<div class="form-group lyrics">
										<label for="s_lyrics1" id="label_s_lyrics1">가사 1*</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력, 추가내용은 아래 입력해주세요)" id="s_lyrics1" name="s_lyrics1">${sound.s_lyrics1 }</textarea>
									</div>
									<div class="form-group">
										<label for="s_lyrics2">가사 2</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력)" id="s_lyrics2" name="s_lyrics2">${sound.s_lyrics2 }</textarea>
									</div>
									<div class="form-group change_sound_btn">
										<label for="sound_change_btn">음원변경을 원하시면 누르세요</label>
										<div class="input-group">
											<button type="button" class="btn btn-primary mr-2" id="sound_change_btn">변경하기</button>
										</div>
									</div>
									<div class="form-group change_sound" style="display: none">
										<label id="LabelProfile">음원 파일*</label>
										<div class="input-group">
											<input type="file" id="input-file" name="upload_sound">
											<button type="button" class="btn btn-primary mr-2" id="sound_change_cancel">취소</button>
										</div>
									</div>
									<div style="text-align: center;">
										<button type="button" class="btn btn-primary mr-2" id="update_btn">변경하기</button>
										<button type="button" class="btn btn-dark" id="btn_cancle" onclick="history.back(-1);">취소</button>
									</div>
								</form>
							</div>
						</div>
						</div>
				</div>
				<jsp:include page="../_footer.jsp" />
			</div>
		</div>
	</div>
	<div id="search_album_modal" class="search_album_modal_overlay">
		<div class="col-md-8 grid-margin stretch-card search_album_modal_window">
			<div class="card search_album_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">앨범 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_album_modal_content">
									<div class="flex-grow search_album_modal_new">
										<input type="text" class="form-control"
										placeholder="앨범명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_album_do">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_album_table">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>앨범명</th>
												<th>아티스트명</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_artist_modal" class="search_artist_modal_overlay">
		<div class="col-md-8 grid-margin stretch-card search_artist_modal_window">
			<div class="card search_artist_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">아티스트 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_artist_modal_content">
									<div class="flex-grow search_artist_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_artist_do">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_artist_table">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_artist_modal_plus" class="search_artist_modal_overlay_plus">
		<div class="col-md-8 grid-margin stretch-card search_artist_modal_window_plus">
			<div class="card search_artist_modal_plus">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">아티스트 추가 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_artist_modal_content">
									<div class="flex-grow search_artist_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_artist_do_plus">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_artist_table_plus">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_writer_modal" class="search_writer_modal_overlay">
		<div class="col-md-8 grid-margin stretch-card search_writer_modal_window">
			<div class="card search_writer_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">작사가 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_writer_modal_content">
									<div class="flex-grow search_writer_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_writer_do">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_writer_table">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_writer_modal_plus" class="search_writer_modal_overlay_plus">
		<div class="col-md-8 grid-margin stretch-card search_writer_modal_window_plus">
			<div class="card search_writer_modal_plus">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">작사가 추가 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_writer_modal_content">
									<div class="flex-grow search_writer_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_writer_do_plus">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_writer_table_plus">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_composer_modal" class="search_composer_modal_overlay">
		<div class="col-md-8 grid-margin stretch-card search_composer_modal_window">
			<div class="card search_composer_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">작곡가 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_composer_modal_content">
									<div class="flex-grow search_composer_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_composer_do">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_composer_table">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="search_composer_modal_plus" class="search_composer_modal_overlay_plus">
		<div class="col-md-8 grid-margin stretch-card search_composer_modal_window_plus">
			<div class="card search_composer_modal_plus">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">작곡가 추가 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_composer_modal_content">
									<div class="flex-grow search_composer_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_composer_do_plus">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_composer_table_plus">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		
		
		var msg = '${msg}';
		if(msg){
			alert(msg);
		}
		// 장르 선택하기
		var g_no = '${sound.g_no}';
		console.log("g_no : " + g_no);
		$("#SelectGenre").val(g_no).prop("selected", true);
		
		
		
		// 필수항목 입력했는지 체크
	    	$("#update_btn").on("click", function(){
	    		$("div.form-group span").html("");
	    		var checkFlag = false;
	    		// 노래 이름
	    		if ($("input[name=s_name]").val() == '') {
					$("#label_s_name").html('노래 이름* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_s_name").children('span').css("color", "red");
					$("input[name=s_name]").focus();
					checkFlag = false;
					return;
    			}
	    		// 앨범명
	    		if ($("input[name=a_name]").val() == '') {
					$("#label_a_name").html('앨범명* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_name").children('span').css("color", "red");
					$("input[name=a_name]").focus();
					checkFlag = false;
					return;
    			} 
	    		// 가수명
	    		if ($("input[name=singer_name]").val() == '') {
					$("#label_singer_name").html('가수명* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_singer_name").children('span').css("color", "red");
					$("input[name=singer_name]").focus();
					checkFlag = false;
					return;
    			}
	    		// 작사가
	    		if ($("input[name=writer_name]").val() == '') {
					$("#label_writer_name").html('작사가* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_writer_name").children('span').css("color", "red");
					$("input[name=writer_name]").focus();
					checkFlag = false;
					return;
    			}
	    		// 작곡가
	    		if ($("input[name=composer_name]").val() == '') {
					$("#label_composer_name").html('작곡가* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_composer_name").children('span').css("color", "red");
					$("input[name=composer_name]").focus();
					checkFlag = false;
					return;
    			}
		    	// 앨범소개1
		    	//var content_textarea = $("textarea[name=a_introduce]")
		    	if ($("textarea#s_lyrics1").val() == '') {
					$("#label_s_lyrics1").html('가사1* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_s_lyrics1").children('span').css("color", "red");
					$("textarea#s_lyrics1").focus();
					checkFlag = false;
					return;
    			} 
		    	if($("div.change_sound").css("display") != "none"){
		    		console.log("파일 변경할거야");
		    		// 파일
			    	if ($("#input-file").val() == '') {
						$("#LabelProfile").html('음원파일* <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
						$("#LabelProfile").children('span').css("color", "red");
						checkFlag = false;
						return;
	    			}
		    	}
		    	
		    	checkFlag = true;
		    	if(checkFlag){
		    		
		    		var confm = confirm("입력한 정보로 곡을 변경 하시겠습니까?");
		        	if (confm == false) {
		        		alert("취소하셨습니다.");
		        	} else {
		        		//$("#frm_sound").submit();
		        	}
		    	}
	    	})
	   
	    // 앨범 검색
	    $("#search_album_btn").click(function(){
	    	$("#search_album_modal").show();
	    });
		
	    /* 아티스트 검색 - modal */
		$("#search_aritst_btn").click(function() {
			$("#search_artist_modal").show();
		});
		/* 아티스트 추가 검색 - modal */
		$("#artist_plus").click(function() {
			console.log("추가검색");
			$("#search_artist_modal_plus").show();
		});
		
		 /* 작사가 검색 - modal */
		$("#search_writer_btn").click(function() {
			$("#search_writer_modal").show();
		});
		/* 작사가 추가 검색 - modal */
		$("#writer_plus").click(function() {
			console.log("추가검색");
			$("#search_writer_modal_plus").show();
		});
		
		 /* 작곡가 검색 - modal */
		$("#search_composer_btn").click(function() {
			$("#search_composer_modal").show();
		});
		/* 작사가 추가 검색 - modal */
		$("#composer_plus").click(function() {
			console.log("추가검색");
			$("#search_composer_modal_plus").show();
		});
		
		// 모달창 끄기 - 앨범 검색
		search_album_modal.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_album_modal_overlay")) {
				$("#search_album_modal").hide();
			}
		});
		
	    // 모달창 끄기 - 아티스트 검색
		search_artist_modal.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_artist_modal_overlay")) {
				$("#search_artist_modal").hide();
			}
		});
		// 모달창 끄기 - 아티스트 추가 검색
		search_artist_modal_plus.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_artist_modal_overlay_plus")) {
				$("#search_artist_modal_plus").hide();
			}
		});
		
		// 모달창 끄기 - 작사가 검색
		search_writer_modal.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_writer_modal_overlay")) {
				$("#search_writer_modal").hide();
			}
		});
		// 모달창 끄기 - 작사가 추가 검색
		search_writer_modal_plus.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_writer_modal_overlay_plus")) {
				$("#search_writer_modal_plus").hide();
			}
		});
		
		// 모달창 끄기 - 작곡가 검색
		search_composer_modal.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_composer_modal_overlay")) {
				$("#search_composer_modal").hide();
			}
		});
		// 모달창 끄기 - 작곡가 추가 검색
		search_composer_modal_plus.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_composer_modal_overlay_plus")) {
				$("#search_composer_modal_plus").hide();
			}
		});
		
		// 앨범 검색 - ajax
		$("#search_album_do").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/album.do",
				type: "get",
				data : {
					keyword: $("#search_album_modal input[name=keyword]").val()
				},
				dataType: "json",
				success: function(result) {
					// 테이블 초기화
					$('#search_album_table > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="album_submit('+resultData.a_no +',&#39;' + resultData.a_name +'&#39;'+',&#39;'+resultData.a_cover+'&#39;)">';
							html += '<td>'+resultData.a_no+'</td>';
							html += '<td>';
							html += '<img src=" ' + resultData.a_cover +' " alt="image" />';
							html += '</td>';
							html += '<td>'+resultData.a_name+'</td>';
							html += '<td>'+resultData.artist_name+'</td>';
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_album_table > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function album_submit(a_no, a_name, a_cover){
			console.log("클릭했니");
			$("#search_album_modal").hide();
			$("input[name=a_name]").val(a_name);
			$("input[name=a_no]").val(a_no);
			$("#ImgProfilePre").attr("src", a_cover);
		}
		
		// 아티스트 검색 - ajax
		$("#search_artist_do").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_artist_modal input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_artist_table > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="artist_submit('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_artist_table > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function artist_submit(artist_no, artist_name){
			console.log("클릭했니");
			$("#search_artist_modal").hide();
			$("input[name=singer_name]").eq(0).val(artist_name);
			$("input[name=singer_no]").eq(0).val(artist_no);
		}
		
		// 아티스트 추가 검색 - ajax
		$("#search_artist_do_plus").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_artist_modal_plus input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_artist_table_plus > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="artist_submit_plus('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_artist_table_plus > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function artist_submit_plus(artist_no, artist_name){
			var html = "";
			html += '<div class="form-group">';
			html += '<label for="singer_name">가수명</label>';
			html += '<input type="text" class="form-control" name="singer_name" value="'+artist_name+'" readonly>';
			html += '<input type="hidden" name="singer_no" value="'+artist_no+'">';
			html += '<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>'
			html += '</div>';
			$("div.writer_name").before(html);
			$("#search_artist_modal_plus").hide();
		}
		// 동적으로 생긴 삭제 버튼에 이벤트 걸기
		$(document).on("click", ".delete_aritst_btn", function() {
			$(this).closest("div.form-group").remove();
		});
		
		// 작사가 검색 - ajax
		$("#search_writer_do").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_writer_modal input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_writer_table > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="writer_submit('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_writer_table > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function writer_submit(artist_no, artist_name){
			console.log("클릭했니");
			$("#search_writer_modal").hide();
			$("input[name=writer_name]").eq(0).val(artist_name);
			$("input[name=writer_no]").eq(0).val(artist_no);
		}
		
		// 작사가 추가 검색 - ajax
		$("#search_writer_do_plus").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_writer_modal_plus input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_writer_table_plus > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="writer_submit_plus('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_writer_table_plus > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function writer_submit_plus(artist_no, artist_name){
			var html = "";
			html += '<div class="form-group">';
			html += '<label for="writer_name">작사가</label>';
			html += '<input type="text" class="form-control" name="writer_name" value="'+artist_name+'" readonly>';
			html += '<input type="hidden" name="writer_no" value="'+artist_no+'">';
			html += '<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>'
			html += '</div>';
			$("div.composer_name").before(html);
			$("#search_writer_modal_plus").hide();
		}
		// 동적으로 생긴 삭제 버튼에 이벤트 걸기
		$(document).on("click", ".delete_aritst_btn", function() {
			$(this).closest("div.form-group").remove();
		});
		
		
		// 작곡가 검색 - ajax
		$("#search_composer_do").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_composer_modal input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_composer_table > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="composer_submit('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_composer_table > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function composer_submit(artist_no, artist_name){
			console.log("클릭했니");
			$("#search_composer_modal").hide();
			$("input[name=composer_name]").eq(0).val(artist_name);
			$("input[name=composer_no]").eq(0).val(artist_no);
		}
		
		// 작곡가 추가 검색 - ajax
		$("#search_composer_do_plus").click(function(){
			
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("#search_composer_modal_plus input[name=keyword]").val()
				},
				success: function(result) {
					// 테이블 초기화
					$('#search_composer_table_plus > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr onclick="composer_submit_plus('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_composer_table_plus > tbody").append(html);
				}
			}); // ajax 끝
		});
		// 모달창 검색 결과에서 선택하기
		function composer_submit_plus(artist_no, artist_name){
			var html = "";
			html += '<div class="form-group">';
			html += '<label for="composer_name">작곡가</label>';
			html += '<input type="text" class="form-control" name="composer_name" value="'+artist_name+'" readonly>';
			html += '<input type="hidden" name="composer_no" value="'+artist_no+'">';
			html += '<button type="button" class="btn btn-info btn-fw delete_aritst_btn">삭제</button>'
			html += '</div>';
			$("div.lyrics").before(html);
			$("#search_composer_modal_plus").hide();
		}
		// 동적으로 생긴 삭제 버튼에 이벤트 걸기
		$(document).on("click", ".delete_aritst_btn", function() {
			$(this).closest("div.form-group").remove();
		});
		
		// 음원 변경 버튼
		$("#sound_change_btn").click(function(){
			$("div.change_sound").show();
			$("div.change_sound_btn").hide();
		});
		// 음원 변경 취소 버튼
		$("#sound_change_cancel").click(function(){
			$("div.change_sound").hide();
			$("div.change_sound_btn").show();
		});
		
	</script>
	

	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</body>
</html>
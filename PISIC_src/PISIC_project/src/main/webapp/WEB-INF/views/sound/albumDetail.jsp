<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/_soundList.js"></script>
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
.content_info {
	vertical-align: middle;
}

.content_div2 {
	clear: both;
	margin: 30px 0px;
}
table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(3),
table.sound_list  tr > td:nth-child(7),
table.sound_list  tr > td:nth-child(8),
table.sound_list  tr > td:nth-child(9){
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


</style>
<script>
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
    
    // 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    
    // 선택 재생
    $("#select_play").click(function(){
    	// 체크된 노래 확인 후 , 체크 안되어있다면 input-hidden 지우기
    	$("input[name=s_no]").each(function(){
    		if(!(this.checked)){
    			console.log("히든 지우기");
    			$(this).parent().next("input[name=a_no]").remove();
    		} 
    		console.log(this.checked);
    	});
    	// Post 방식으로 새창 열기
    	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
    	sound_frm.action="<%=request.getContextPath() %>/sound/play";
    	sound_frm.target="SoundPlayer";
    	sound_frm.method="post";
    	sound_frm.submit();
    });
    
    /* modal 플레이 리스트 담기 */
	$("#select_insert").click(function() {
		console.log($('input[name=s_no]:checked').length);
		if($('input[name=s_no]:checked').length == '0'){
			alert("곡을 선택하세요.");
		} else {
			$("#playlist_insert_modal").show();
			$.ajax({
				url: "<%=request.getContextPath() %>/mymusic/playlist.ax",
				type: "post",
				success: function(result) {
					var html = "";
					for(var i = 0; i < result.length; i++){
						var vo = result[i];
						html += '<div class="preview-item border-bottom">';
						html += '<div class="preview-thumbnail">';
						html += '<img src='+vo.l_image+' class="modal_content">';
						html += '</div>';
						html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
						html += '<div class="flex-grow">';
						html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistSelectInsertDo('+vo.l_no+')">'+vo.l_name+'</a></p></div>';
						if(vo.l_private_yn == 'Y'){
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
						} else {
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
						}
					}
					$(".preview-list").nextAll().remove();
					$(".preview-list").append(html);
				},
			}); // ajax 끝
		}
	});
    
	
    // 모달창 끄기 2가지
	$(".playlist_insert_modal_close").click(function() {
		$("#playlist_insert_modal").hide();
	});
	
	playlist_insert_modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("playlist_insert_modal_overlay")) {
			$("#playlist_insert_modal").hide();
		}
	});
	
	// 미니 버튼들 a태그 색상 바꾸기
	$("i.mdi").parent('a').css('color','#8f5fe8');
});

//한곡 재생 - post방식으로 a태그 이용해서 이동
function playOne(a_no,s_no){
	console.log("한곡재생");

	var frm = document.createElement('form');
    var input_s_no = document.createElement('input');
    input_s_no.setAttribute('type', 'hidden');
    input_s_no.setAttribute('name', 's_no');
    input_s_no.setAttribute('value', s_no);
	var input_a_no = document.createElement('input');
    input_a_no.setAttribute('type', 'hidden');
    input_a_no.setAttribute('name', 'a_no');
    input_a_no.setAttribute('value', a_no);
    
    frm.appendChild(input_s_no);
    frm.appendChild(input_a_no);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', '<%=request.getContextPath() %>/sound/play');
    document.body.appendChild(frm);
	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.target="SoundPlayer";
    frm.submit();
};

//노래 좋아요 - ajax
function soundLike(a_no,s_no){
	console.log("좋아요");
	$.ajax({
		url:"<%=request.getContextPath() %>/sound/like",
		type:"post",
		data:{
			a_no:a_no,
			s_no:s_no
			},
		success: function(result){
			if(result == "-2"){
				alert("로그인 후 이용해주세요");
				location.replace("<%=request.getContextPath() %>/member/login");
			} else if(result == "-1"){
				alert("좋아요 취소에 실패했습니다. 다시 시도해주세요.");
			} else if(result == "0"){
				alert("해당 곡을 좋아요를 취소했습니다.");
			} else if(result == "1"){
				alert("해당 곡을 좋아요를 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "2"){
				alert("해당 곡을 좋아요 했습니다.");
			}
			
		},
		error:function(){
			
		}
	}); //ajax 끝
};

// 플레이리스트 한곡 담기 모달창
function playlistInsert(a_no, s_no){
	$("#playlist_insert_modal").show();
	$.ajax({
		url: "<%=request.getContextPath() %>/mymusic/playlist.ax",
		type: "post",
		success: function(result) {
			var html = "";
			for(var i = 0; i < result.length; i++){
				var resultData = result[i];
				html += '<div class="preview-item border-bottom">';
				html += '<div class="preview-thumbnail">';
				html += '<img src='+resultData.l_image+' class="modal_content">';
				html += '</div>';
				html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
				html += '<div class="flex-grow">';
				html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistInsertDo('+a_no +','+ s_no +','+ resultData.l_no +')">'+resultData.l_name+'</a></p></div>';
				if(resultData.l_private_yn == 'Y'){
					html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
				} else {
					html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
				}
			}
			$(".preview-list").nextAll().remove();
			$(".preview-list").append(html);
		},
	}); // ajax 끝
}

// 한곡 담기
function playlistInsertDo(a_no, s_no, l_no){
	$.ajax({
		url: "<%=request.getContextPath() %>/mymusic/insertSound",
		type: "post",
		data:{
			a_no:a_no,
			s_no:s_no,
			l_no:l_no
		},
		success: function(result) {
			if(result == "0"){
				alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "1"){
				alert("해당 곡을 담았습니다.");
			}
		},
		error:function(){
			
		}
	}); // ajax 끝
}
// 선택 담기
function playlistSelectInsertDo(l_no){
	$("input[name=s_no]").each(function(){
		if(!(this.checked)){
			console.log("히든 지우기");
			$(this).parent().next("input[name=a_no]").remove();
		} 
		console.log(this.checked);
	});
	var s_noArray = [];
	var a_noArray = [];
	$('input[name=s_no]:checked').each(function(){ //체크된 리스트 저장
		s_noArray.push($(this).val());
    });
	$('input[name=a_no]').each(function(){
		a_noArray.push($(this).val());
    });
	console.log("s_noArray: "+s_noArray);
	console.log("a_noArray: "+a_noArray);
	var ajaxData = {
			s_no : s_noArray,
			a_no : a_noArray,
			l_no : l_no
	}
	
	$.ajax({
		url: "<%=request.getContextPath() %>/mymusic/insertSound",
		type: "post",
		dataType: "json",
		data: ajaxData,
		traditional:true,
		success: function(result) {
			if(result == "0"){
				alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "1"){
				alert("해당 곡을 담았습니다.");
			}
		},
		error:function(){
			
		}
	});  // ajax 끝
}

// 새 플레이 리스트 만들기
function newPlaylist(){
	location.href = "<%=request.getContextPath() %>/mymusic/insertPlaylist";
};

// 제목, 아티스트, 앨범 클릭시 상세조회 페이지
function selectSoundDetail(a_no, s_no){
	location.href = "<%=request.getContextPath() %>/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
};
function selectArtistDetail(artist_no){
	location.href = "<%=request.getContextPath() %>/sound/artistDetail?artist_no=" + artist_no;
};
function selectAlbumDetail(a_no){
	location.href = "<%=request.getContextPath() %>/sound/albumDetail?a_no=" + a_no;
};
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
											<td>${album.a_date}</td>
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
															<td><img src="${album.a_cover }" alt="image" /></td>
															<td><a href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
															<td>
																<c:forEach items="${ sounds.singers}" var="singer">
																<a href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																</c:forEach>
															</td>
															<td><a href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
															<td>
																<a href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-play list_icon"></i></a>
															</td>
															<td>
																<a href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-heart list_icon like_after"></i></a>
																<!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
															</td>
															<td>
																<a href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i class="mdi mdi-plus-box list_icon"></i></a>
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
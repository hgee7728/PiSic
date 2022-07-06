<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
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
<title>Sound Detail</title>
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

.content_div0 {
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
.album_div{
	padding:15px 15px;
}
.artist_div{
	padding:15px 15px;
	display: flex;
}
table.sound_list a,table.intro_table a {
	color:#6c7293;
}
.div_like {
	display: flex;
	justify-content: space-between;
	
}
.div_like p{
	line-height: 30px;
	margin:0;
} 
.content-wrapper a {
	color:#6c7293;
}
.report_div{
	margin: 0px 15px;
}
.report_div p {
	margin:0;
}
.recomment_div{
	display: table;
	width:100%;
}
.recomment_div textarea, .recomment_div button{
	display: table-cell;
	vertical-align: middle;
}
.recomment_div {
	padding: 0px 15px;
}
.recomment_content_div {
	padding: 15px 15px;
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
    
    // 재생
    $("#play").click(function(){
    	// Post 방식으로 새창 열기
    	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
    	sound_frm.action="<%=request.getContextPath() %>/sound/play";
    	sound_frm.target="SoundPlayer";
    	sound_frm.method="post";
    	sound_frm.submit();
    });
    
 // 플레이리스트 한곡 담기 모달창
	$("#insert_playlist").click(function() {
		$("#playlist_insert_modal").show();
		var a_no = $('input[name=a_no]').val();
		var s_no = $('input[name=s_no]').val();
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


//노래 좋아요 - ajax
function soundLike(a_no,s_no){
	console.log(a_no+s_no);
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

// 한곡 담기
function playlistInsertDo(a_no, s_no, l_no){
	$.ajax({
		url: "<%=request.getContextPath() %>/mymusic/insertSound",
		type: "post",
		data:{
			a_no: a_no,
			s_no: s_no,
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
						<h2 class="card-title">곡 정보</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img"
								src="${sound.a_cover }"
								width="300" height="300">
						</div>
						<div class="content_info  card">
							<div class="card-body">
								<table class="table intro_table">
									<thead>
										<tr>
											<th colspan="2">${sound.s_name}</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>가수명 :</td>
											<td>
												<c:forEach items="${sound.singers }" var="singer">
												<a href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>작사 :</td>
											<td>
												<c:forEach items="${sound.sound_writers }" var="writer">
												<a href="javascript:selectArtistDetail('${writer.artist_no}')">${writer.artist_name}</a>&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>작곡 :</td>
											<td>
												<c:forEach items="${sound.sound_composers }" var="composer">
												<a href="javascript:selectArtistDetail('${composer.artist_no}')">${composer.artist_name}</a>&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>좋아요 :</td>
											<td>
												<div class="div_like">
												<p>${sound.cnt_like }</p>
												<a href="javascript:soundLike('${sound.a_no }','${sound.s_no}')"><i class="mdi mdi-heart list_icon like_after"></i></a>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<form name ="sound_frm">
													<input type="hidden" name="a_no" value="${sound.a_no }">
													<input type="hidden" name="s_no" value="${sound.s_no }">
													<button type="button" id="play" class="btn btn-info btn-fw">재생</button>
													<button type="button" id="insert_playlist" class="btn btn-info btn-fw">담기</button>
												</form>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="content_div0 content_div2">
						<div>
							<h3 class="card-title">가사</h3>
						</div>
						<hr color="white">
						<blockquote class="blockquote">
						<div class="intro_box">
						${sound.s_lyrics1}${sound.s_lyrics2}
						</div>
						</blockquote>
						<div style="text-align:center">
							<button type="button" class="btn btn-outline-light btn-fw btn_more">더보기</button>
						</div>
					</div>
					<div class="content_div0 content_div3">
						<div>
							<h3 class="card-title">수록 앨범</h3>
						</div>
						<hr color="white">
						<div class="row album_div">
							<div class="main_img_div">
								<a href="javascript:selectAlbumDetail('${album.a_no }')"><img id="main_img"
									src="${album.a_cover }"
									width="200" height="200"></a>
							</div>
							<div class="content_info">
								<div class="card-body">
									<table class="table album_table">
										<thead>
											<tr>
												<th>앨범명 :</th>
												<th><a href="javascript:selectAlbumDetail('${album.a_no }')">${album.a_name}</a></th>
											</tr>
										</thead>
										<tbody>
											
											<tr>
												<td>가수명 :</td>
												<td><a href="javascript:selectArtistDetail('${album.artist_no}')">${album.artist_name}</a></td>
											</tr>
											<tr>
												<td>발매일 :</td>
												<td>${album.a_date}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="content_div0 content_div4">
						<div>
							<h3 class="card-title">관련 아티스트 앨범</h3>
						</div>
						<hr color="white">
						<c:forEach items="${relArtistAlbum }" var="album">
							<div class="row album_div">
								<div class="main_img_div">
									<a href="javascript:selectAlbumDetail('${album.a_no }')"><img id="main_img"
										src="${album.a_cover }"
										width="200" height="200"></a>
								</div>
								<div class="content_info">
									<div class="card-body">
										<table class="table album_table">
											<thead>
												<tr>
													<th>앨범명 :</th>
													<th><a href="javascript:selectAlbumDetail('${album.a_no }')">${album.a_name}</a></th>
												</tr>
											</thead>
											<tbody>
												
												<tr>
													<td>가수명 :</td>
													<td><a href="javascript:selectArtistDetail('${album.artist_no}')">${album.artist_name}</a></td>
												</tr>
												<tr>
													<td>발매일 :</td>
													<td>${album.a_date}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="content_div0 content_div5">
						<div>
							<h3 class="card-title">관련 플레이 리스트</h3>
						</div>
						<hr color="white">
						<c:forEach items="${relPlaylistBoard }" var="board">
							<div class="row album_div">
								<div class="main_img_div">
									<%-- <a href="javascript:여기수정('${board.b_no }')"> --%>
									<img id="main_img" src="${board.l_image }"
										width="200" height="200">
									<!-- </a> -->
								</div>
								<div class="content_info">
									<div class="card-body">
										<table class="table album_table">
											<thead>
												<tr>
													<th>제목 :</th>
													<th>
													<%-- <a href="javascript:여기수정('${board.b_no }')"> --%>
													${board.b_title}
													<!-- </a> -->
													</th>
												</tr>
											</thead>
											<tbody>
												
												<tr>
													<td>닉네임 :</td>
													<td>
													<%-- <a href="javascript:여기수정('${board.b_no }')"> --%>
													${board.b_writer}
													<!-- </a> -->
													</td>
												</tr>
												<tr>
													<td>작성일 :</td>
													<td>${board.b_date}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="content_div0 content_div6 ">
						<div>
							<h3 class="card-title">이 곡의 기록</h3>
						</div>
						<hr color="white">
							<div class="row">
								<div class="card report_div">
									<div class="card-body">
									<p>데일리 감상자수(실시간)</p>
									<p>${sound.s_name} 위</p>
									</div>
								</div>
								<div class="card report_div">
									<div class="card-body">
									<p>어제의 차트 순위</p>
									<p>${sound.s_name} 위</p>
									</div>
								</div>
								<div class="card report_div">
									<div class="card-body">
									<p>최고 순위</p>
									<p>${sound.s_name}</p>
									</div>
								</div>
							</div>
					</div>
					<div class="content_div0 content_div7">
						<div>
							<h3 class="card-title">스트리밍 리포트</h3>
						</div>
						<hr color="white">
						<c:choose>
							<c:when test="${empty loginSsInfo }">
								<div class="card report_div">
									<div class="card-body">
									<p>로그인 후 이용해 주세요</p>
									</div>
								</div>
							</c:when>
							<c:when test="${not empty loginSsInfo }">
								<div class="row">
									<div class="card report_div">
										<div class="card-body">
										<p>내가 처음 들은 날</p>
										<p>${sound.s_name}</p>
										</div>
									</div>
									<div class="card report_div">
										<div class="card-body">
										<p>총 감상 횟수</p>
										<p>${sound.s_name} 회</p>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
					<div class="content_div0 content_div8">
						<div>
							<h3 class="card-title">댓글</h3>
						</div>
						<hr color="white">
						<div class="recomment_div">
							<form id="sound_recomment">
								<textarea rows="5" cols="100" required placeholder="댓글 내용을 입력해주세요."></textarea>
								<button type="submit" class="btn btn-info btn-fw">댓글 등록</button>
							</form>
						</div>
						<div class="row recomment_content_div">
							<div class="card">
								<div class="card-body">
								
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
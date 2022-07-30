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
<title>PJ LOUNGE</title>
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
.div_like {
	display: flex;
	justify-content: space-between;
	
}
.div_like p{
	line-height: 30px;
	margin:0;
} 
div.table-responsive{
	width:100%;
	height:670px;
	overflow: auto;
}
.my_btn{
	margin:0px 5px;
}
.recomment_div {
	margin: 0px 15px;
}
.recomment_div textarea{
	width : 100%;
}
.recomment_div textarea, .recomment_div button{
	vertical-align: middle;
}
.recomment_content_div {
	padding: 15px 15px;
}
.board_recomment_table img{
	width: 30px;
    height: 30px;
    border-radius: 100%;
}
table.board_recomment_table td{
	white-space: normal !important;
}
table.board_recomment_table  tr:nth-child(1),
table.board_recomment_table  tr td:nth-child(2){
	text-align:center;
}
table.board_recomment_table  tr > td:nth-child(1){
	width: 5%;
}
table.board_recomment_table  tr > td:nth-child(2){
	width: 15%;
}
table.board_recomment_table  tr > td:nth-child(3){
	width: 50%;
}
table.board_recomment_table  tr > td:nth-child(4),
table.board_recomment_table  tr > td:nth-child(5){
	width: 10%;
	text-align:center;
}
.intro_box {
	white-space: pre-line;
}
/* 따라다니는 목록으로 버튼 */
#goList{
	position : fixed;
	right:25px;
	bottom:25px;
	display: none;
	z-index: 10;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	// 따라다니는 목록 버튼
	$(window).scroll(function(){
		if($(this).scrollTop() > 200){
			$("#goList").fadeIn();
		} 
	});
	$("#goList").click(function(){
		location.href = root_path + "/pjBoard/list";
	});
	
	// 댓글 등록
	$("#insert_recomment").click(function(){
		console.log("댓글 등록 클릭");
		$.ajax({
			url:"<%=request.getContextPath() %>/pjBoard/insertRecomment",
			type:"post",
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			data:{
				r_content: $("textarea[name=recomment_content]").val(),
				b_no: $("input[name=b_no]").val()
				},
			success: function(result){
				if(result == "-1"){
					alert("로그인 후 이용해 주세요");
				} else if(result == "0"){
					alert("댓글 등록에 실패했습니다. 다시 시도해주세요.");
				} else if(result == "1"){
					alert("댓글을 등록하였습니다.");
					location.reload();
				} 
			},
			error:function(){
				
			}
		}); //ajax 끝
		
	});
	
	// 댓글 100자 제한
	$('#recomment_content').on('keyup', function() {
        $('.recomment_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('.recomment_cnt').html("(100 / 100)");
        }
    });
	
	// 댓글 삭제
	$(".btn.delete").click(function(){
		var confm = confirm("댓글을 삭제하시겠습니까?");
    	if (confm == false) {
    		
    	} else {
    		$.ajax({
    			url:"<%=request.getContextPath() %>/pjBoard/deleteRecomment",
    			type:"post",
    			beforeSend: function(xhr){
    		        xhr.setRequestHeader(header, token);
    		    },
    			data:{r_no: $("input[name=r_no]").val()},
    			success:function(result){
    				console.log(result);
    				if(result == "0"){
    					alert("댓글 삭제를 실패했습니다. 다시 시도해주세요.");
    				} else if(result == "1"){
    					alert("댓글을 삭제하였습니다.");
    					location.reload();
    				} 
    			},
    			error:function(error){
    				
    			}
    		}); // ajax 끝
    	}
	});
    
	// 글 수정
	$("#update_btn").click(function(){
		modify_frm.action = "<%=request.getContextPath()%>/pjBoard/update";
		modify_frm.method = "post";
		modify_frm.submit();
	});
	
	// 글 삭제
	$("#delete_btn").click(function(){
		var confm = confirm("해당 글을 삭제하시겠습니까?");
    	if (confm == false) {
    		
    	} else {
    		modify_frm.action = "<%=request.getContextPath()%>/pjBoard/delete";
    		modify_frm.method = "post";
    		modify_frm.submit();
    	}
		
	});
});

let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';

// 게시글 좋아요 - ajax
function boardLike(b_no){
	$.ajax({
		url: root_path + "/pjBoard/like",
		type:"post",
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		data:{
			b_no:b_no,
			},
		success: function(result){
			if(result == "-2"){
				alert("로그인 후 이용해 주세요.");
				location.href = root_path + "/login";
			} else if(result == "-1"){
				alert("좋아요 취소에 실패했습니다. 다시 시도해주세요.");
			} else if(result == "0"){
				alert("해당 게시글을 좋아요를 취소했습니다.");
				location.reload();
			} else if(result == "1"){
				alert("해당 게시글 좋아요를 실패 했습니다. 다시 시도해주세요.");
			} else if(result == "2"){
				alert("해당 게시글을 좋아요 했습니다.");
				location.reload();
			}
			
		},
		error:function(){
			
		}
	}); //ajax 끝
	
}
//제목, 아티스트, 앨범 클릭시 상세조회 페이지
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
						<h2 class="card-title">글 읽기</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img"
								src="${board.l_image }"
								width="300" height="300">
						</div>
						<div class="content_info  card">
							<div class="card-body">
							<input type="hidden" value="${board.b_no}" name="b_no">
								<table class="table intro_table">
									<thead>
										<tr>
											<td>글번호 :</td>
											<td>${board.b_no}</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제목 :</td>
											<td>${board.b_title}</td>
										</tr>
										<tr>
											<td>작성자 :</td>
											<td>${board.b_writer}</td>
										</tr>
										<tr>
											<td>작성일 :</td>
											<td><fmt:formatDate value="${board.b_date}" pattern="yyyy-MM-dd"/></td>
										</tr>
										<tr>
											<td>조회수 :</td>
											<td>${board.b_cnt}</td>
										</tr>
										<tr>
											<td>좋아요 :</td>
											<td>
												<div class="div_like">
												<p>${board.cnt_like }</p>
												<a href="javascript:boardLike('${board.b_no}')"><i class="mdi mdi-heart list_icon like_after"></i></a>
												</div>
											</td>
										</tr>
										<c:if test="${member.m_id != board.m_id}">
											<tr style="text-align: center;">
												<td colspan="2">
													<button type="button" id="update_btn" class="btn btn-info btn-md my_btn" disabled>수정</button>
													<button type="button" id="delete_btn" class="btn btn-info btn-md my_btn" disabled>삭제</button>
												</td>
											</tr>
										</c:if>
										<c:if test="${member.m_id == board.m_id}">
											<tr style="text-align: center;">
												<td colspan="2">
													<form name="modify_frm">
														<!-- csrf 공격 방지 -->
                   										<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
														<input type="hidden" name="b_no" value="${board.b_no}">
														<button type="button" id="update_btn" class="btn btn-info btn-md my_btn">수정</button>
														<button type="button" id="delete_btn" class="btn btn-info btn-md my_btn">삭제</button>
													</form>
												</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="content_div2">
						<div>
							<h3 class="card-title">소개글</h3>

						</div>
						<hr color="white">
						<blockquote class="blockquote">
						<div class="intro_box">
						${board.b_content }
						</div>
						</blockquote>
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
													<c:forEach items="${ board.sounds}" var="sounds" varStatus="status">
														<tr>
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> 
																		<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
																	</label>
																	<input type="hidden" value="${sounds.a_no }" name="a_no">
																</div>
															</td>
															<td>${status.count }</td>
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
					<div class="content_div0 content_div8">
						<div>
							<h3 class="card-title">댓글</h3>
						</div>
						<hr color="white">
						<div class="recomment_div">
							<textarea id="recomment_content" name="recomment_content" rows="5" cols="100" required placeholder="댓글 내용을 입력해주세요."></textarea>
							<div style="float:right;">
								<div class="recomment_cnt">(1/100)</div>
							</div>
							<div style="clear: both; float: right;">
								<button type="button" id="insert_recomment" class="btn btn-info btn-fw">댓글 등록</button>
							</div>
						</div>
						<div class="row recomment_content_div" style="clear: both;">
							<table class="table table-striped board_recomment_table">
								<tr>
									<th></th>
									<th>작성자</th>
									<th>내용</th>
									<th>작성일</th>
									<th></th>
								</tr>
								<c:if test="${empty board.recomments }">
									<tr>
										<td colspan="5" style="text-align: center;"><p class="text-muted mb-0">등록된 댓글이 없습니다.</p></td>
									</tr>
								</c:if>
								<c:if test="${not empty board.recomments }">
									<c:forEach items="${board.recomments }" var="recomment">
										<tr>
											<c:choose>
												<c:when test="${recomment.m_profile != null }">
													<td><img src="${recomment.m_profile }"></td>
												</c:when>
												<c:otherwise>
													<td><img src="<%=request.getContextPath() %>/resources\assets\images\profile.png"></td>
												</c:otherwise>
											</c:choose>
											<td>${recomment.r_writer }</td>
											<td>${recomment.r_content }</td>
											<td><fmt:formatDate value="${recomment.r_date }" pattern="yyyy-MM-dd hh:mm"/></td>
											<c:choose>
												<c:when test="${member.m_id == recomment.m_id}">
												<td>
													<input type="hidden" name="r_no" value="${recomment.r_no}">
													<button class="btn delete" type="button">삭제</button>
												</td>
												</c:when>
												<c:otherwise>
													<td></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
					</div>
					<button type="button" id="goList" class="btn btn-info btn-fw">목록으로</button>

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
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

.content_info.card {
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
table.left_sound_list a, table.right_sound_list a{
	color:#6c7293;
}
.list_icon{
	font-size:30px;
	margin: 0px 5px;
}


table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(3),
table.sound_list  tr > td:nth-child(6){
	width: 5%;
}
table.sound_list  tr > td:nth-child(4){
	width:60%;
}
table.sound_list  tr > td:nth-child(5){
	width:30%;
}
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(6){
	text-align:center;
}

</style>
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
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
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
					$(".left_title").text("최근 들은 곡");
					console.log(result);
					var html = "";
					for(var i = 0; i < result.length; i++){
						var resultData = result[i];
						html += '<tr>';
						html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
						html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
						html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
						html += '<td>'+(i+1)+'</td>';
						html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
						html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
						html += '<td>';
							for(var j = 0 ; j < resultData.singers.length ; j ++){
								var resultData2 = resultData.singers[j]
								html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
							}
						html += '</td>';
						html += '<td><a href="javascript:soundPlus('+resultData.a_no+','+resultData.s_no+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
						html += '</tr>';
						
					
					}
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
				},
			}); // ajax 끝
		});
		
		// 체크박스 전체선택 - 왼쪽 테이블
	    $("#check_all1").click(function(){
	    	if($('#check_all1').is(':checked')){
	    		$('table.left_sound_list input:checkbox').prop('checked',true);
	    	} else {
	    		$('table.left_sound_list input:checkbox').prop('checked',false);
	    	}
	    })
	    // 체크박스 전체선택 - 오른쪽 테이블
	    $("#check_all2").click(function(){
	    	if($('#check_all2').is(':checked')){
	    		$('table.right_sound_list input:checkbox').prop('checked',true);
	    	} else {
	    		$('table.right_sound_list input:checkbox').prop('checked',false);
	    	}
	    })
	    
	    
	});
	// 제목, 아티스트, 앨범 클릭시 상세조회 페이지
	function selectSoundDetail(a_no, s_no){
		location.href = "<%=request.getContextPath() %>/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
	};
	function selectArtistDetail(artist_no){
		location.href = "<%=request.getContextPath() %>/sound/artistDetail?artist_no=" + artist_no;
	};
	
	// 담을 곡으로 한곡,선택 옮기기
	function soundPlus(a_no, s_no){
		$.ajax({
			url: "<%=request.getContextPath() %>/mymusic/selectSoundList",
			type: "post",
			data:{
				a_no:a_no,
				s_no:s_no
			},
			dataType:"json",
			success: function(result) {
				console.log(result);
				var html = "";
				for(var i = 0; i < result.length; i++){
					var resultData = result[i];
					html += '<tr>';
					html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
					html += '<input type="checkbox" class="form-check-input sound_checkbox2" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
					html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
					html += '<td></td>';
					html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
					html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
					html += '<td>';
						for(var j = 0 ; j < resultData.singers.length ; j ++){
							var resultData2 = resultData.singers[j]
							html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
						}
					html += '</td>';
					html += '<td><a id="sound_minus"><i class="mdi mdi-minus-box list_icon"></i></a></td>';
					html += '</tr>';
					
				
				}
				console.log(html);
				$("table.right_sound_list tbody").append(html);
				
				// number 부여하기
				for(var i = 0 ; i < $("table.right_sound_list tbody tr").length ; i ++){
					$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(2)').text(i+1);
					$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(6) a#sound_minus').attr('href','javascript:soundMinus('+(i+1)+')');
					
				}
				// 미니 버튼들 a태그 색상 바꾸기
				$("i.mdi").parent('a').css('color','#8f5fe8');
			},
		}); // ajax 끝
	}
	
	// 한곡 빼기
	function soundMinus(i){
		$('table.right_sound_list tbody tr:nth-child('+i+')').remove();
		
		// number 부여하기
		for(var j = 0 ; j < $("table.right_sound_list tbody tr").length ; j ++){
			$('table.right_sound_list tbody tr:nth-child('+(j+1)+') td:nth-child(2)').text(j+1);
			$('table.right_sound_list tbody tr:nth-child('+(j+1)+') td:nth-child(6) a#sound_minus').attr('href','javascript:soundMinus('+(j+1)+')');
			
		}
	}

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
										<h3 class="card-title left_title">리스트를 선택하세요.</h3>
										<div class="table-responsive">
											<table class="table left_sound_list sound_list">
												<thead>
													<tr>
														<td>
															<div class="form-check form-check-muted m-0">
																<label class="form-check-label"> <input
																	type="checkbox" class="form-check-input" id="check_all1">
																</label>
															</div>
														</td>
														<td>No</td>
														<td><img 
										src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"></td>
														<td>노래명</td>
														<td>가수명</td>
														<td>담기</td>
													</tr>
												</thead>
												<tbody>
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
											<table class="table right_sound_list sound_list">
												<thead>
													<tr>
														<td>
															<div class="form-check form-check-muted m-0">
																<label class="form-check-label"> <input
																	type="checkbox" class="form-check-input" id="check_all2">
																</label>
															</div>
														</td>
														<td>No</td>
														<td><img 
										src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"></td>
														<td>노래명</td>
														<td>가수명</td>
														<td>빼기</td>
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
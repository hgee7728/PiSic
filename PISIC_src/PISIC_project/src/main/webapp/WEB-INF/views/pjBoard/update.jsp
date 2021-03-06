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
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>Pj Lounge Write</title>
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
	margin: 30px 0px 30px 0px;
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
.selectList{
	margin: 20px;
}
.sound_list_div {
	flex-wrap: nowrap;
}

.sound_select_btn {
	margin-top:10px;
	display: flex;
}

table.left_sound_list a, table.right_sound_list a {
	color: #6c7293;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}
div.table-responsive{
	height:730px;
	overflow: auto;
}

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(6)
	{
	width: 9%;
}
table.sound_list  tr>td:nth-child(4) {
	width: 45%;
}


table.sound_list  tr>td:nth-child(2), table.sound_list  tr>td:nth-child(6)
	{
	text-align: center;
}
div.sound_select_btn input[name=keyword] {
	width:200px;
	margin-left:20px;
}
#recent_sound, #often_sound, #like_sound{
	margin-right:15px;
}
#myplaylist_select{
	width:500px;
	color:white;
}

/* ??????????????? ???????????? ?????? */
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
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
$(function() {
	// ??????????????? ?????? ??????
	$(window).scroll(function(){
		if($(this).scrollTop() > 200){
			$("#goList").fadeIn();
		} 
	});
	$("#goList").click(function(){
		location.href = root_path + "/pjBoard/list";
	});
		
	// ????????? ????????? ????????? ?????? ?????? ???????????? - select-option
	$("#myplaylist_select").change(function(){
		console.log("?????????");
		console.log($("#myplaylist_select").val());
		$("input[name=l_no]").val($("#myplaylist_select").val());
		$.ajax({
			url: "<%=request.getContextPath()%>/mymusic/playlistSound",
			type: "post",
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			data:{
				l_no:$("#myplaylist_select").val()
			},
			dataType: 'json',
			success: function(result) {
				$("input[name=l_name]").val($("#myplaylist_select option:selected").text());
				console.log(result);
				$("#main_img").attr('src', result[0].l_image);
				var html = "";
				for(var i = 0; i < result.length; i++){
					var resultData = result[i];
					html += '<tr>';
					html += '<td>'+(i+1)+'</td>';
					html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
					html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
					html += '<td>';
						for(var j = 0 ; j < resultData.singers.length ; j ++){
							var resultData2 = resultData.singers[j]
							html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
							html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
						}
					html += '</td>';
					html += '<td><a href="javascript:playOne('+resultData.a_no+','+resultData.s_no+')"><i class="mdi mdi-play list_icon"></i></a></td>';
					html += '</tr>';
					
				
				}
				console.log(html);
				$("table.left_sound_list tbody").children().remove();
				$("table.left_sound_list tbody").append(html);
				// ?????? ????????? a?????? ?????? ?????????
				$("i.mdi").parent('a').css('color','#8f5fe8');
				
				// ????????? ?????? ????????????
				let l_no = result.l_no;
				$.ajax({
					url: "<%=request.getContextPath()%>/mymusic/totalCntPlaylistSound",
					type: "post",
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					data:{
						l_no: l_no
					},
					dataType: 'json',
					success: function(result) {
						$("td#totalCnt").text(result + "???");
						
					}
				}); // ajax ???
				
				
				
			},
			error:function(){
				$("table.left_sound_list tbody").children().remove();
				$("td#totalCnt").text("");
				$("input[name=l_name]").val("");
				$("input[name=l_no]").val("");
				$("img#main_img").attr('src', "<%=request.getContextPath()%>/resources/assets/images/playlist_img.png");
			}
		}); // ajax ???
	});
	
	// ???????????? ?????? - ?????????
	$("#update_btn").click(function(){
    		var checkFlag = false;
    		// ??????
    		if ($("input[name=b_title]").val() == '') {
				$("#label_b_title").html('??????* <span><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				$("#label_b_title").children('span').css("color", "red");
				$("input[name=b_title]").focus();
				checkFlag = false;
				return;
			} 
    		// ?????????
    		if ($("textarea#b_content").val() == '') {
				$("#label_b_content").html('?????????* <span><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				$("#label_b_content").children('span').css("color", "red");
				$("textarea#b_content").focus();
				checkFlag = false;
				return;
			} 
    		// ????????? ?????????
	    	if ($("input[name=l_no]").val() == '') {
				alert("????????? ???????????? ??????????????????.");
				checkFlag = false;
				return;
			} 
	    	checkFlag = true;
	    	if(checkFlag){
		    	var confm = confirm("????????? ???????????? ?????? ?????????????????????????");
		    	if (confm == false) {
		    		alert("?????????????????????.");
		    	} else {
		    		board_frm.action = root_path + "/pjBoard/update.do";
		    		board_frm.method = "post";
		    		board_frm.submit();
		    	}
	    	}
	})
    // ?????? ?????? ??????
    $("#cancel_btn").click(function(){
    	console.log("?????? ?????? ??????");
    	history.back();
    });
    
	 // ?????? ????????? a?????? ?????? ?????????
	$("i.mdi").parent('a').css('color', '#8f5fe8');
	
	// ?????????????????? ?????????????????? ????????????
	let l_no = '${board.l_no}';
	$("#myplaylist_select").val(l_no).prop("selected", true);
	$(".sound_list_div input[name=l_no]").val(l_no);
		$.ajax({
			url: "<%=request.getContextPath()%>/mymusic/playlistSound",
			type: "post",
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			data:{
				l_no: l_no
			},
			dataType: 'json',
			success: function(result) {
				$("input[name=l_name]").val($("#myplaylist_select option:selected").text());
				console.log(result);
				$("#main_img").attr('src', result[0].l_image);
				var html = "";
				for(var i = 0; i < result.length; i++){
					var resultData = result[i];
					html += '<tr>';
					html += '<td>'+(i+1)+'</td>';
					html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
					html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
					html += '<td>';
						for(var j = 0 ; j < resultData.singers.length ; j ++){
							var resultData2 = resultData.singers[j]
							html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
							html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
						}
					html += '</td>';
					html += '<td><a href="javascript:playOne('+resultData.a_no+','+resultData.s_no+')"><i class="mdi mdi-play list_icon"></i></a></td>';
					html += '</tr>';
					
				
				}
				console.log(html);
				$("table.left_sound_list tbody").children().remove();
				$("table.left_sound_list tbody").append(html);
				// ?????? ????????? a?????? ?????? ?????????
				$("i.mdi").parent('a').css('color','#8f5fe8');
				
				// ????????? ?????? ????????????
				let l_no = result.l_no;
				$.ajax({
					url: "<%=request.getContextPath()%>/mymusic/totalCntPlaylistSound",
					type: "post",
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					data:{
						l_no: l_no
					},
					dataType: 'json',
					success: function(result) {
						$("td#totalCnt").text(result + "???");
						
					}
				}); // ajax ???
				
				
				
			},
			error:function(){
				$("table.left_sound_list tbody").children().remove();
				$("td#totalCnt").text("");
				$("input[name=l_name]").val("");
				$("input[name=l_no]").val("");
				$("img#main_img").attr('src', "<%=request.getContextPath()%>/resources/assets/images/playlist_img.png");
			}
		}); // ajax ???
	
	
}); // $(founction(){}) ???
	
// ??????, ????????????, ?????? ????????? ???????????? ?????????
function selectSoundDetail(a_no, s_no){
	location.href = "<%=request.getContextPath()%>/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
};
function selectArtistDetail(artist_no){
	location.href = "<%=request.getContextPath()%>/sound/artistDetail?artist_no=" + artist_no;
};

//?????? ?????? - post???????????? a?????? ???????????? ??????
function playOne(a_no,s_no){
	console.log("????????????");
	var??frm??=??document.createElement('form');
????????var??input_s_no =??document.createElement('input');
????????input_s_no.setAttribute('type',??'hidden');
????????input_s_no.setAttribute('name',??'s_no');
????????input_s_no.setAttribute('value',??s_no);

	var??input_a_no = document.createElement('input');
????????input_a_no.setAttribute('type',??'hidden');
????????input_a_no.setAttribute('name',??'a_no');
????????input_a_no.setAttribute('value',??a_no);

????????var??input_csrf =??document.createElement('input');
????????input_csrf.setAttribute('type',??'hidden');
????????input_csrf.setAttribute('id',??'csrf');
????????input_csrf.setAttribute('name',??csrf_parameterName);
????????input_csrf.setAttribute('value',??csrf_token);
	frm.appendChild(input_csrf);
????????frm.appendChild(input_s_no);
????????frm.appendChild(input_a_no);
????????frm.setAttribute('method',??'post');
????????frm.setAttribute('action',??root_path + '/sound/play');
????????document.body.appendChild(frm);
	windowObj = window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=700, status=no, menubar=no, toolbar=no, resizable=no');
	frm.target="SoundPlayer";
????????frm.submit();
};
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
					<form name="board_frm">
					<!-- csrf ?????? ?????? -->
	           		<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="title_div">
						<h2 class="card-title">Pj Lounge ?????????</h2>
					</div>
					<div style="margin-top:100px;">
						<h3 class="card-title">?????? ?????? ??????</h3>
					</div>
					<hr color="white">
					<div class="form-group">
						<input type="hidden" name="b_no" value="${board.b_no}">
						<label for="b_title" id="label_b_title">??????*</label> 
						<input type="text" class="form-control" placeholder="Name" name="b_title" value="${board.b_title }">
					</div>
					<div class="form-group">
						<label for="b_content" id="label_b_content">?????????*</label>
						<textarea class="form-control" rows="10" placeholder="(?????? ?????? 150???)" id="b_content" name="b_content" maxlength="150">${board.b_content }</textarea>
					</div>
						
						<div class="content_div2">
							<div>
								<h3 class="card-title">????????? ????????? ????????????</h3>
							</div>
							<hr color="white">
							<div>
								<select class="form-control" id="myplaylist_select">
									<option class="select_op">????????? ???????????? ???????????????.</option>
									<c:forEach items="${mymusicList }" var="items">
										<option class="select_op" value="${items.l_no }">${items.l_name }</option>
									</c:forEach>
								</select>
							</div>
							<div style="display: flex; justify-content: center;">
							<div class="content_div1 selectList">
							<div class="main_img_div">
								<div>
									<img id="main_img"
										src="${board.l_image }"
										width="300" height="300">
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
												<td colspan="2"><input name="l_name" type="text" class="form-control"
													placeholder="???????????? ???????????????" readonly></td>
											</tr>
											<tr>
												<td>????????? : </td>
												<td id="totalCnt">
													
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
							<div class="row sound_list_div selectList">
							
								<div class="col-12 grid-margin">
									<div class="card">
										<div class="card-body" style="width: 800px;">
											<div style="display: flex; justify-content: space-between;">
												<h3 class="card-title left_title">?????????</h3>
												<input type="hidden" name="l_no">
											</div>
											<div class="table-responsive">
												<table class="table left_sound_list sound_list">
													<thead>
														<tr>
															<td>No</td>
															<td><img src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"></td>
															<td>?????????</td>
															<td>?????????</td>
															<td>??????</td>
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
						<div class="insert_board_btns" style="text-align: center;">
							<button type="button" id="update_btn" class="btn btn-info btn-fw">????????????</button>
							<button type="button" id="cancel_btn" class="btn btn-info btn-fw">??????</button>
						</div>
					



					</form>
					<button type="button" id="goList" class="btn btn-info btn-fw">????????????</button>
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
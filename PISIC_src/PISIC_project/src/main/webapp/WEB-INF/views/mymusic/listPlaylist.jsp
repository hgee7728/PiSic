<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>플레이리스트 목록</title>
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
.grid-5 {
	flex: 0 0 20%;
	max-width: 20%;
}
.main_img_div {
	text-align: center;
}
.content_div{
	margin-top:30px;
}
input[name=playlist_no]{
	position: relative;
	top:20px;
	left:20px;
}
.playlist_div{
	margin-right: 10px;
}
table.playlist_table a{
	color:#6c7293;
}
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	
	// 생성된 체크박스와 label 묶어주기
	var checkbox = $("input[name=l_no]");
	console.log(checkbox);
	for(var i = 0 ; i < $("input[name=l_no]").length ; i++){
		console.log("checkbox"+i+": " + checkbox[i]);
		checkbox.eq(i).attr('id', 'l_no'+i);
		checkbox.eq(i).next().children('label').attr('for', 'l_no'+i);
	}
	
	$("#insert_playlist").click(function(){
		location.href="<%=request.getContextPath() %>/mymusic/insertPlaylist";
	});
	$("#delete_playlist").click(function(){
		if($('input[name=l_no]:checked').length == '0'){
			alert("플레이리스트를 선택하세요.");
		} else {
			var confm = confirm("선택된 플레이리스트를 삭제 하시겠습니까?");
			if (confm == false) {
				preventClick(e);
				alert("취소하셨습니다.")
			} else {
				playlist_frm.submit();
			}
		}
	});
	
	
	// 플레이리스트 변경 버튼
	<%-- $("#update_playlist").click(){
		var frm = document.createElement('form');
	    var input_l_no = document.createElement('input');
	    input_l_no.setAttribute('type', 'hidden');
	    input_l_no.setAttribute('name', 's_no');
	    input_l_no.setAttribute('value', s_no);
		
	    
	    frm.appendChild(input_s_no);
	    frm.appendChild(input_a_no);
	    frm.setAttribute('method', 'post');
	    frm.setAttribute('action', '<%=request.getContextPath() %>/sound/play');
	    document.body.appendChild(frm);
		window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		frm.target="SoundPlayer";
	    frm.submit();
	} --%>
	
}); // $(function(){}) 끝

// 플레이 리스트 상세조회
function selectPlaylistDetail(l_no){
	location.href="<%=request.getContextPath() %>/mymusic/playlistDetail?l_no="+l_no;
	
}

function updatePlaylist(l_no){
	console.log("플리번호는? :" + l_no);
	var frm = document.createElement('form');
    var input_l_no = document.createElement('input');
    input_l_no.setAttribute('type', 'hidden');
    input_l_no.setAttribute('name', 'l_no');
    input_l_no.setAttribute('value', l_no);
	
    var input_csrf = document.createElement('input');
    input_csrf.setAttribute('type', 'hidden');
    input_csrf.setAttribute('id', 'csrf');
    input_csrf.setAttribute('name', '${_csrf.parameterName }');
    input_csrf.setAttribute('value', '${_csrf.token }');
	frm.appendChild(input_csrf);
    frm.appendChild(input_l_no);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', '<%=request.getContextPath() %>/mymusic/updatePlaylist');
    document.body.appendChild(frm);
    frm.submit();
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
					<form method="post" name="playlist_frm" action="<%=request.getContextPath() %>/mymusic/deletePlaylist">
					<!-- csrf 공격 방지 -->
                    <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="title_div">
							<h2 class="card-title">내 플레이 리스트</h2>
						</div>
						<div class="playlist_btn_div">
							
								<button type="button" id="insert_playlist" class="btn btn-info btn-fw">추가</button>
								<button type="button" id="delete_playlist" class="btn btn-info btn-fw">삭제</button>
							
						</div>
						<div class="content_div">
						<div class="row">
							<c:forEach items="${listPlaylist }" var="playlist">
							<div class="playlist_div">
								<input type="checkbox" name="l_no" value="${playlist.l_no }">
								<div class="main_img_div">
									<label><img id="main_img" src="${playlist.l_image }" width="200" height="200"></label>
								</div>
								<div class="content_info">
									<div class="card-body">
										<table class="table playlist_table">
											<thead>
												<tr>
													<th>플레이리스트명 :</th>
													<th><a href="javascript:selectPlaylistDetail('${playlist.l_no }')">${playlist.l_name}</a></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>공개 여부 :</td>
													<c:choose>
														<c:when test="${playlist.l_private_yn == 'Y'}">
														<td>공개</td>
														</c:when>
														<c:when test="${playlist.l_private_yn == 'N'}">
														<td>비공개</td>
														</c:when>
													</c:choose>
												</tr>
												<tr>
													<td colspan="2" style="text-align: center;">
														<button id="update_playlist" type="button" class="btn" onclick="updatePlaylist(${playlist.l_no })">변경</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							</c:forEach>
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
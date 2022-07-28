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
<title>좋아하는 아티스트</title>
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

.artist_div{
	margin-right: 10px;
}
table.artist_table a{
	color:#6c7293;
}
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	
	

}); // $(function(){}) 끝

// 아티스트 상세조회
function selectArtistDetail(artist_no){
	location.href="<%=request.getContextPath() %>/sound/artistDetail?artist_no="+artist_no;
}
// 아티스트 좋아요 취소
function artistLike(artist_no){
	var confm = confirm("해당 아티스트 좋아요를 취소하시겠습니까?");
	if (confm == false) {
		alert("취소하셨습니다.")
	} else {
		var frm = document.createElement('form');
	    var input_artist_no = document.createElement('input');
	    input_artist_no.setAttribute('type', 'hidden');
	    input_artist_no.setAttribute('name', 'artist_no');
	    input_artist_no.setAttribute('value', artist_no);
	
		var input_csrf = document.createElement('input');
	    input_csrf.setAttribute('type', 'hidden');
	    input_csrf.setAttribute('id', 'csrf');
	    input_csrf.setAttribute('name', '${_csrf.parameterName }');
	    input_csrf.setAttribute('value', '${_csrf.token }');
		frm.appendChild(input_artist_no);
		frm.appendChild(input_csrf);
		frm.setAttribute('method', 'post');
	    frm.setAttribute('action', '<%=request.getContextPath() %>/mymusic/deleteArtistLike');
	    document.body.appendChild(frm);
		frm.submit();
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
							<h2 class="card-title">좋아하는 아티스트</h2>
							<p class="text-muted mb-0">*내가 좋아요를 누른 아티스트입니다.</p>
						</div>
						<div class="content_div">
						
						<c:choose>
							<c:when test="${empty ArtistList}">
								<div class="card">
									<div class="artist_div card-body" style="text-align: center;">
										<h4 class="card-title">좋아하는 아티스트가 없어요</h4>
									</div>
								</div>
							</c:when>
							<c:otherwise>
							<div class="row">
								<c:forEach items="${ArtistList }" var="ArtistList">
								<div class="artist_div">
									<div class="main_img_div">
										<a href="javascript:selectArtistDetail('${ArtistList.artist_no }')">
											<c:if test="${empty ArtistList.artist_profile }">
												<img id="main_img" src="<%=request.getContextPath() %>/resources/assets/images/artist.png" width="200" height="200">
											</c:if>
											<c:if test="${not empty ArtistList.artist_profile }">
												<img id="main_img" src="${ArtistList.artist_profile }" width="200" height="200">
											</c:if>
										</a>
									</div>
									<div class="content_info">
										<div class="card-body">
											<table class="table artist_table">
												<thead>
													<tr>
														<th>아티스트명 :</th>
														<th>
															<a href="javascript:selectArtistDetail('${ArtistList.artist_no }')">
																${ArtistList.artist_name}
															</a>
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>좋아요</td>
														<td>${ArtistList.like_cnt}</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align: center;">
															<a href="javascript:artistLike(${ArtistList.artist_no })">
															좋아요 취소
															</a>
														</td>
															
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
							
							
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
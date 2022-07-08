<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>1:1문의게시판</title>
<!-- plugins:css -->
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<style>
/*내용*/
.contents {
	text-align: left;
	display: none;
}

.ctsBold {
	font-weight: bold;
}

.contents div {
	background-color: #fffff;
	padding: 100px;
}

.table th, td {
	text-align: left;
}

/*버튼*/
.board-list btn btn-info btn-fw {
	margin-left: 500px;
	margin-top: 50px;
}

.btn_qna {
	float: right;
	margin-left: 300px;
	margin-bottom: 50px;
}
.btn_qna a {
	text-decoration:none;
}
.ctsSbj a {
	color: #8f5fe8;
}

.content-wrapper h2, h3 {
	font-weight: bold;
}

.element.style {
	margin-left: 450px;
}
.qnalist_page {
	margin: 0 550px 100px;
	
}
</style>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="../_navbar.jsp" />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<h2 class=" card-title">고객센터</h2>
					<br>
					<h3 class=" card-title">1:1 문의 게시판</h3>

					<div class=" content_div1" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">글 등록하기</h4>
										<div class="table-responsive">
											<form name="qna_frm">
												<table class="table qna_list">
													<thead>
														<tr>
															<div class="btn_qna">
																<button type="submit" class="btn btn-info btn-fw"><a href="<%=request.getContextPath()%>/qna/qnaWrite?refnum=${qnaBoard.qna_no }">1:1문의하기</a></button>
															</div>
															<th>NO.</th>
															<th>제목</th>
															<th>작성자</th>
															<th>등록날짜</th>
														</tr>

													</thead>
													<tbody>
														<c:forEach items="${qnalist }" var="qnaBoard">
															<tr class="ctsSbj">
																<th>${qnaBoard.qna_no }</th>
																<c:forEach begin="1" end="${qnaBoard.gr_layer }"> 
																</c:forEach>
																<td>${qnaBoard.qna_title }</td>
																<td>${qnaBoard.m_id }</td>
																<td>${qnaBoard.qna_date }</td>
															</tr>
															<tr class="contents">
																<td colspan="4">
																<a href="<%=request.getContextPath()%>/qna/qnaRead?refnum=${qnaBoard.qna_no }">${qnaBoard.qna_title }&nbps;</a>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
										</div>

									</div>
																			<div class="qnalist_page">
											<div class="pagination__links">
												<button type="button" class="btn btn-outline-secondary">1</button>
												<button type="button" class="btn btn-outline-secondary">2</button>
												<button type="button" class="btn btn-outline-secondary">3</button>
												<button type="button" class="btn btn-outline-secondary">4</button>
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
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script
			src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
</body>

</html>
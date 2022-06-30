<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>1:1 문의 게시판</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<style>
/*qna 테이블*/
table {
	border-collapse: collapse;
	border-spacing: 0;
}

section.notice {
	padding: 10px;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h1 {
	font-size: 40px;
	color: #white;
	font-weight: 600;
	text-align: left;
	margin-bottom: 50px;
}

.page-title h3 {
	font-size: 30px;
	color: #white;
	font-weight: 600;
	text-align: left;
}

#board-list {
	margin-left: 5px;
	margin-top: 5px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #6C7293;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table .th-view {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.board-table .faq_title {
	line-height: 1.8em;
}
/*qna 테이블 제목 클릭 시 나오는 내용*/
.container {
	width: 1100px;
	margin: 50px;
	background-color: #191c24;
	padding: 1.75rem 1.5625rem;
}

.container2 {
	width: 1100px;
	margin: 70px;
}

.container2 h1 {
	font-weight: bold;
}

.ctsSbj {
	cursor: pointer;
}

.ctsSbj:hover {
	color: #8f5fe8;
}

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

/*qna 페이징*/
.pagination__links {
	text-align: center;
	float: center;
	margin-right: 420px;
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

			<div class="content-wrapper">
				<section class="notice">

					<!--faq board list area -->
					<div id="board-list">
						<div class="page-title">
							<div class="container2">
								<h1>고객센터</h1>
								<h3>1:1 문의게시판</h3>
							</div>
						</div>
						<div class="container">
							<table class="board-table">
								<thead>
									<div class="faq_title">
										<div class="btn_qna">
											<button type="submit" class="btn btn-info btn-fw">문의하기</button>
										</div>
									</div>
									<div class="card-body">
										<tr>
											<th scope="col" class="th-num">NO.</th>
											<th scope="col" class="th-title">제목</th>
											<th scope="col" class="th-date">작성자</th>
											<th scope="col" class="th-view">등록날짜</th>
										</tr>
								</thead>
								<tbody>
									<tr class="ctsSbj">
										<td>1</td>
										<th><a href="#!">a</a>
											<p>테스트</p></th>
										<td>작성자</td>
										<td>2022.08.08</td>
									</tr>
									<tr class="ctsSbj">
										<td>2</td>
										<th><a href="#!">제목</a>
											<p>테스트</p></th>
										<td>작성자</td>
										<td>2022.08.08</td>
									</tr>

							</table>
						</div>
						<!-- 페이징 -->
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
		</section>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>자주묻는질문</title>
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
table.faq_list  tr>td:nth-child(1), table.faq_list  tr>td:nth-child(2),
	table.faq_list  tr>td:nth-child(3), table.faq_list  tr>td:nth-child(7),
	table.faq_list  tr>td:nth-child(8), table.faq_list  tr>td:nth-child(9)
	{
	width: 100%;
}

table.faq_list  tr>td:nth-child(7), table.faq_list  tr>td:nth-child(8),
	table.faq_list  tr>td:nth-child(9) {
	text-align: center;
}
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
.table th, td{
text-align: left;
}

/*버튼*/
.board-list btn btn-info btn-fw {
	margin-left: 500px;
	margin-top: 50px;
}
.btn_faq {
	float: right;
	margin-left: 300px;
	margin-bottom: 50px;
}
.ctsSbj a{
color: #8f5fe8;
}
.content-wrapper h2,h3{
font-weight: bold;
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
					<h3 class=" card-title">자주 묻는 질문</h3>
					
					<div class=" content_div1" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">질문 TOP10</h4>
										<div class="table-responsive">
											<form name="faq_frm">
												<table class="table faq_list">
													<thead>
														<tr>
															<div class="btn_faq">
																<button type="submit" class="btn btn-info btn-fw">1:1문의하기</button>
															</div>
															<td >No.</td>
															<td>제목</td>
															<td>수정일</td>
															<td>조회수</td>
														</tr>
													
													</thead>
													<tbody>
														<tr class="ctsSbj">
															<td></td>
															<th><a href="#!">
															</th>
															<td></td>
															<td></td>
															<td></td>
														</tr>
														<tr class="contents">
															<td colspan="5">
																<div>
																	<p>안녕하세요, 고객님.</p>
																	<p>해지 신청 시, 정기결제해지와 중도해지 중 선택할 수 있습니다.</p>
																	<p class="ctsBold">[해지 경로]정기결제해지/중도해지에 대한 경로는 다음과
																		같습니다.</p>
																	<p>
																		<br>관련된 세부 사항이 궁금하신 분은 아래 자세히 보기 링크를 클릭하셔서 내용 확인
																		부탁드립니다.
																	</p>
																	<p>
																		<a href="#" target="_blank">▶ 
																		<PISIC PISIC MEMBERSHIP> 자세히 보러가기</a>
																	</p>
																	<p>감사합니다.</p>
																</div>
															</td>
														</tr>
													
													</tbody>
												</table>
											</form>
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
		<!-- End custom js for this page -->
		<script>
			$(function() {

				$('.ctsSbj').click(function() {
					$(this).next('.contents').slideToggle(300);
				});

			});
		</script>
</body>

</html>
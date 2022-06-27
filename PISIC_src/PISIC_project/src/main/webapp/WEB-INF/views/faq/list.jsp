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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>자주 묻는 질문</title>
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

<style>
/*faq 테이블*/
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

.page-title h3 {
	font-size: 40px;
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
/*faq 테이블 제목 클릭 시 나오는 내용*/

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
								<h3>자주묻는질문</h3>
							</div>
						</div>
						<div class="container">
							<table class="board-table">
								<thead>
									<div class="faq_title">
										<h3>질문 TOP10</h3>
										<div class="btn_qna">
											<button type="submit" class="btn btn-info btn-fw">1:1문의하기</button>
										</div>
									</div>
									<div class="card-body">
										<tr>
											<th scope="col" class="th-num">순서</th>
											<th scope="col" class="th-title">제목</th>
											<th scope="col" class="th-date">수정일</th>
											<th scope="col" class="th-view">조회수</th>
										</tr>
								</thead>
								<tbody>
									<tr class="ctsSbj">
										<td>7</td>
										<th><a href="#!">[이용권] 이용권 해지 종류에는 어떤 것이 있고, 어떤 경로를
												통하여 이용권을 해지할 수 있나요?</a>
											<p>테스트</p></th>
										<td>2022.06.27</td>
										<td>79283457</td>
									</tr>
									<tr class="contents">
										<td colspan="4">
											<div>
												<p>안녕하세요, 고객님.</p>
												<p>해지 신청 시, 정기결제해지와 중도해지 중 선택할 수 있습니다.</p>
												<p class="ctsBold">[해지 경로]정기결제해지/중도해지에 대한 경로는 다음과 같습니다.</p>
												<p>
													<br>관련된 세부 사항이 궁금하신 분은 아래 자세히 보기 링크를 클릭하셔서 내용 확인
													부탁드립니다.
												</p>
												<p>
													<a href="#" target="_blank">▶ <PISIC PISIC MEMBERSHIP>
														자세히 보러가기</a>
												</p>
												<p>감사합니다.</p>
											</div>
										</td>
									</tr>

									<tr class="ctsSbj">
										<td>6</td>
										<th><a href="#!">내가 만든 DJ플레이리스트를 삭제할 수 있나요?</a>
											<p>테스트</p></th>
										<td>2022.06.27</td>
										<td>79283457</td>
									</tr>
									<tr class="contents">
										<td colspan="4">
											<div>
												<p>안녕하세요, 고객님.</p>
												<p>
													DJ플레이리스트는 ‘마이뮤직 > DJ플레이리스트’ 메뉴에서 ‘순서변경/삭제’ 버튼을 통해서 삭제할 수
													있습니다.<br> 단, 멜론DJ 메뉴 내 ‘명예의 전당’에 선정된 DJ플레이리스트는 삭제가
													불가능하며, 곡 추가 및 소개글의 수정만 가능합니다.
												</p>
												<p>
													구매 예정인 고객님께서는 웩 참고 부탁드립니다.<br> 웩 죄송합니다.
												</p>
												<p>감사합니다.</p>
											</div>
										</td>
									</tr>

									<tr>
										<td>5</td>
										<th><a href="#!">ajsldkfjalksdfjlaksdjfl</a>
											<p>테스트</p></th>
										<td>2022.06.27</td>
										<td>79283457</td>
									</tr>

									<tr>
										<td>4</td>
										<th><a href="#!">아아아아ㅏ아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏ</a>
											<p>테스트</p></th>
										<td>2022.06.27</td>
										<td>79283457</td>
									</tr>

									<tr>
										<td>3</td>
										<th><a href="#!">피식 탈퇴방법</a>
											<p>테스트</p></th>
										<td>2022.06.27</td>
										<td>79283457</td>
									</tr>

									<tr class="ctsSbj">
										<td>2</td>
										<th><a href="#!">PISIC MEMBERSIHP 환불 안내</a></th>
										<td>2022.06.15</td>
										<td>92839</td>
									</tr>
									<tr class="contents">
										<td colspan="4">
											<div>
												<p>안녕하세요, 피식입니다.</p>
												<p>
													※ 내가 만든 DJ플레이리스트도 ‘좋아요’를 하실 수 있습니다.<br> ※ 좋아요 / 좋아요
													취소는 로그인 후 가능합니다..<br> ※ 좋아요 / 좋아요 취소는 로그인 후 가능합니다.다.<br>
													감사합니다.
												</p>
											</div>
										</td>
									</tr>
									<tr class="ctsSbj">
										<td>1</td>
										<th><a href="#!">PISIC 멤버십 이용안내</a></th>
										<td>2022.06.01</td>
										<td>74358</td>
									</tr>
									<tr class="contents">
										<td colspan="4">
											<div>
												<p>
													안녕하세요, 피식입니다.<br> ※ 내가 만든 DJ플레이리스트도 ‘좋아요’를 하실 수 있습니다.
													※ 좋아요 / 좋아요 취소는 로그인 후 가능합니다..<br> ※ 좋아요 / 좋아요 취소는 로그인
													후 가능합니다.다.<br> 감사합니다.
												</p>
												<p>감사합니다.</p>
											</div>
										</td>
									</tr>
							</table>

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
	<script>
		$(function() {

			$('.ctsSbj').click(function() {
				$(this).next('.contents').slideToggle(300);
			});

		});
	</script>

</body>
</html>
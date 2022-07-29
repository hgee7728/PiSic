<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>PJ LOUNGE MAIN</title>

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
.qnalist_page{
position:absoulte;
top:30%;
left:50%;
transform: translate(-50%, -50%);
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

					<h2 class=" card-title">PJ LOUNGE</h2>
					<br>
					<h3 class=" card-title">나의 플레이리스트를 공유해보세요</h3>
							<form method="post" action="list.qna" id="list">
								<input type="hidden" name="curPage" value="1" />
								
								<div id="list-top">
									<div>
										<ul>
											<li>
												<select name="search" class="w-px80">
													<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
													<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
													<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
													<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
												</select>
											</li>
											<li><input value="${page.keyword }" type="text" name="keyword" class="w-px300" /></li>
											<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>
										</ul>
										<ul>
											<core:if test="${login_info.admin eq 'Y' }">
												<li><a class="btn-fill" href="new.qna">글쓰기</a></li>
											</core:if>			
										</ul>
									</div>
								</div>
							</form>
					<div class="container">
						<div class="search-window">
							<div class="search-wrap">
								<label for="search" class="blind">PJ 검색하기</label> 
								<input id="search" type="search" name="" placeholder="플레이리스트를 입력해주세요."
									value="">
								<button type="submit" class="btn btn-info btn-fw">검색</button>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<span class="album_cover"></span>
								</div>
								<div class="card-body">
									<div class="info">
										<input type="hidden" value="${board.b_no }" name="a_no">
									</div>
									<div class="meta"></div>

									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<img src="" alt="">
								</div>
								<div class="card-body">
									<span>f</span>
									<h4>sksksk</h4>
								</div>
							</div>
						</div>
						<div class="select_btns">
							<button type="submit" class="btn btn-info btn-fw"
							onclick="location.href='<%=request.getContextPath() %>/pjlounge/pjlounge_write'">
								플레이리스트<br>만들기
							</button>
						</div>
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
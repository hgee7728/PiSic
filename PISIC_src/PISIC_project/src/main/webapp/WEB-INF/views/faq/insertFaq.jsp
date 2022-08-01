<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>FAQ 관리자 페이지</title>

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
input {
  outline-color: white;
  padding: 5px;
  color:white;
}
/*버튼*/
.ctsSbj a {
	color: #8f5fe8;
}

.content-wrapper h2, h3 {
	font-weight: bold;
}


.stretch-card>.card {
	width: 100%;
	min-width: 100%;
}
.btn_faq {
	position: relative;
	margin:30px auto;
	float: center;
/*center*/
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 20px;
    border-color:white;
    background-color: transparent;
    color: white;
}

label {
float:left;
}
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	var header = $("meta[name='_csrf_header']").attr('th:content');
	var token = $("meta[name='_csrf']").attr('th:content');
});
</script>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<h2 class=" card-title">고객센터</h2>
					<br>
					<h3 class=" card-title">자주묻는 문의글 등록</h3>

							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">

										<form id="writeform" action="<%=request.getContextPath()%>/faq/insertFaq" method="post">
										 <!-- csrf 공격 방지 -->
										 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

											<div  class="form-group">
												<label  for="faq_title">자주 묻는 문의</label>             
												<textarea  class="form-control" id="faq_title" name="faq_title" placeholder="(자주 묻는 질문을 등록해주세요)"   style="height: 250px; width: 1000px;"></textarea>
											</div>
											<br>
											<div  class="form-group">	
												<label  for="faq_content">문의 답변 내용</label>            
												<textarea  class="form-control" id="faq_content" name="faq_content" placeholder="(자주 묻는 질문에 대한 답변을 등록해주세요)"  maxlength="2048" style="height: 350px; width: 1000px;"></textarea>
											</div>
											
										<div class="btn_faq" style="float:center;">
											<button type="submit" class="btn btn-info btn-fw">등록하기</button>
											<button type="button" class="btn btn-info btn-fw"  onclick="location.href='<%=request.getContextPath()%>/faq/faqList'">목록으로</button>
										</div>
									</form>
									</div>
								</div>
							</div>
					<!-- content-wrapper ends -->
				</div>
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
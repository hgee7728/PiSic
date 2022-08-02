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
<title>1:1 문의 글쓰기 페이지</title>

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

.btn_qna {
	display:block;
	width:400px;
    margin:auto;
	padding: 30px;
}

textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
    border-color:white;
    background-color: transparent;
    color: white;
}

label {
float:left;
}
<</style>
<script>
$(function(){
	// 게시물 100자 제한
	$('#recomment_content').on('keyup', function() {
        $('.recomment_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('.recomment_cnt').html("(100 / 100)");
        }
    });
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
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<h2 class=" card-title">고객센터</h2>
					<br>
					<h3 class=" card-title">1:1 문의하기</h3>

							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">

										<form id="writeform" action="<%=request.getContextPath()%>/qna/qnaWrite" method="post">
										 <!-- csrf 공격 방지 -->
           						 		<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
											<h4 class="card-title">문의글 등록하기</h4>

											<div  class="form-group">
												<label  for="qna_title">제목</label>  
												<textarea  class="form-control" id="qna_title" name="qna_title" placeholder="제목을 작성해주세요."   style="height: 50px; width: 1000px;"></textarea>
												<!--  <input  type="text"  class="form-control" style="background-color:transparent; width: 1000px; height: 30px;"  id="qna_title" name="qna_title" placeholder="제목을 작성해주세요." > -->
											</div>
											<div  class="form-group">	
												<label  for="qna_content">내용</label>            
												<textarea  class="form-control" id="qna_content" name="qna_content" placeholder="1:1문의할 내용을 입력해주세요."  maxlength="2048" style="height: 400px; width: 1000px; margin-left: -38px;" ></textarea>
											</div>
											
										<div class="btn_qna" >
											<button type="submit" class="btn btn-info btn-fw">등록하기</button>
											<button type="button" class="btn btn-info btn-fw"  onclick="location.href='<%=request.getContextPath()%>/qna/qnaList'">목록으로</button>
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
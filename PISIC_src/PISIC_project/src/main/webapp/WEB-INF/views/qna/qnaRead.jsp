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
<title>1:1문의게시판 상세조회</title>
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
							<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/'">홈</button></div>

<c:choose>

	<div>
<c:if test="${member.m_id eq loginSsInfo.id }">
	<form id="frmNum">
		<input type="hidden" name="qna_no" value="${qna.qna_no }">
		<button type="button" class="btn update">수정</button>
		<button type="button" class="btn delete">삭제</button>
	</form>
	<script>
		$(".btn.update").click(function(){
			if($(this).hasClass("update")){
				frmNum.action="<%=request.getContextPath()%>/qna/update";
			}else {
				frmNum.action="<%=request.getContextPath()%>/qna/delete";
			}
			frmNum.method="post";
			frmNum.submit();
		});
		
		$(".btn.delete").click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/qna/delete",
				type:"post",
				data: {qna_no:"${qna.qna_no }"},
				success:function(result){
					console.log(result);
					if(result){
						alert(result);
					}
					location.href="<%=request.getContextPath() %>/qna/qnaList";
				},
				error:function(error){
					
				}
			});
		});
	</script>
</c:if>
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
																<td colspan="4">${qnaBoard.qna_content }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
		<div>
			내용:${qnaBoard.qna_content }
		</div>

	</div>
	<hr>


</c:choose>

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
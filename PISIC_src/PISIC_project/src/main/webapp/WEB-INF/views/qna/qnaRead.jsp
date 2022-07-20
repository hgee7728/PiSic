<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<style>
	@media  {
	.col-md-6 {
	max-width: 100%;
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
						
			 <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">		
			 			<c:choose>
						<c:when test="${empty qnaBoard}">
							<script>
								alert("해당 글이 없습니다. 글목록으로 이동합니다.");
								location.href = "<%=request.getContextPath()%>/qna/qnaList";
							</script>
						</c:when>
						<c:otherwise>
							<div>
									<c:if test="${qnaBoard.m_id eq loginSsInfo.m_id }">
										<form id="frmNum">
											<input type="hidden" name="qna_no" value="${qnaBoard.qna_no }">
											<button type="button" class="btn btn-info btn-fw">수정</button>
											<button type="button" class="btn btn-info btn-fw">삭제</button>
										</form>
										<script>
											$(".btn.update").click(function(){
												if($(this).hasClass("update")){
													frmNum.action="<%=request.getContextPath()%>/qna/qnaUpdate";
												}else {
													frmNum.action="<%=request.getContextPath()%>/qna/qnaDelete";
												}
												frmNum.method="post";
												frmNum.submit();
											});
											
											$(".btn.delete").click(function(){
												$.ajax({
													url:"<%=request.getContextPath()%>/qna/delete",
													type:"post",
													data: {qna_no:"${qnaBoard.qna_no }"},
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
										<table border="1">
											<tr>
												<td>level</td>	
												<td>ref</td>	
												<td>seq</td>			
												<td>번호</td>
												<td>제목</td>
												<td>작성일</td>
												<td>작성자</td>
												<td>비밀글</td>				
											</tr>
											<tr>
												<td>${qnaBoard.gr_layer }</td>	
												<td>${qnaBoard.gr_ord }</td>	
												<td>${qnaBoard.orgin_no }</td>			
												<td><a href="<%=request.getContextPath()%>/qna/qnaRead?refnum=${qnaBoard.qna_no }">${qnaBoard.qna_no }</a></td>
												<td>
								<c:forEach begin="1" end="${qnaBoard.qna_no }"> 
												&#8618;
								</c:forEach>
												${qnaBoard.qna_title }
												</td>
												<td>${qnaBoard.qna_date }</td>
												<td>${qnaBoard.m_id }</td>
												<td>${qnaBoard.qna_secret }</td>	
											</tr>
										</table>
										<div>
											<% pageContext.setAttribute("newLineChar", "\n"); %>
											내용:${fn:replace(qnaBoard.qna_content, newLineChar, "<br/>")}
										</div>
										
										
								<div class="btnSet">
									<!-- 관리자인 경우 수정 삭제 가능 -->
									<core:if test="${login_info.admin eq 'Y' }">
										<a class="btn btn-info btn-fw" href="qnaUpdate?id=${member.m_id }">수정</a>
										<a class="btn btn-info btn-fw" onclick="if(confirm('정말 삭제하시겠습니까?')) { href='qnaDelete?id=${member.m_id }' }">삭제</a>
									</core:if>
									<!-- 로그인이 된 경우 답글 쓰기 가능 -->
									<core:if test="${!empty login_info }">
										<a class="btn btn-info btn-fw" href="<%=request.getContextPath()%>/qna/qnaWrite?refnum=${qnaBoard.qna_no }">답글 쓰기</a>
									</core:if>
								</div>
								
									</div>
									<hr>
									<!-- 관리자만 보이게하기  
								  	<div>답글작성</div>
									<form action="<%=request.getContextPath() %>/qna/qnaWrite" method="post">
									 	<input type="text" name="refnum" value="${qnaBoard.qna_no }" readonly>
										<div>제목:<input type="text" name="qna_title" required></div>
										<div>내용:<input type="text" name="qna_content" required></div>
										<div><button type="submit">답글등록</button></div>
									</form>-->
								</c:otherwise>
							</c:choose>
								
						<div>
						<button type="button" class="btn btn-info btn-fw" onclick="location.href='<%=request.getContextPath() %>/'">메인으로 돌아가기</button>
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
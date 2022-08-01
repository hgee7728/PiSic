<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

/*내용*/
.contents {
	text-align: left;
	display: none;
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
	margin: 50px;
}

.btn_faq {
	float: right;
	margin: 100px 0 50px 300px;
	text-decoration: none;
}

.content-wrapper h2, h3 {
	font-weight: bold;
}

button{
	margin-right: 10px;
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

//조회수 cnt
$(document).ready(function(){
	$(".ctsSbj").on("click", function(){
		$(".contents").toggleClass("active");
		if ($(".contents").hasClass("active")) {
			$(this).next('.contents').slideToggle(500);
		} else {
			$(this).next('.contents').slideToggle(500);
			
			var header = $("meta[name='_csrf_header']").attr('th:content');
			var token = $("meta[name='_csrf']").attr('th:content');
			console.log(header);
			console.log(token);
			
			$.ajax({
				url:"<%=request.getContextPath() %>/faq/updateFaqCnt",
				type:"post",
				data:{
					faq_no : $(this).next("input[name=update_faq_cnt]").val()
					},
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    	},
				success: function(result){
					if(result == 1){
						alert("dddddddd");
						location.reload();
					}
				},
				error:function(){
				}
			}); //ajax 끝
		}
	})
});

//한개 삭제 버튼
$(document).on("click", ".delete_faq", function() {
	console.log($(this).next("input[name=delete_faq_no]").val()+"---------------------------------");
	var confm = confirm("해당 FAQ를 삭제 하시겠습니까?");
	var header = $("meta[name='_csrf_header']").attr('th:content');
	var token = $("meta[name='_csrf']").attr('th:content');
	console.log(header);
	console.log(token);
	
	if (confm == false) {
		alert("취소하셨습니다.");
	} else {
		$.ajax({
			url:"<%=request.getContextPath()%>/faq/deleteFaq",
			type : "post",
			data : {
				faq_no : $(this).next("input[name=delete_faq_no]").val()
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log(result);
				if (result == 0) {
					alert("FAQ 삭제가 실패했습니다. 다시 시도해주세요");

				} else {
					alert("FAQ가 삭제 되었습니다.");
					location.reload();
				}
			},
			error : function(error) {

			}
		}); // ajax 끝
	}
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
										<div class="table-responsive">
											<form name="faq_frm">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
												<table class="table faq_list">
													<thead>
														<tr>

															<td>No.</td>
															<td>제목</td>
															<td>최종 수정일</td>
															<td>조회수</td>
															<sec:authorize access="hasRole('ROLE_ADMIN')">
															<td colspan="2">관리자 기능</td>
															</sec:authorize>
														</tr>

													</thead>
													<tbody>
														<c:forEach items="${faqBoard }" var="faqBoard">
															<tr class="ctsSbj" style="cursor: pointer;">
																<th>${faqBoard.faq_no }</th>
																<td>${faqBoard.faq_title }</td>
																<td><fmt:formatDate pattern="yyyy-MM-dd" value="${faqBoard.faq_date }" /></td>
																<td style="text-align: center;">${faqBoard.faq_cnt }</td>
																<sec:authorize access="hasRole('ROLE_ADMIN')">
																	<td>
																		<div class="select_btns">
																			<button type="button"
																				class="btn btn-info btn-md update update_faq"
																				onclick="location.href='<%=request.getContextPath() %>/faq/updateFaq?faq_no=${faqBoard.faq_no }'">
																				수정</button>
																		</div>
																	</td>
																	<td>
																		<div class="select_btns">
																			<button type="button"
																				class="btn btn-info btn-md delete delete_faq">
																				삭제</button>
																			<input type="hidden" value="${faqBoard.faq_no}"
																				name="delete_faq_no">
																		</div>
																	</td>
																</sec:authorize>

															</tr>
															<tr class="contents">
																<td></td>
																<td style="height: 200px;">
																<p>
																	<div>
																		<%pageContext.setAttribute("newLineChar", "\n");%>${fn:replace(faqBoard.faq_content, newLineChar, "<br/>")}
																	</div>
																</p>
																</td>
															
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</form>
											<div class="btn_faq row">
												<sec:authorize access="hasRole('ROLE_ADMIN')">
												<div>
												<h5>[관리자 기능]</h5>
												<button type="button" class="btn btn-info btn-fw"
													onclick="location.href='<%=request.getContextPath()%>/faq/insertFaq'">
													자주묻는질문<br>등록하기</a>
												</button>
												</div>
												</sec:authorize>
												<div>
												<h5>찾으시는 내용이 없으신가요?</h5>
												<button type="button" class="btn btn-info btn-fw"
													onclick="location.href='<%=request.getContextPath()%>/qna/qnaList'">
													1:1 문의로<br>이동하기</a>
												</button>
												</div>
											</div>
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

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
	text-decoration: none;
}

.ctsSbj a {
text-decoration: none;
	color: #6C7293;
}

.content-wrapper h2, h3 {
	font-weight: bold;
}

.element.style {
	margin-left: 450px;
}

.qnalist_page {
	margin: 200px auto;
}

.pageInfo_wrap{
	text-align: center;
}
.pageInfo{
    list-style : none;
    display: inline-block;
   	margin: 50px 0 0 100px;      
}
.pageInfo li{
    float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
 }
.board_table a{
	color: #6c7293;
}
.pageInfo a:link {color:white; text-decoration: none;}
.pageInfo a:visited {color:white; text-decoration: none;}
.pageInfo a:hover {color:white; text-decoration: underline;}
.here{
      background-color: #8f5fe8;
  }
/*th:nth-of-type(1) { 
display: none;
 } */
</style>

</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar_admin.jsp" />
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
										<h4 class="card-title">문의글 등록하기</h4> 
										<div class="table-responsive">
												<table class="table qna_list">
													<thead>
														<c:if test="${qnaBoard.m_id eq loginSsInfo.m_id }">
															<div class="btn_qna">
																<button type="button" class="btn btn-info btn-fw" onclick="location.href='<%=request.getContextPath()%>/qna/qnaWrite'">1:1문의하기</button>
															</div>
														</c:if>
														<tr>
															<th>NO.</th>
															<th>제목</th>
															<th>작성자</th>
															<th>등록날짜</th>
														</tr>
													</thead>
													
													<tbody>
													<c:forEach items="${qnalist }" var="qnaBoard" varStatus="status">
														<tr class="ctsSbj">
															<th>${qnaPaging.total - ((qnaPaging.cri.pageNum-1) * qnaPaging.cri.amount + status.index) }</th>
															<td>
																
																<form id="frm${qnaBoard.qna_no }" action="<%=request.getContextPath()%>/qna/qnaRead" method="post">		
																	 <!-- csrf 공격 방지 -->
					                     						 	<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">							
																    <a href="javascript:;" onclick="document.getElementById('frm${qnaBoard.qna_no }').submit();">
																	    <c:forEach begin="1" end="${qnaBoard.gr_layer }" step="1">
																		<i class="mdi mdi-subdirectory-arrow-right"></i>
																		</c:forEach>
																		${qnaBoard.qna_title }
																	</a>
																    <input type="hidden" name="qna_no" value="${qnaBoard.qna_no }"/>
																</form>
															</td>
															<td>${qnaBoard.m_id }</td>
															<td>${qnaBoard.qna_date }</td>
														</tr>
												</c:forEach>
															
															
														<!-- 답변글 아닌 원글 -->

														<!-- 			<c:if test="${qnaBoard.gr_layer == 0 }">
																<span class="subject" onclick="goView('${qnaBoard.qna_no}');">${qnaBoard.subject }&nabs;
																<span style="vertical-align: super;">[<span style="color: purple; font-size:9pt; font-style:inalic; font-weight:bold;" ></span>]</span>
																</span>
													</c:if> -->
														<!-- 답변글인 경우 -->
														<!-- 		
														<c:if test="${qnaBoard.gr_layer > 0 }">
																<span class="subject" onclick="goView('${qnaBoard.qna_no}');">
																<span style="vertical-align: super;">[<span style="color: purple;  font-style:inalic;" > Re&nbsp;&nbsp;</span>${qnaBoard.title }&nbsp;
																<span style="vertical-align: super;">[<span style="color: purple; font-size:9pt; font-style:inalic; font-weight:bold;" ></span>]</span>
																</span>
																</span> 
														</c:if> 
														 -->

														
															
													</tbody>
												</table>
										</div>
									</div>
									
									 <!-- 게시판 하단의 페이징 버튼 -->
							<div class="pageInfo_wrap" >
						        <div class="pageInfo_area">
						        	<ul id="pageInfo" class="pageInfo">
							        <c:if test="${qnaPaging.prev}">
					                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/admin/qnaList?pageNum=${qnaPaging.startPage-1}">Previous</a></li>
					                </c:if>
						 			
						 			<c:forEach var="num" begin="${qnaPaging.startPage}" end="${qnaPaging.endPage}">
					                    <li class='pageInfo_btn ${qnaPaging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/admin/qnaList?pageNum=${num}">${num}</a></li>
					                </c:forEach>
					                
					                <c:if test="${qnaPaging.next}">
					                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/admin/qnaList?pageNum=${qnaPaging.endPage + 1 }">Next</a></li>
					                </c:if>  
					                </ul>
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
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
 table.qnaRead {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.qnaRead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.qnaRead td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

.btnSet { 
	display :inline-block;
}

</style>
<script>
const root_path = '<%=request.getContextPath() %>';
$(function(){
		var msg = '${msg}';
		if(msg){
			alert(msg);
		}
		var header = $("meta[name='_csrf_header']").attr('th:content');
		var token = $("meta[name='_csrf']").attr('th:content');
	});
	// 게시물 100자 제한
	$('#').on('keyup', function() {
        $('.').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('.').html("(100 / 100)");
        }
    });
}
// 글 수정
$("#update_qna").click(function(){
	modify_frm.action = "<%=request.getContextPath()%>/qna/qnaUpdate";
	modify_frm.method = "post";
	modify_frm.submit();
});

//한개 삭제 버튼
$(document).on("click", ".delete_qna", function() {
	console.log($(this).next("input[name=delete_qna_no]").val()+"---------------------------------");
	var confm = confirm("해당 QNA를 삭제 하시겠습니까?");
	var header = $("meta[name='_csrf_header']").attr('th:content');
	var token = $("meta[name='_csrf']").attr('th:content');
	console.log(header);
	console.log(token);
	
	if (confm == false) {
		alert("취소하셨습니다.");
	} else {
		$.ajax({
			url:"<%=request.getContextPath()%>/qna/delete",
			type : "post",
			data : {
				faq_no : $(this).next("input[name=delete_qna_no]").val()
			},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				console.log(result);
				if (result == 0) {
					alert("QNA 삭제가 실패했습니다.");

				} else {
					alert("QNA가 삭제 되었습니다.");
					location.reload();
				}
			},
			error : function(error) {

			}
		}); 
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
										 csrf 공격 방지 
                      					<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
											<input type="hidden" name="qna_no" value="${qnaBoard.qna_no }">
											<button type="button" id="update_qna" class="btn btn-info btn-fw">수정</button>
											<button type="button" id="delete_qna" class="btn btn-info btn-fw">삭제</button>
										</form> 
											</c:if>
										<table class="qnaRead">
											<tr>
												<th>번호</th>
												<td>${qnaBoard.qna_no }</td>
												<th>작성일</th>
												<td>${qnaBoard.qna_date }</td>
											</tr>
											<tr>
												<th>제목</th>
												<td>${qnaBoard.qna_title }</td>
												<th>작성자</th>
												<td>${qnaBoard.m_id }</td>
											</tr>
											<tr >
												<th >내용</th>	
												<td colspan="3"><% pageContext.setAttribute("newLineChar", "\n"); %>${fn:replace(qnaBoard.qna_content, newLineChar, "<br/>")}</td>
											</tr>
										</table>
										
							<!--	<div class="btnSet">
									 관리자인 경우 수정 삭제 가능
									<core:if test="${login_info.m_id eq 'admin' }">
										<a class="btn btn-info btn-fw"  id="update_btn" href="qnaUpdate?id=${member.m_id }">수정</a>
										<a class="btn btn-info btn-fw" id="delete_btn" onclick="if(confirm('정말 삭제하시겠습니까?')) { href='qnaDelete?id=${member.m_id }' }">삭제</a>
									</core:if> -->
									<!-- 로그인이 된 경우 답글 쓰기 가능 -->
							<!--		<core:if test="${!empty login_info }">
										<a class="btn btn-info btn-fw" href="<%=request.getContextPath()%>/qna/qnaWrite?refnum=${qnaBoard.qna_no }">답글 쓰기</a>
									</core:if>
								</div>-->
									
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
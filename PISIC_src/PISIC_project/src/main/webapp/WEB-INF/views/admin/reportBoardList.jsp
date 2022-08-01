<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="_csrf_header" th:content="${_csrf.headerName}">
	<meta name="_csrf" th:content="${_csrf.token}">
<title>PISIC ADMIN</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css"
	rel="stylesheet" type="text/css">
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
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.table-responsive {
	width: 100%;
	height: 680px;
	overflow: auto;
}


table.board_list  tr>td {
	text-align: center;
}

table.board_list  tr>td:nth-child(1),
table.board_list  tr>td:nth-child(2){
	width:5%;
}
table.board_list  tr>td:nth-child(5){
	width:15%;
}
table.board_list  tr>td:nth-child(6),
table.board_list  tr>td:nth-child(7){
	width:10%;
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
.pageInfo a:link {color:white; text-decoration: none;}
.pageInfo a:visited {color:white; text-decoration: none;}
.pageInfo a:hover {color:white; text-decoration: underline;}
.here{
      background-color: #8f5fe8;
  }
  
table.board_list a{
	color:#6c7293;
}
/* modal 신고하기*/
#report_modal.report_modal_overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color: rgba(0, 0, 0, 0.7);
	border-radius: 10px;
	border: 1px solid black;
	z-index: 1000;
	
}
#report_modal .report_modal_window {
	border-radius: 10px;
	width: 400px;
	height: 420px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow: auto;
}
.report_modal_new{
	padding:30px !important;
}
.report_modal_content p.modal_content {
	line-height: 40px !important;
}
.report_modal{
	overflow: auto !important;
}
.report_content {
	white-space: pre-line;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	var header = $("meta[name='_csrf_header']").attr('th:content');
	var token = $("meta[name='_csrf']").attr('th:content');
	
	// 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    $("input:checkbox").click(function() {
		var total = $(".sound_checkbox").length;
		var checked = $(".sound_checkbox:checked").length;
		console.log("total : " + total);
		console.log("checked : " + checked);
		if(total != checked) {
			$("#check_all").prop("checked", false);
		} else {
			$("#check_all").prop("checked", true); 
		}
	});

	// 한개 삭제 버튼
	$(".delete_board_btn").click(function(){
		var confm = confirm("해당 게시글을 삭제 하시겠습니까?");
    	if (confm == false) {
    		alert("취소하셨습니다.");
    	} else {
    		$.ajax({
    			url:"<%=request.getContextPath()%>/admin/deleteReportBoard",
    			type:"post",
    			beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
    			data:{
    				b_no: $(this).next("input[name=delete_one_b_no]").val(),
    				},
    			success:function(result){
    				console.log(result);
    				if(result == "0"){
    					alert("게시글 삭제가 실패했습니다. 다시 시도해주세요");
    				} else {
    					alert("게시글이 삭제 되었습니다.");
    					location.reload();
    				}
    			},
    			error:function(error){
    				
    			}
    		}); // ajax 끝
    	}
	});
	
	// 게시글로 이동
	$(".read_board_btn").click(function(){
		let b_no = $(this).next("input[name=read_one_b_no]").val();
		console.log("b_no : " + b_no)
		location.href = '<%=request.getContextPath()%>/pjBoard/read?b_no='+b_no+'';
	});
	
	// 선택 삭제
	$("#select_delete").click(function(){
		if($('#board_list input[name=b_no]:checked').length == '0'){
			alert("게시글을 선택하세요.");
		} else {
			var confm = confirm("선택된 게시글을 삭제 하시겠습니까?");
	    	if (confm == false) {
	    		alert("취소하셨습니다.");
	    	} else {
	    		var b_noArray = [];
	    		$('#board_list input[name=b_no]:checked').each(function(){ //체크된 리스트 저장
	    			b_noArray.push($(this).val());
	    	    });
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/admin/deleteReportBoard",
	    			type:"post",
	    			traditional:true,
	    			beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
	    			data:{
	    				b_no: b_noArray
	    				},
	    			success:function(result){
	    				console.log(result);
	    				if(result == "0"){
	    					alert("게시글 삭제가 실패했습니다. 다시 시도해주세요");
	    				} else {
	    					alert("선택된 게시글이 삭제 되었습니다.");
	    					location.reload();
	    				}
	    			},
	    			error:function(error){
	    				
	    			}
	    		}); // ajax 끝
	    	}
		}
			
			
		
	});
	// 신고 상세내역 모달창 끄기
	report_modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("report_modal_overlay")) {
			$("#report_modal").hide();
		}
	});
	
}); // $(function(){}) 끝

// 신고 내역 읽기 - 모달창
function readReport(b_r_no){
	$("#report_modal").show();
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/readReport",
		type:"post",
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		data:{
			b_r_no: b_r_no
			},
		dataType: "json",
		success:function(result){
			console.log(result);
			$(".report_modal_content textarea[name=b_r_content]").val(result.b_r_content);
			$(".report_modal_content input[name=read_one_b_no]").val(result.b_r_no);
		},
		error:function(error){
			
		}
	}); // ajax 끝
}
</script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../_sidebar_admin.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">Report Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						
					<form name="frm_board">
					<!-- csrf 공격 방지 -->
                    <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="select_btns">
							<button type="button" id="select_delete"
								class="btn btn-info btn-fw">선택 삭제</button>
						</div>
						<br>
							<div class="table-responsive">
								<table class="table board_list" id="board_list">
									<thead>
										<tr>
											<td><div class="form-check form-check-muted m-0">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div></td>
											<td>No</td>
											<td>신고 내용</td>
											<td>신고자(아이디)</td>
											<td>신고일</td>
											<td>게시글 삭제</td>
											<td>게시글로 이동</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${boardList}" var="board" varStatus="status">

											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input sound_checkbox"
															value="${board.b_no }" name="b_no">
														</label>
													</div>
												</td>
												<td>
													<c:choose>
														<c:when test="${paging.cri.pageNum == 1}">
															${status.count }
														</c:when>
														<c:otherwise>
														${(paging.cri.pageNum-1)*10+status.count}
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<a href="javascript:readReport(${board.b_r_no })">${board.b_r_content }</a>
												</td>
												<td>${board.b_r_writer}(${board.m_id })</td>
												<td><fmt:formatDate value="${board.b_r_date}" pattern="yyyy-MM-dd hh:mm"/></td>
												<td>
													<div class="select_btns">
														<button type="button"
															class="btn btn-info delete_board_btn btn-md">삭제</button>
														<input type="hidden" value="${board.b_no}" name="delete_one_b_no">
													</div>
												</td>
												<td>
													<div class="select_btns">
														<button type="button"
															class="btn btn-info read_board_btn btn-md">이동</button>
														<input type="hidden" value="${board.b_no}" name="read_one_b_no">
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="pageInfo_wrap" >
						        <div class="pageInfo_area">
						        	<ul id="pageInfo" class="pageInfo">
							        <c:if test="${paging.prev}">
					                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/admin/report?pageNum=${paging.startPage-1}">Previous</a></li>
					                </c:if>
						 			
						 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/admin/report?pageNum=${num}">${num}</a></li>
					                </c:forEach>
					                
					                <c:if test="${paging.next}">
					                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/admin/report?pageNum=${paging.endPage + 1 }">Next</a></li>
					                </c:if>  
					                </ul>
						        </div>
						    </div>
						</form>
						<form id="movePage" method="get">
							<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
	        				<input type="hidden" name="amount" value="${paging.cri.amount }">
        				</form>
					</div>
				</div>
				<jsp:include page="../_footer.jsp" />
			</div>
		</div>
	</div>
	<div id="report_modal" class="report_modal_overlay">
		<div
			class="col-md-8 grid-margin stretch-card report_modal_window">
			<div class="card report_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">신고하기</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow report_modal_content">
									<div class="flex-grow report_modal_new" style="text-align: center;">
										<div class="form-group report_content">
											<label for="b_r_content" id="label_b_r_content">신고내용</label>
											<textarea class="form-control" rows="10"  name="b_r_content" readonly></textarea>
										</div>
										<button type="button" class="btn btn-info btn-fw read_board_btn">게시글 이동</button>
										<input type="hidden" value="" name="read_one_b_no">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</body>
</html>
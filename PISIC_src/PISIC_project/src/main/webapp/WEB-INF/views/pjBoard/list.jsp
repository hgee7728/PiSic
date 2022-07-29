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

div.search_board {
	width: 600px;
	float: right;
}

.btn-search {
	background-color: #8f5fe8;
	border-color: #8f5fe8;
	width: 100px;
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
  
.board_div{
	padding-left: 50px;
}

#search_type{
	height:30px;
	margin: 0px 10px 0px 150px;
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
    
    // 게시글 검색
	$("#search_board").click(function(){
		if($("div.search_board input[name=keyword]").val()==""){
			alert("검색어를 입력해주세요");
		} else {
			$("#search_board_frm").submit();
		}
	});
	
	// 글쓰기 버튼
	$("#insert_board").click(function(){
		location.href="<%=request.getContextPath()%>/pjBoard/write";
	});
	
	// 내가 쓴 글 보기
	$("#select_my_board").click(function(){
		location.href = "<%=request.getContextPath()%>/search/searchBoard?type=4"
	});
	
	
}); // $(function(){}) 끝

function selectBoardDetail(b_no){
	location.href = "<%=request.getContextPath()%>/pjBoard/read?b_no=" + b_no;
	
}
</script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../_sidebar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">PJ Lounge</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search_board">
							<form name="search_board_frm" id="search_board_frm" action="<%=request.getContextPath()%>/search/searchBoard">
								<div class="input-group">
										<select class="form-control" id="search_type" name="type">
											<option value="1">제목</option>
											<option value="2">작성자</option>
											<option value="3">제목+소개글</option>
										</select>
									<input type="text" class="form-control"
										placeholder="검색어" aria-label="Recipient's username"
										aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button"
											id="search_board">조회하기</button>
									</div>
								</div>
							</form>
						</div>
						
					<form name="frm_album">
					<!-- csrf 공격 방지 -->
                    <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="select_btns">
							<button type="button" id="insert_board"
								class="btn btn-info btn-fw" >글쓰기</button>
							<button type="button" id="select_my_board"
								class="btn btn-info btn-fw">내가 쓴 글 보기</button>
						</div>
						<br>
						
						<div class="row board_div" >
						<c:forEach items="${boardList }" var="board">
							<div class="col-lg-6 row" style="margin-left:10px; padding:10px 0px;">
								<div class="main_img_div">
									<a href="javascript:selectBoardDetail('${board.b_no }')"><img id="main_img"
										src="${board.l_image }"
										width="200" height="200"></a>
								</div>
								<div class="content_info">
									<div class="card-body">
										<table class="table board_table">
											<thead>
												<tr>
													<th>제목 :</th>
													<th><a href="javascript:selectBoardDetail('${board.b_no }')">${board.b_title}</a></th>
												</tr>
											</thead>
											<tbody>
												
												<tr>
													<td>작성자 :</td>
													<td>${board.b_writer}</td>
												</tr>
												<tr>
													<td>작성일 :</td>
													<fmt:formatDate var="format_b_date" value="${board.b_date}" pattern="yyyy-MM-dd"/>
													<td>${format_b_date}</td>
												</tr>
												<tr>
													<td>조회수 :</td>
													<td>${board.b_cnt}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:forEach>
							
						</div>
							<div class="pageInfo_wrap" >
						        <div class="pageInfo_area">
						        	<ul id="pageInfo" class="pageInfo">
							        <c:if test="${paging.prev}">
					                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/pjBoard/list?pageNum=${paging.startPage-1}">Previous</a></li>
					                </c:if>
						 			
						 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
					                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/pjBoard/list?pageNum=${num}">${num}</a></li>
					                </c:forEach>
					                
					                <c:if test="${paging.next}">
					                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/pjBoard/list?pageNum=${paging.endPage + 1 }">Next</a></li>
					                </c:if>  
					                </ul>
						        </div>
						    </div>
						</form>
					</div>
				</div>
				<jsp:include page="../_footer.jsp" />
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
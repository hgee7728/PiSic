<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>PISIC CHART</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
<!-- plugins:css -->
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/assets/js/_soundList.js"></script>
<style>
.btn_more {
	width: 70px;
	margin: 130px 0;
	border-radius: 50%;
	background-color: black;
	color: #ffffff;
	font-size: 50px;
}
</style>
<style>
.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}
</style>
<style>
table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(6), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8) {
	width: 5%;
}

table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(4),
	table.sound_list  tr>td:nth-child(5) {
	width: 20%;
}

table.album_list  tr>td:nth-child(1), table.album_list  tr>td:nth-child(2),
table.album_list  tr>td:nth-child(7),
	table.album_list  tr>td:nth-child(8) {
	width: 5%;
}
table.table{
	text-align: center;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}

table.table a {
	color: #6c7293;
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

});
</script>
</head>
<body>
	<jsp:include page="../commonSoundList.jsp" />
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

					<h2 class=" card-title">'${keyword }' 검색 결과</h2>

					<br>
					<c:if test="${not empty soundList}">
					<div>
						<h3 class="card-title">곡 검색 결과</h3>
					</div>
					<hr color="white">
					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title"></h4>
										<div class="table-responsive">
											<form name="sound_frm">
												<table class="table sound_list">
													<thead>
														<tr>
															<td>No</td>
															<td></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>앨범명</td>
															<td>듣기</td>
															<td>좋아요</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
													<c:if test="${empty soundList}">
														<tr>
															<td colspan="8">검색 결과가 없습니다.</td>
														</tr>
													</c:if>
														<c:if test="${not empty soundList}">
															<c:forEach items="${soundList}" var="sounds" varStatus="index">
																<tr>
																	<td>
																		<c:choose>
																			<c:when test="${paging.cri.pageNum == 1}">
																				${index.count }
																			</c:when>
																			<c:otherwise>
																			${paging.cri.pageNum*10+index.count}
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td><img src="${sounds.a_cover }" alt="image" /></td>
																	<td><a
																		href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
																	<td><c:forEach items="${ sounds.singers}"
																			var="singer">
																			<a
																				href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
																	</c:forEach></td>
																	<td><a
																		href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
																	<td><a
																		href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
																			class="mdi mdi-play list_icon"></i></a></td>
																	<td><a
																		href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
																			class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
																	</td>
																	<td><a
																		href="javascript:playlistInsert('${sounds.a_no }','${sounds.s_no}')"><i
																			class="mdi mdi-plus-box list_icon"></i></a> <!-- <i class="mdi mdi-minus-box list_icon"></i> -->
																	</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				        	<ul id="pageInfo" class="pageInfo">
					        <c:if test="${paging.prev}">
			                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.startPage-1}&type=sound&keyword=${keyword}">Previous</a></li>
			                </c:if>
				 			
				 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${num}&type=sound&keyword=${keyword}">${num}</a></li>
			                </c:forEach>
			                
			                <c:if test="${paging.next}">
			                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.endPage + 1 }&type=sound&keyword=${keyword}">Next</a></li>
			                </c:if>  
			                </ul>
				        </div>
				    </div>
					</c:if>
					<c:if test="${not empty albumList}">
					<div>
						<h3 class="card-title">앨범 검색 결과</h3>
					</div>
					<hr color="white">
					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">앨범</h4>
										<div class="table-responsive">
											<table class="table album_list">
												<thead>
													<tr>
														<td>No</td>
														<td></td>
														<td>앨범명</td>
														<td>가수명</td>
														<td>발매사</td>
														<td>기획사</td>
														<td>발매일</td>
													</tr>
												</thead>
												<tbody>
												<c:if test="${empty albumList}">
													<tr>
														<td colspan="7">검색 결과가 없습니다.</td>
													</tr>
												</c:if>
													<c:if test="${not empty albumList}">
														<c:forEach items="${albumList}" var="album" varStatus="index">
															<tr>
																<td>
																	<c:choose>
																		<c:when test="${paging.cri.pageNum == 1}">
																			${index.count }
																		</c:when>
																		<c:otherwise>
																		${paging.cri.pageNum*10+index.count}
																		</c:otherwise>
																	</c:choose>
																</td>
																<td><img src="${album.a_cover }" alt="image" /></td>
																<td><a
																	href="javascript:selectAlbumDetail('${album.a_no }')">${album.a_name }</a></td>
																<td><a
																	href="javascript:selectArtistDetail('${album.artist_no}')">${album.artist_name}</a>
																</td>
																<td>${album.a_publishing}</td>
																<td>${album.a_agency}</td>
																<fmt:formatDate var="format_a_date" value="${album.a_date}" pattern="yyyy-MM-dd"/>
																<td>${format_a_date}</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				        	<ul id="pageInfo" class="pageInfo">
					        <c:if test="${paging.prev}">
			                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.startPage-1}&type=album&keyword=${keyword}">Previous</a></li>
			                </c:if>
				 			
				 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${num}&type=album&keyword=${keyword}">${num}</a></li>
			                </c:forEach>
			                
			                <c:if test="${paging.next}">
			                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.endPage + 1 }&type=album&keyword=${keyword}">Next</a></li>
			                </c:if>  
			                </ul>
				        </div>
				    </div>
					</c:if>
					<c:if test="${not empty artistList}">
					<div>
						<h3 class="card-title">아티스트 검색 결과</h3>
					</div>
					<hr color="white">
					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">아티스트</h4>
										<div class="table-responsive">
											<table class="table sound_list">
												<thead>
													<tr>
														<td>No</td>
														<td></td>
														<td>아티스트명</td>
														<td>국적</td>
														<td>소속사</td>
														<td>활동 유형</td>
													</tr>
												</thead>
												<tbody>
												<c:if test="${empty artistList}">
													<tr>
														<td colspan="6">검색 결과가 없습니다.</td>
													</tr>
												</c:if>
													<c:if test="${not empty artistList}">
														<c:forEach items="${artistList}" var="artist" varStatus="index">
															<tr>
																<td>
																	<c:choose>
																		<c:when test="${paging.cri.pageNum == 1}">
																			${index.count }
																		</c:when>
																		<c:otherwise>
																		${paging.cri.pageNum*10+index.count}
																		</c:otherwise>
																	</c:choose>
																</td>
																<td>
																	<c:choose>
																		<c:when test="${empty artist.artist_profile}">
																			<img src="<%=request.getContextPath() %>/resources/assets/images/artist.png" />
																		</c:when>
																		<c:otherwise>
																			<img src="${artist.artist_profile }" alt="image" />
																		</c:otherwise>
																	</c:choose>
																</td>
																<td><a
																	href="javascript:selectArtistDetail('${artist.artist_no}')">${artist.artist_name}</a>
																</td>
																<td>${artist.artist_nation}</td>
																<td>${artist.artist_company}</td>
																<td>${artist.artist_type}</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				        	<ul id="pageInfo" class="pageInfo">
					        <c:if test="${paging.prev}">
			                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.startPage-1}&type=artist&keyword=${keyword}">Previous</a></li>
			                </c:if>
				 			
				 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${num}&type=artist&keyword=${keyword}">${num}</a></li>
			                </c:forEach>
			                
			                <c:if test="${paging.next}">
			                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.endPage + 1 }&type=artist&keyword=${keyword}">Next</a></li>
			                </c:if>  
			                </ul>
				        </div>
				    </div>
					</c:if>
					<c:if test="${not empty boardList}">
					<div>
						<h3 class="card-title">게시판 검색 결과</h3>
					</div>
					<hr color="white">
					<div class=" content_div3" style="display: flex;">
						<div class="row" style="width: 100%">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">게시판</h4>
										<div class="table-responsive">
											<table class="table sound_list">
												<thead>
													<tr>
														<td>No</td>
														<td></td>
														<td>제목</td>
														<td>작성자</td>
														<td>작성일</td>
													</tr>
												</thead>
												<tbody>
												<c:if test="${empty boardList}">
													<tr>
														<td colspan="6">검색 결과가 없습니다.</td>
													</tr>
												</c:if>
													<c:if test="${not empty boardList}">
														<c:forEach items="${boardList}" var="board" varStatus="index">
															<tr>
																<td>
																	<c:choose>
																		<c:when test="${paging.cri.pageNum == 1}">
																			${index.count }
																		</c:when>
																		<c:otherwise>
																		${paging.cri.pageNum*10+index.count}
																		</c:otherwise>
																	</c:choose>
																</td>
																<td><img src="${board.l_image }" alt="image" /></td>
																<td><a
																	href="javascript:selectBoardDetail('${board.b_no}')">${board.b_title}</a>
																</td>
																<td>${board.b_writer}</td>
																<fmt:formatDate var="format_b_date" value="${board.b_date}" pattern="yyyy-MM-dd"/>
																<td>${format_b_date}</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<div class="pageInfo_wrap" >
				        <div class="pageInfo_area">
				        	<ul id="pageInfo" class="pageInfo">
					        <c:if test="${paging.prev}">
			                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.startPage-1}&type=board&keyword=${keyword}">Previous</a></li>
			                </c:if>
				 			
				 			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			                    <li class='pageInfo_btn ${paging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${num}&type=board&keyword=${keyword}">${num}</a></li>
			                </c:forEach>
			                
			                <c:if test="${paging.next}">
			                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/search/searchDetail?pageNum=${paging.endPage + 1 }&type=board&keyword=${keyword}">Next</a></li>
			                </c:if>  
			                </ul>
				        </div>
				    </div>
					</c:if>
					
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
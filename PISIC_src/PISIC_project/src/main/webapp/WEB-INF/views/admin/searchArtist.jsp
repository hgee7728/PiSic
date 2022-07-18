<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

.search-artist {
	width: 600px;
}

.btn-search {
	background-color: #8f5fe8;
	border-color: #8f5fe8;
	width: 100px;
}

table.artist_list  tr>td:nth-child(5), table.artist_list  tr>td:nth-child(6),
	table.artist_list  tr>td:nth-child(7), table.artist_list  tr>td:nth-child(8),
	table.artist_list  tr>td:nth-child(9) {
	text-align: center;
}
</style>
<script>
$(function(){
	$("#search-artist").click(function(){
		$.ajax({
			type: 'GET',
			url : "<%=request.getContextPath()%>/admin/artist.do",
			data : {
				keyword: $("input[name=keyword]").val()
			},
			success : function(result){
				//테이블 초기화
				$('#artist_list > tbody').empty();
				if(result.length>=1){
					
					var html = "";
					for(var i = 0; i < result.length; i++){
						var resultData = result[i];
							
						html += '	<tr>   																				';
						html += '		<td>																			';
						html += '			<div class="form-check form-check-muted m-0">								';
						html += '			<label class="form-check-label"> <input										';
						html += '							type="checkbox" class="form-check-input sound_checkbox"		';
						html += '							name="artist_no">			';
						html += '			<i class="input-helper"></i>  			';
						html += '			</label>								';
						html += '			</div>									';
						html += '		</td>										';
						html += '		<td> ' + resultData.artist_no + ' </td>				';
						html += '		<td>										';

						if(resultData.artist_profile!=null){
						
						html += '					<img src=" ' + resultData.artist_profile +' " alt="image" />		';
						
						}
						if(resultData.artist_profile==null){
						
						html += '					<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/favicon.png" +' " alt="image" />			';
						
						}
						
						html += '		</td>										';
						html += '		<td> '+ resultData.artist_name + ' </td>				';
						html += '		<td> '+ resultData.artist_nation + ' </td>			';
						html += '		<td> '+ resultData.artist_company + ' </td>			';
						html += '		<td> '+ resultData.artist_type + ' </td>				';				
						html += '		<td>										';
						html += '		<div class="select_btns">					';
						html += '			<button type="button" id="select_artist"									';
						html += '			class="btn btn-info btn-fw">				';
						html += '			수정</button>								';
						html += '		</div>										';
						html += '		</td>										';
						html += '		<td>										';
						html += '			<div class="select_btns">				';
						html += '			<button type="button" id="select_artist"									';
						html += '			class="btn btn-info btn-fw">삭제</button>										';
						html += '			</div>									';
						html += '		</td>										';
						html += '	</tr>											';
							
					}
					console.log(html);
					$("table.artist_list tbody").append(html);				 
				}
			}
		})
	});
})
</script>
<script>
	$(".btn.update").click(function(){
		if($(this).hasClass("update")){
			frmArtist.action="<%=request.getContextPath()%>/admin/update";
		}else {
			frmArtist.action="<%=request.getContextPath()%>/admin/delete";
		}
		frmArtist.method="post";
		frmArtist.submit();
	});
	
	$(".btn.delete").click(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/delete",
			type:"post",
			data:{artist_no:"${artist.artist_no }"},
			success:function(result){
				console.log(result);
				if(result){
					alert(result);
				}
				location.href="<%=request.getContextPath() %>/admin/artist";
			},
			error:function(error){
				
			}
		});
	});
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
						<h2 class="card-title">Artist Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search-artist">
							<form name="search-form" autocomplete="off">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" aria-label="Recipient's username"
										aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button"
											id="search-artist">조회하기</button>
									</div>
								</div>
							</form>
						</div>
						
					<form name="frmArtist" id="frmArtist">
						<div class="select_btns">
							<button type="button" id="select_play"
								class="btn btn-info btn-fw"
								onclick="location.href='<%=request.getContextPath()%>/admin/artistAdd'">아티스트
								추가</button>
							<button type="button" id="select_insert"
								class="btn btn-info btn-fw">선택 삭제</button>
						</div>
						<br>
						
							<div class="table-responsive">

								<table class="table artist_list" id="artist_list">
									<thead>
										<tr>
											<td><div class="form-check form-check-muted m-0">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div></td>
											<td>No</td>
											<td></td>
											<td>아티스트명</td>
											<td>국적</td>
											<td>소속사</td>
											<td>활동유형</td>
											<td>수정</td>
											<td>삭제</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${aristList}" var="artist">

											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input sound_checkbox"
															value="${artist.artist_no }" name="artist_no">
														</label>
													</div>
												</td>
												<td>${artist.artist_no }</td>
												<td><c:choose>
														<c:when test="${artist.artist_profile ne null}">
															<img src="${artist.artist_profile}" alt="image" />
														</c:when>
														<c:when test="${artist.artist_profile eq null}">
															<img
																src="<%=request.getContextPath()%>/resources/assets/images/artist (1).png"
																alt="image" />
														</c:when>
													</c:choose></td>
												<td>${artist.artist_name}</td>
												<td>${artist.artist_nation}</td>
												<td>${artist.artist_company}</td>
												<td>${artist.artist_type}</td>
												<td>

													<div class="select_btns">
														<button type="button" id="select_artist"
															class="btn btn-info btn-fw update"
															onclick="location.href='<%=request.getContextPath() %>/admin/editArtist?artist_no=${artist.artist_no }'">
															수정</button>
													</div>
												</td>
												<td>
													<div class="select_btns">
														<button type="button" id="select_artist"
															class="btn btn-info btn-fw delete">삭제</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
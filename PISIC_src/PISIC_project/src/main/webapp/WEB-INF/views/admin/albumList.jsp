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

div.search_album {
	width: 600px;
}

.btn-search {
	background-color: #8f5fe8;
	border-color: #8f5fe8;
	width: 100px;
}

table.album_list  tr>td:nth-child(5), table.album_list  tr>td:nth-child(6),
	table.album_list  tr>td:nth-child(7), table.album_list  tr>td:nth-child(8),
	table.album_list  tr>td:nth-child(9) {
	text-align: center;
}
table.album_list  tr>td:nth-child(4){
	width:20px !important;
}
</style>
<script>
$(function(){
	// 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    
	$("#search_album").click(function(){
		$.ajax({
			type: 'GET',
			url : "<%=request.getContextPath()%>/admin/album.do",
			data : {
				keyword: $("input[name=keyword]").val()
			},
			dataType:"json",
			success : function(result){
				console.log(result);
				//테이블 초기화
				$('#album_list > tbody').empty();
				if(result.length>=1){
					
					var html = "";
					for(var i = 0; i < result.length; i++){
						var resultData = result[i];
						console.log(resultData.a_date);
						html += '	<tr>   																				';
						html += '		<td>																			';
						html += '			<div class="form-check form-check-muted m-0">								';
						html += '			<label class="form-check-label"> <input										';
						html += '							type="checkbox" class="form-check-input sound_checkbox"		';
						html += '							name="a_no">			';
						html += '			<i class="input-helper"></i>  			';
						html += '			</label>								';
						html += '			</div>									';
						html += '		</td>										';
						html += '		<td> ' + resultData.a_no + ' </td>			';
						html += '		<td>										';
						html += '					<img src=" ' + resultData.a_cover +' " alt="image" />		';
						html += '		</td>										';
						html += '		<td> '+ resultData.a_name + ' </td>			';
						html += '		<td> '+ resultData.artist_name + ' </td>	';
						html += '		<td> '+ resultData.a_publishing + ' </td>	';
						html += '		<td> '+ resultData.a_agency + ' </td>		';				
						html += '		<td> '+ resultData.a_date + ' </td>			';				
						html += '		<td>										';
						html += '		<div class="select_btns">					';
						html += '			<button type="button"					';
						html += '			class="btn btn-info btn-fw update_album">';
						html += '			수정</button>								';
						html += '		</div>										';
						html += '		</td>										';
						html += '		<td>										';
						html += '			<div class="select_btns">				';
						html += '			<button type="button"					';
						html += '			class="btn btn-info btn-fw delete_album">삭제</button>										';
						html += '			</div>									';
						html += '		</td>										';
						html += '	</tr>											';
							
					}
					$("table.album_list tbody").append(html);				 
				}
			}
		})
	});
	
	// 앨범 추가 버튼
	$("#insert_album").click(function(){
		location.href="<%=request.getContextPath()%>/admin/insertAlbum";
	});
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
	
}); // $(function(){}) 끝
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
						<h2 class="card-title">Album Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search_album">
							<form name="search-form" autocomplete="off">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="앨범명 혹은 아티스트명으로 조회하기" aria-label="Recipient's username"
										aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button"
											id="search_album">조회하기</button>
									</div>
								</div>
							</form>
						</div>
						
					<form name="frm_album" id="frm_album">
						<div class="select_btns">
							<button type="button" id="insert_album"
								class="btn btn-info btn-fw" >앨범
								추가</button>
							<button type="button" id="select_delete"
								class="btn btn-info btn-fw">선택 삭제</button>
						</div>
						<br>
						
							<div class="table-responsive">

								<table class="table album_list" id="album_list">
									<thead>
										<tr>
											<td><div class="form-check form-check-muted m-0">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div></td>
											<td>No</td>
											<td></td>
											<td>앨범명</td>
											<td>아티스트명</td>
											<td>발매사</td>
											<td>기획사</td>
											<td>발매일</td>
											<td>수정</td>
											<td>삭제</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${albumList}" var="album">

											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input sound_checkbox"
															value="${album.a_no }" name="a_no">
														</label>
													</div>
												</td>
												<td>${album.a_no }</td>
												<td>
													<img src="${album.a_cover}" alt="image" />
												</td>
												<td>${album.a_name}</td>
												<td>${album.artist_name}</td>
												<td>${album.a_publishing}</td>
												<td>${album.a_agency}</td>
												<td>${album.a_date}</td>
												<td>

													<div class="select_btns">
														<button type="button" id="update_album"
															class="btn btn-info btn-fw update">
															수정</button>
													</div>
												</td>
												<td>
													<div class="select_btns">
														<button type="button" id="delete_album"
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
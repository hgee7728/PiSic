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

table.sound_list  tr>td:nth-child(5), table.sound_list  tr>td:nth-child(6),
	table.sound_list  tr>td:nth-child(7), table.sound_list  tr>td:nth-child(8),
	table.sound_list  tr>td:nth-child(9) {
	text-align: center;
}
table.sound_list  tr>td:nth-child(4){
	width:20px !important;
}
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	
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
							 
				} else {
					html += '	<tr>   											';
					html += '		<td colspan="10" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>			';
					html += '	</tr>											';
				}
				$("table.album_list tbody").append(html);
			}
		})
	});
	
	// 앨범 추가 버튼
	$("#insert_album").click(function(){
		location.href="<%=request.getContextPath()%>/admin/insertAlbum";
	});
	
	
	
	// 한개 삭제 버튼
	$(".delete_album_btn").click(function(){
		var confm = confirm("해당 앨범을 삭제 하시겠습니까?");
    	if (confm == false) {
    		alert("취소하셨습니다.");
    	} else {
    		$.ajax({
    			url:"<%=request.getContextPath()%>/admin/deleteAlbum",
    			type:"post",
    			data:{
    				a_no: $(this).next("input[name=delete_one_a_no]").val()
    				},
    			success:function(result){
    				console.log(result);
    				if(result == "0"){
    					alert("앨범 삭제가 실패했습니다. 다시 시도해주세요");
    				} else {
    					alert("앨범이 삭제 되었습니다.");
    				}
    			},
    			error:function(error){
    				
    			}
    		}); // ajax 끝
    	}
	});
	
	// 선택 삭제
	$("#select_delete").click(function(){
		var confm = confirm("선택된 앨범을 삭제 하시겠습니까?");
    	if (confm == false) {
    		alert("취소하셨습니다.");
    	} else {
    		var a_noArray = [];
    		$('input[name=a_no]:checked').each(function(){ //체크된 리스트 저장
    			a_noArray.push($(this).val());
    	    });
    		console.log("a_noArray : " + a_noArray);
    		$.ajax({
    			url:"<%=request.getContextPath()%>/admin/deleteAlbum",
    			type:"post",
    			traditional:true,
    			data:{
    				a_no: a_noArray
    				},
    			success:function(result){
    				console.log(result);
    				if(result == "0"){
    					alert("앨범 삭제가 실패했습니다. 다시 시도해주세요");
    				} else {
    					alert("앨범이 삭제 되었습니다.");
    					location.reload();
    				}
    			},
    			error:function(error){
    				
    			}
    		}); // ajax 끝
    	}
	});
	
}); // $(function(){}) 끝

//한곡 재생 - post방식으로 a태그 이용해서 이동
function playOne(a_no,s_no){
	console.log("한곡재생");
	var frm = document.createElement('form');
    var input_s_no = document.createElement('input');
    input_s_no.setAttribute('type', 'hidden');
    input_s_no.setAttribute('name', 's_no');
    input_s_no.setAttribute('value', s_no);
	var input_a_no = document.createElement('input');
    input_a_no.setAttribute('type', 'hidden');
    input_a_no.setAttribute('name', 'a_no');
    input_a_no.setAttribute('value', a_no);
    
    frm.appendChild(input_s_no);
    frm.appendChild(input_a_no);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', root_path + '/sound/play');
    document.body.appendChild(frm);
	windowObj = window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.target="SoundPlayer";
    frm.submit();
};
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
						<h2 class="card-title">Sound Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search_sound">
							<form name="search-form" autocomplete="off">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="노래명 혹은 아티스트명으로 조회하기" aria-label="Recipient's username"
										aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button"
											id="search_sound">조회하기</button>
									</div>
								</div>
							</form>
						</div>
						
					<form name="frm_sound">
						<div class="select_btns">
							<button type="button" id="insert_sound"
								class="btn btn-info btn-fw" >곡
								추가</button>
							<button type="button" id="select_delete"
								class="btn btn-info btn-fw">선택 삭제</button>
						</div>
						<br>
						
							<div class="table-responsive">

								<table class="table sound_list" id="sound_list">
									<thead>
										<tr>
											<td><div class="form-check form-check-muted m-0">
													<label class="form-check-label"> <input
														type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div></td>
											<td>No</td>
											<td></td>
											<td>노래명</td>
											<td>가수명</td>
											<td>앨범명</td>
											<td>듣기</td>
											<td>수정</td>
											<td>삭제</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${soundList}" var="sound" varStatus="index">

											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input sound_checkbox"
															value="${sound.a_no }" name="a_no">
														</label>
													</div>
												</td>
												<td>${index.count}</td>
												<td>
													<c:choose>
														<c:when test="${sound.a_cover ne null}">
															<img src="${sound.a_cover}" alt="image" />
														</c:when>
														<c:when test="${sound.a_cover eq null}">
															<img
																src="<%=request.getContextPath()%>/resources/assets/images/favicon.png"
																alt="image" />
														</c:when>
													</c:choose>
												</td>
												<td>${sound.s_name}</td>
												<td>
													<c:forEach items="${ sounds.singers}" var="singer">
													${singer.artist_name}&nbsp;
													</c:forEach>
												</td>
												<td>${sound.a_name}</td>
												<td>
													<a href="javascript:playOne(${sound.a_no },${sound.s_no})"><i class="mdi mdi-play list_icon"></i></a>
												</td>
												<td>

													<div class="select_btns">
														<button type="button" 
															class="btn btn-info btn-fw update_sound_btn"
															onclick="location.href='<%=request.getContextPath() %>/admin/updatesound?a_no=${sound.a_no }'">
															수정</button>
													</div>
												</td>
												<td>
													<div class="select_btns">
														<button type="button"
															class="btn btn-info btn-fw delete_sound_btn">삭제</button>
														<input type="hidden" value="${sound.a_no}" name="delete_one_a_no">
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
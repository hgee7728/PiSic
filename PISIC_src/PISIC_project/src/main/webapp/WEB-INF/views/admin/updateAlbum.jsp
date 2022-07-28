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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
	
<style>
.btn-primary {
	background-color: #8f5fe8;
	border-color: #8f5fe8;
	width: 100px;
}

.btn-dark {
	width: 100px;
}

.btn-fw {
	border-color: black;
}
</style>
<style>
#ImgProfilePre {
  		margin-right: 10px;
  		width: calc(50% - 160px);
  		border-radius: 2px;
  	}
@media (max-width: 321px) {
  		#ImgProfilePre {
			max-width: 172px;
		}
  	}
.uploadcare--widget__button, .uploadcare--widget__file-name,
	.uploadcare--widget__file-size, .uploadcare--widget__text {
	display: none;
}

/* modal 아티스트 검색*/
#search_artist_modal.search_artist_modal_overlay {
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
#search_artist_modal .search_artist_modal_window {
	border-radius: 10px;
	width: 600px;
	height: 700px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow: auto;
}
.search_artist_modal_new{
	padding:30px !important;
	display: flex;
}
.search_artist_modal_content p.modal_content {
	line-height: 40px !important;
}
.search_artist_modal{
	overflow: auto !important;
}
table#search_artist_table tbody tr{
	cursor: pointer;
}
</style>
<script>
const root_path = '<%=request.getContextPath() %>';
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
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
						<h2 class="card-title">Album Add Page</h2>
					</div>
					<br>
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								
								<form id="frm_album" class="frm_album" action="<%=request.getContextPath() %>/admin/updateAlbum" 
									method="post">
								<!-- csrf 공격 방지 -->
                 				<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<h4 class="card-title">앨범 정보 입력</h4>
								<br>
								
									<div class="form-group">
										<label for="a_no">앨범 코드 : (자동 부여)</label>
										<input type="hidden" name="a_no" value="${album.a_no }">
									</div>
									<div class="form-group">
										<label for="album_name" id="label_a_name">앨범 이름*</label> 
										<input type="text" class="form-control" placeholder="Name" name="a_name" value="${album.a_name }">
									</div>
									<div class="form-group">
										<label for="artist_name" id="label_artist_name">아티스트명*</label>
										<input type="text" class="form-control" placeholder="검색하세요" name="artist_name"  value="${album.artist_name}" readonly>
										<input type="hidden" name="artist_no"  value="${album.artist_no }">
										<button type="button" class="btn btn-info btn-fw" id="search_aritst_btn">검색</button>
									</div>
									<div class="form-group">
										<label for="a_date" id="label_a_date">발매일*</label> 
										<fmt:formatDate var="format_a_date" value="${album.a_date}" pattern="yyyyMMdd"/>
										<input type="text" class="form-control" placeholder="YYYYMMDD" name="a_date" maxlength="8" value="${format_a_date}">
									</div>
									<div class="form-group">
										<label for="a_publishing" id="label_a_publishing">발매사*</label> 
										<input type="text" class="form-control" placeholder="Publishing" name="a_publishing" value="${album.a_publishing }">
									</div>
									<div class="form-group">
										<label for="a_agency" id="label_a_agency">기획사*</label> 
										<input type="text" class="form-control" placeholder="Agency" name="a_agency" value="${album.a_agency }">
									</div>
									<div class="form-group">
										<label for="a_introduce1" id="label_a_introdece1">앨범 소개 1*</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력, 추가내용은 아래 입력해주세요)" name="a_introduce1">${album.a_introduce1 }</textarea>
									</div>
									<div class="form-group">
										<label for="a_introduce2">앨범 소개 2</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력)" name="a_introduce2">${album.a_introduce2 }</textarea>
									</div>

									<div class="form-group">
										<label id="LabelProfile">앨범 Cover</label>
										<div class="input-group">
											<img id="ImgProfilePre"
												src="${album.a_cover}">
											<span class="input-group-append">
												<button id="BtnProfile"
													class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
											</span>
										</div>
										<input type="hidden" id="InputProfile" name="a_cover" value="${album.a_cover}">
										<input type="hidden" id="InputProfileUC"
											role="uploadcare-uploader"
											data-public-key="183400fad159d76bdf53"
											data-tabs="file gdrive gphotos" />
									</div>

								<div style="text-align: center;">
									<button type="button" class="btn btn-primary mr-2" id="update_btn">변경하기</button>
									<button type="button" class="btn btn-dark" id="btn_cancle" onclick="history.back(-1);">취소</button>
								</div>
								</form>
							</div>
						</div>
						</div>
				</div>
				<jsp:include page="../_footer.jsp" />
			</div>
		</div>
	</div>
	<div id="search_artist_modal" class="search_artist_modal_overlay">
		<div class="col-md-8 grid-margin stretch-card search_artist_modal_window">
			<div class="card search_artist_modal">
				<div class="card-body">
					<div class="d-flex flex-row justify-content-between">
						<h3 class="card-title mb-1">아티스트 검색</h3>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="preview-list">
								<div class="preview-item-content d-sm-flex flex-grow search_artist_modal_content">
									<div class="flex-grow search_artist_modal_new">
										<input type="text" class="form-control"
										placeholder="아티스트명으로 조회하기" name="keyword">
										<div class="input-group-append">
											<button class="btn btn-info btn-fw" type="button"
												id="search_artist_do">조회하기</button>
										</div>
									</div>
								</div>
								<div>
									<table class="table" id="search_artist_table">
										<thead>
											<tr>
												<th>No</th>
												<th></th>
												<th>아티스트명</th>
												<th>소속사</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 프로필 사진
		$("#BtnProfile").on("click",
			function() {
				$(".uploadcare--widget__button.uploadcare--widget__button_type_open").trigger("click");
		})

		/* uploadcare */
		UPLOADCARE_LOCALE = "ko"
		UPLOADCARE_LOCALE_TRANSLATIONS = {
			buttons : {
				choose : {
					files : {
						one : '사진첨부'
					}
				}
			}
		}
		
		var msg = '${msg}';
		if(msg){
			alert(msg);
		}
		
		/* uploadcare */
		var singleWidget = uploadcare
				.SingleWidget('[role=uploadcare-uploader]');
		singleWidget
				.onUploadComplete(function(info) {
					console.log(info.cdnUrl);
					var fileUrl = info.cdnUrl;
					$("#ImgProfilePre").attr("src", fileUrl);
					$("#LabelProfile")
							.html(
									'프로필사진 <span id="SpanProfile"><i class="mdi mdi-check"></i></span>');
					$("#SpanProfile").css("color", "green");
					$("input[name=a_cover]").attr("value", fileUrl);
				});
		
		
		var FlagDate = true;
		
		// 발매일 유효성
		$("input[name=a_date]").on("input", function FxBirth(){
			var regexDate = /^([12][0-9][0-9][0-9])(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])$/;
			InputDate = $("input[name=a_date]").val();		
			
			if (!regexDate.test(InputDate)) {
				$("#label_a_date").html('발매일* <span id="Span_a_date"><i class="mdi mdi-close"></i>날짜 형식이 맞지 않습니다. ex)YYYYMMDD</span>');
				FlagDate = false;
				$("#Span_a_date").css("color", "red");
			} else {
				$("#label_a_date").html('발매일* <span id="Span_a_date"><i class="mdi mdi-check"></i></span>');
				$("#Span_a_date").css("color", "green");
				FlagDate = true;
			}
		})
		
		// 필수항목 입력했는지 체크
	    	$("#update_btn").on("click", function(){
	    		$("div.form-group label span").html("");
	    		var checkFlag = false;
	    		// 앨범명
	    		if ($("input[name=a_name]").val() == '') {
					$("#label_a_name").html('앨범이름 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_name").children('span').css("color", "red");
					$("input[name=a_name]").focus();
					checkFlag = false;
					return;
    			} 
	    		// 아티스트명
	    		if ($("input[name=artist_name]").val() == '') {
					$("#label_artist_name").html('아티스트명 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_artist_name").children('span').css("color", "red");
					$("input[name=artist_name]").focus();
					checkFlag = false;
					return;
    			}
	    		// 발매일
		    	if ($("input[name=a_date]").val() == '') {
					$("#label_a_date").html('발매일 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_date").children('span').css("color", "red");
					$("input[name=a_date]").focus();
					checkFlag = false;
					return;
    			} 
    			if(!FlagDate){
    				$("input[name=a_date]").focus();
    				checkFlag = false;
					return;
    			}
		    	// 발매사
		    	if ($("input[name=a_publishing]").val() == '') {
					$("#label_a_publishing").html('발매사 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_publishing").children('span').css("color", "red");
					$("input[name=a_publishing]").focus();
					checkFlag = false;
					return;
    			} 
		    	// 기획사
		    	if ($("input[name=a_agency]").val() == '') {
					$("#label_a_agency").html('기획사 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_agency").children('span').css("color", "red");
					$("input[name=a_agency]").focus();
					checkFlag = false;
					return;
    			} 
		    	// 앨범소개1
		    	if ($("input[name=a_introdece1]").val() == '') {
					$("#label_a_introdece1").html('앨범 소개1 <span><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#label_a_introdece1").children('span').css("color", "red");
					$("input[name=a_introdece1]").focus();
					checkFlag = false;
					return;
    			} 
		    	checkFlag = true;
		    	if(checkFlag){
		    		// controller에서 date type으로 받기 위한 파싱
		    		var dateY = $("input[name=a_date]").val().substr(0,4);
		    		var dateM = $("input[name=a_date]").val().substr(4,2);
		    		var dateD = $("input[name=a_date]").val().substr(6);
		    		var a_date = dateY + '-' + dateM + '-' + dateD;
		    		$("input[name=a_date]").val(a_date);
		    		var confm = confirm("입력한 정보로 앨범을 변경 하시겠습니까?");
		        	if (confm == false) {
		        		alert("취소하셨습니다.");
		        	} else {
		        		$("#frm_album").submit();
		        	}
		    	}
	    	})
	    	
	    /* 아티스트 검색 - modal */
		$("#search_aritst_btn").click(function() {
			$("#search_artist_modal").show();
		});
	    
		
	    // 모달창 끄기 2가지
		$(".search_artist_modal_close").click(function() {
			$("#search_artist_modal").hide();
		});
		
		search_artist_modal.addEventListener("click", e => {
			const evTarget = e.target
			if (evTarget.classList.contains("search_artist_modal_overlay")) {
				$("#search_artist_modal").hide();
			}
		});
		
		// 아티스트 검색 - ajax
		$("#search_artist_do").click(function(){
			/* if($("input[name=keyword]").val() == null || $("input[name=keyword]").val() == ""){
				alert("검색어를 입력해주세요");
				return;
			} */
			$.ajax({
				url: "<%= request.getContextPath()%>/admin/artist.do",
				type: "get",
				data : {
					keyword: $("input[name=keyword]").val()
				},
				dataType:"json",
				success: function(result) {
					// 테이블 초기화
					$('#search_artist_table > tbody').empty();
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							// TODO
							html += '<tr onclick="artist_submit('+resultData.artist_no +',&#39;' + resultData.artist_name +'&#39;)">';
							html += '<td>'+resultData.artist_no+'</td>';
							html += '<td>';
							if(resultData.artist_profile != null){
								html += '<img src=" ' + resultData.artist_profile +' " alt="image" />';
							}
							else if(resultData.artist_profile==null){
								html += '<img src=" ' + "<%=request.getContextPath()%>/resources/assets/images/artist.png" +' " alt="image" />';
							}
							html += '</td>';
							html += '<td>'+resultData.artist_name+'</td>';
							if(resultData.artist_company != null){
								html += '<td>'+resultData.artist_company+'</td>';
							}
							else if(resultData.artist_company==null){
								html += '<td>(정보없음)</td>';
							}
						}
					} else {
						html += '<tr>';
						html += '<td colspan="4" style="text-align:center;"> <h4 class="card-title">검색 결과가 없습니다. </h4> </td>	';
						html += '</tr>';
					}
					
					$("#search_artist_table > tbody").append(html);
				}
			}); // ajax 끝
		});
		function artist_submit(artist_no, artist_name){
			console.log("클릭했니");
			$("#search_artist_modal").hide();
			$("input[name=artist_name]").val(artist_name);
			$("input[name=artist_no]").val(artist_no);
		}
	</script>
	

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
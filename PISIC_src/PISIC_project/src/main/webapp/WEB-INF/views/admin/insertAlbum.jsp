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
</style>
<script>
$(function(){
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}

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
						<h2 class="card-title">Album Add Page</h2>
					</div>
					<br>
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								
								<form id="frm_album" class="frm_album" action="<%=request.getContextPath() %>/admin/insertAlbum" 
									method="post">
									
								<h4 class="card-title">앨범 정보 입력</h4>
								<br>
								
									<div class="form-group">
										<label for="a_no">앨범 코드 : (자동 부여)</label> 
									</div>
									<div class="form-group">
										<label for="album_name">앨범 이름*</label> 
										<input type="text" class="form-control" placeholder="Name" name="a_name" required>
									</div>
									<div class="form-group">
										<label for="artist_name">아티스트명*</label>
										<input type="text" class="form-control" placeholder="검색하세요" name="artist_name" readonly>
										<input type="hidden" name="artist_no" value="">
										<button type="button" class="btn btn-info btn-fw">검색</button>
									</div>
									<div class="form-group">
										<label for="a_date" id="label_a_date">발매일*</label> 
										<input type="text" class="form-control" placeholder="YYYYMMDD" name="a_date" required>
									</div>
									<div class="form-group">
										<label for="a_publishing">발매사*</label> 
										<input type="text" class="form-control" placeholder="Publishing" name="a_publishing" required>
									</div>
									<div class="form-group">
										<label for="a_agency">기획사*</label> 
										<input type="text" class="form-control" placeholder="Agency" name="a_agency" required>
									</div>
									<div class="form-group">
										<label for="a_introduce1">앨범 소개 1*</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력, 추가내용은 아래 입력해주세요)" name="a_introduce1" required></textarea>
									</div>
									<div class="form-group">
										<label for="a_introduce2">앨범 소개 2</label>
										<textarea class="form-control" rows="10" placeholder="(최대 4000byte 입력)" name="a_introduce2"></textarea>
									</div>

									<div class="form-group">
										<label id="LabelProfile">앨범 Cover</label>
										<div class="input-group">
											<img id="ImgProfilePre"
												src="<%=request.getContextPath()%>/resources/assets/images/favicon.png">
											<span class="input-group-append">
												<button id="BtnProfile"
													class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
											</span>
										</div>
										<input type="hidden" id="InputProfile" name="a_cover" value="">
										<input type="hidden" id="InputProfileUC"
											role="uploadcare-uploader"
											data-public-key="183400fad159d76bdf53"
											data-tabs="file gdrive gphotos" />
									</div>


									<button type="button" class="btn btn-primary mr-2" id="submit">추가하기</button>
									<button type="button" class="btn btn-dark" id="btn_cancle" onclick="history.back(-1);">취소</button>
								</form>
							</div>
						</div>
					</div>



				</div>
				<jsp:include page="../_footer.jsp" />
			</div>
		</div>
	</div>
	<script>
	var msg = "${msg}";
	if(msg){
		alret(msg);
	}
	</script>
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
					$("#InputProfile").attr("value", fileUrl);
				});
		
		
		var FlagDate = false;
		
		// 발매일 유효성
		$("input[name=a_date]").on("input", function FxBirth(){
			var regexDate = /^[0-9]{8}$/;
			InputDate = $("input[name=a_date]").val();		
			
			if (!regexDate.test(InputDate)) {
				console.log("발매일 안맞아");
				$("#label_a_date").html('발매일* <span id="Span_a_date"><i class="mdi mdi-close"></i> 형식이 맞지 않습니다. ex)YYYYMMDD</span>');
				FlagDate = false;
				$("#Span_a_date").css("color", "red");
			} else {
				console.log("발매일 맞아");
				$("#label_a_date").html('발매일* <span id="Span_a_date"><i class="mdi mdi-check"></i></span>');
				$("#Span_a_date").css("color", "green");
				FlagDate = true;
			}
		})
		
		// Submit 유효성 검사
	    	$("#submit").on("click", function(){
		    	if (FlagDate == false) {
		    		$("input[name=a_date]").focus();
		    	} else {
		    		$("#frm_album").submit();
		    	}
	    	})
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
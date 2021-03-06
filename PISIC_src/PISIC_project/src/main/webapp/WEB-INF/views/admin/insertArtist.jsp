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
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../_sidebar_admin.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="../_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">Artist Add Page</h2>
					</div>
					<br>
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								
								<form id="addArtistForm" class="addArtistForm" action="<%=request.getContextPath() %>/admin/insertArtist" 
									method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
								<h4 class="card-title">???????????? ?????? ??????</h4>
								<br>
								
									<div class="form-group">
										<label for="artistNo">???????????? ?????? : (?????? ?????? ??????)</label> 
										<input type="hidden" value="${artist_no }" class="form-control" id="artistNo" name="artist_no" readonly>

									</div>
									<div class="form-group">
										<label for="artistName">???????????? ??????</label> 
										<input type="text" class="form-control" id="artistName" placeholder="Name" name="artist_name" required>
									</div>
									<div class="form-group">
										<label for="artistNation">??????</label> 
										<input type="text" class="form-control" id="artistNation" placeholder="Nation" name="artist_nation">
									</div>
									<div class="form-group">
										<label for="artistCompany">?????????</label> 
										<input type="text" class="form-control" id="artistCompany" placeholder="Company" name="artist_company">
									</div>
									<div class="form-group">
										<label for="artistTypeSelect">?????? ??????</label> 
										<select class="form-control" id="artistTypeSelect" name="artist_type">
											<option value="??????">??????</option>
											<option value="??????">??????</option>
										</select>
									</div>
									<div class="form-group">
										<label for="artistGroup">?????????</label> 
										<input type="text" class="form-control" id="artistGroup" placeholder="Group" name="artist_group"> 
									</div>
									<div class="form-group">
										<label for="artistMember">?????? ??????</label> 
										<input type="text" class="form-control" id="artistMember" placeholder="Member" name="artist_member">
									</div>
									<div class="form-group">
										<label for="artistInfo1">???????????? ?????? 1</label>
										<textarea class="form-control" id="artistInfo1" rows="10" placeholder="(?????? 4000byte ??????, ??????????????? ?????? ??????????????????)" name="artist_info1" maxlength="1200"></textarea>
									</div>
									<div class="form-group">
										<label for="artistInfo2">???????????? ?????? 2</label>
										<textarea class="form-control" id="artistInfo2" rows="10" placeholder="(?????? 4000byte ??????)" name="artist_info2" maxlength="1200"></textarea>
									</div>

									<div class="form-group">
										<label id="LabelProfile">???????????????</label>
										<div class="input-group">
											<img id="ImgProfilePre"
												src="<%=request.getContextPath()%>/resources/assets/images/favicon.png">
											<span class="input-group-append">
												<button id="BtnProfile"
													class="btn btn-inverse-secondary btn-fw" type="button">????????????</button>
											</span>
										</div>
										<input type="hidden" id="InputProfile" name="artist_profile" value="">
										<input type="hidden" id="InputProfileUC"
											role="uploadcare-uploader"
											data-public-key="183400fad159d76bdf53"
											data-tabs="file gdrive gphotos" />
									</div>


									<button type="submit" class="btn btn-primary mr-2">????????????</button>
									<button type="button" class="btn btn-dark" id="btn_cancle" onclick="history.back(-1);">??????</button>
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
		// ????????? ??????
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
						one : '????????????'
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
									'??????????????? <span id="SpanProfile"><i class="mdi mdi-check"></i></span>');
					$("#SpanProfile").css("color", "green");
					$("#InputProfile").attr("value", fileUrl);
				});
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
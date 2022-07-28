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

@media ( max-width : 321px) {
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
	$(function() {
		var msg = '${msg}';
		if (msg) {
			alert(msg);
		}

	});
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
						<h2 class="card-title">Artist Edit Page</h2>
					</div>
					<br>
					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">

								<form id="editArtistForm" class="editArtistForm"
									action="<%=request.getContextPath()%>/admin/updateArtist"
									method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<h4 class="card-title">아티스트 정보 입력</h4>
									<br>
									<div class="form-group">
										<label for="artistNo">아티스트 코드 : ${artist_no }</label> <input
											type="hidden" value="${artist_no }" class="form-control"
											id="artistNo" name="artist_no" readonly>

									</div>
									<div class="form-group">
										<label for="artistName">아티스트 이름</label> <input type="text"
											class="form-control" value="${artistInfo.artist_name }"
											placeholder="Name" name="artist_name" required>
									</div>
									<div class="form-group">
										<label for="artistNation">국적</label> <input type="text"
											class="form-control" value="${artistInfo.artist_nation }"
											placeholder="Nation" name="artist_nation">
									</div>
									<div class="form-group">
										<label for="artistCompany">소속사</label> <input type="text"
											class="form-control" value="${artistInfo.artist_company }"
											placeholder="Company" name="artist_company">
									</div>
									<div class="form-group">
										<label for="artistTypeSelect">왈동 유형</label> <select
											class="form-control" id="artistTypeSelect" name="artist_type">

											<c:choose>
												<c:when test="${artistInfo.artist_type eq 그룹'}">
													<option value="그룹" selected>그룹</option>
													<option value="솔로">솔로</option>
												</c:when>
												<c:otherwise>
													<option value="그룹">그룹</option>
													<option value="솔로" selected>솔로</option>
												</c:otherwise>
											</c:choose>
										</select>
									</div>
									<div class="form-group">
										<label for="artistGroup">그룹명</label> <input type="text"
											class="form-control" value="${artistInfo.artist_group }"
											placeholder="Group" name="artist_group">
									</div>
									<div class="form-group">
										<label for="artistMember">그룹 멤버</label> <input type="text"
											class="form-control" value="${artistInfo.artist_member }"
											placeholder="Member" name="artist_member">
									</div>
									<div class="form-group">
										<label for="artistInfo1">아티스트 소개 1</label>
										<textarea class="form-control" id="artistInfo1" rows="10"
											placeholder="(최대 4000byte 입력, 추가내용은 아래 입력해주세요)"
											name="artist_info1">${artistInfo.artist_info1 }</textarea>
									</div>
									<div class="form-group">
										<label for="artistInfo2">아티스트 소개 2</label>
										<textarea class="form-control" id="artistInfo2" rows="10"
											placeholder="(최대 4000byte 입력)" name="artist_info2">${artistInfo.artist_info2 }</textarea>
									</div>

									<div class="form-group">
										<label id="LabelProfile">프로필사진</label>
										<div class="input-group">
											<img id="ImgProfilePre" src="${artistInfo.artist_profile }">
											<span class="input-group-append">
												<button id="BtnProfile"
													class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
											</span>
										</div>
										<input type="hidden" id="InputProfile" name="artist_profile"
											value=""> <input type="hidden" id="InputProfileUC"
											role="uploadcare-uploader"
											data-public-key="183400fad159d76bdf53"
											data-tabs="file gdrive gphotos" />
									</div>


									<button type="submit" class="btn btn-primary mr-2">수정하기</button>
									<button type="button" class="btn btn-dark" id="btn_cancle"
										onclick="history.back(-1);">취소</button>
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
		// 프로필 사진
		$("#BtnProfile")
				.on(
						"click",
						function() {
							$(
									".uploadcare--widget__button.uploadcare--widget__button_type_open")
									.trigger("click");
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
					/* $("#ImgProfilePre").attr("src", fileUrl);
					   $("#LabelProfile").html('프로필사진 <span id="SpanProfile"><i class="mdi mdi-close"></i> 다시 시도해 주세요.</span>');
					   $("#SpanProfile").css("color", "red");
					   $("#InputProfile").attr("value", fileUrl); */
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
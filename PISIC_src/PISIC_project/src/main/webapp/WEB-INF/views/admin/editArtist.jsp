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
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="../_sidebar.jsp" />
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
								<h4 class="card-title">아티스트 정보 입력</h4>
								<br>
								<form class="forms-sample">
									<div class="form-group">
										<label for="exampleInputName1">아티스트 코드 : ${artistInfo.artist_no }</label> 
										<input
											type="hidden" class="form-control" id="exampleInputNo1"
											value="${artistInfo.artist_no }">
											
									</div>
									<div class="form-group">
										<label for="exampleInputName1">아티스트 이름</label> <input
											type="text" class="form-control" id="inputName"
											placeholder="Name" value="${artistInfo.artist_name }" required>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">국적</label> <input type="text"
											class="form-control" id="exampleInputEmail3"
											placeholder="Nation" value="${artistInfo.artist_nation }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword4">소속사</label> <input
											type="text" class="form-control" id="exampleInputPassword4"
											placeholder="Company" value="${artistInfo.artist_company }">
									</div>
									<div class="form-group">
										<label for="exampleSelectGender">왈동 유형</label> <select
											class="form-control" id="exampleSelectGender">
											<option>그룹</option>
											<option>솔로</option>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleInputCity1">그룹명</label> <input type="text"
											class="form-control" id="exampleInputCity1"
											placeholder="Group" value="${artistInfo.artist_group }">
									</div>
									<div class="form-group">
										<label for="exampleInputCity1">그룹 멤버</label> <input
											type="text" class="form-control" id="exampleInputCity1"
											placeholder="Member" value="${artistInfo.artist_member }">
									</div>
									<div class="form-group">
										<label for="exampleTextarea1">아티스트 소개 1</label>
										<textarea class="form-control" id="exampleTextarea1" rows="4"
											placeholder="(최대 4000byte 입력, 추가내용은 아래 입력해주세요)" >${artistInfo.artist_info1 }</textarea>
									</div>
									<div class="form-group">
										<label for="exampleTextarea1">아티스트 소개 2</label>
										<textarea class="form-control" id="exampleTextarea2" rows="4"
											placeholder="(최대 4000byte 입력)">${artistInfo.artist_info2 }</textarea>
									</div>
									<div class="form-group">
										<label id="LabelProfile">프로필사진</label>
										<div class="input-group">
											<img id="ImgProfilePre"
												src="${artistInfo.artist_profile }">
											<span class="input-group-append">
												<button id="BtnProfile"
													class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
											</span>
										</div>
										<input type="hidden" id="InputProfile" name="artist_profile">
										<input type="hidden" id="InputProfileUC"
											role="uploadcare-uploader"
											data-public-key="183400fad159d76bdf53"
											data-tabs="file gdrive gphotos" />
									</div>
									<button type="submit" class="btn btn-primary mr-2">수정하기</button>
									<button class="btn btn-dark">취소</button>
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
	$(document).ready()
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
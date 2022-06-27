<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
  <style>
  	.content-wrapper {
  		max-width: 900px;
  	}
  </style>
  </head>
  <body>
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
          	<div class="page-header">
              <h3 class="page-title">회원가입</h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">회원가입</li>
                </ol>
              </nav>
            </div>
          	<div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">회원가입</h4>
                    <form class="forms-sample" action="<%=request.getContextPath() %>/member/insert" method="post">
                      <div class="form-group">
                      	<label for="InputId">아이디</label>
                      	<div class="input-group">
	                        <input type="text" class="form-control" id="InputId" placeholder="ID" name="m_id" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label for="InputPassword1">비밀번호</label>
                        <input type="password" class="form-control" id="InputPassword1" placeholder="Password" name="m_password" required>
                      </div>
                      <div class="form-group">
                        <label for="InputPassword2">비밀번호 확인</label>
                        <input type="password" class="form-control" id="InputPassword2" placeholder="Re Password" required>
                      </div>
                      <div class="form-group">
                        <label for="InputName">이름</label>
                        <input type="text" class="form-control" id="InputName" placeholder="Name" name="m_name" required>
                      </div>
                      <div class="form-group">
                        <label for="InputNickname">닉네임</label>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputNickname" placeholder="Nickname" name="m_nickname" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label for="InputEmail">이메일</label>
                        <div class="input-group">
	                        <input type="email" class="form-control" id="InputEmail" placeholder="Email" name="m_email" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label for="InputPhone">휴대전화</label>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputPhone" placeholder="Phone" name="m_phone" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>                  
                      </div>
                      <div class="form-group">
                        <label for="InputBirth">생년월일</label>
                        <input type="password" class="form-control" id="InputBirth" placeholder="Date of Birth" name="m_birth" required>
                      </div>
                      <div class="form-group">
                        <label for="SelectGender">성별</label>
                        <select class="form-control" id="SelectGender">
                          <option value="M">남성</option>
                          <option value="F">여성</option>
                        </select>
                      </div>
                      <p class="card-description">주소</p>
                      <div class="form-group">
                        <label for="InputAddress">주소</label>
	                    <input type="text" class="form-control" id="InputAddress" placeholder="Address" name="m_address" required>               
                      </div>
                      <div class="form-group">
                        <label for="InputAddressDetail">상세주소</label>
	                    <input type="text" class="form-control" id="InputAddressDetail" placeholder="AddressDetail" name="m_address_detail" required>
                      </div>
                      <div class="form-group">
                        <label>프로필사진</label>
                        <input type="file" name="img[]" class="file-upload-default">
                        <div class="input-group col-xs-12">
                          <input type="text" class="form-control file-upload-info" disabled placeholder="Profile">
                          <span class="input-group-append">
                            <button class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
                          </span>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-info btn-fw" id="btn_submit">회원가입</button>
                    </form>
                  </div>
                </div>
              </div>
            <form action="<%=request.getContextPath() %>/member/insert" method="post">
				아이디 :<input type="text" name="m_id" required><br>
				비밀번호 :<input type="password" name="m_password" required><br>
				이름 :<input type="text" name="m_name" required><br>
				<button type="submit">회원가입</button>
			</form>
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
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>

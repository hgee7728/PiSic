<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <style>
  	.col-md-6.grid-margin.stretch-card {
  		max-width: 600px;
  	}
  	.stretch-card {
  		margin: 0 auto;
  	}
  	.btn.btn-info.btn-fw {
  		margin: 0 auto;
    	display: block;
  	}
  	.btn.btn-inverse-secondary.btn-fw {
  		flex: 0 0 33.33333%;
  		min-width: 120px !important;
  		max-width: 120px !important;
  		margin: 0 auto;
  	}
  	.row {
  		margin-top: 0.75rem;
  	}
  	.preview-item {
  		margin-top: 0.75rem;
  		margin-bottom: 0.75rem;
  	}
  	@media (min-width: 768px) {
  		.col-md-6 {
			max-width: 70%;
		}
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
              <h2 class="card-title">LOGIN</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">로그인</li>
                </ol>
              </nav>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">로그인</h4>
                    <p class="card-description">로그인</p>
                    <div class="preview-item border-bottom">
                    	<!-- 
                    	<ul>
					      <li onclick="kakaoLogin();">
					        <a href="javascript:void(0)">
					            <span>카카오 로그인</span>
					        </a>
					      </li>
					    </ul>
					    -->
                    </div>
                    <script>
                    function kakaoLogin() {
                      $.ajax({
                          url: "<%=request.getContextPath()%>/member/login/getKakaoAuthUrl",
                          type: "get",
                          async: false,
                          dataType: "text",
                          success: function (res) {
                              location.href = res;
                          }
                      });
                    }

                    $(document).ready(function() {
                        var kakaoInfo = '${kakaoInfo}';
                        if(kakaoInfo != ""){
                            var data = JSON.parse(kakaoInfo);
                            "user : \n" + "email : "
                            + data['email']  
                            + "\n nickname : " 
                            + data['nickname']);
                        }
                    });                     	
                    </script>
                    <form class="forms-sample" action="<%=request.getContextPath() %>/member/login" method="post">
                      <div class="form-group">
                        <label for="InputId">아이디</label>
                        <input type="text" class="form-control" id="InputId" placeholder="ID" name="m_id" required>
                      </div>
                      <div class="form-group">
                        <label for="InputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="m_password" required>
                      </div>
                      <button type="submit" class="btn btn-info btn-fw">로그인</button>
                    </form>
                    <div class="row">
	                    <button type="button" class="btn btn-inverse-secondary btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/findId'">아이디 찾기</button>
	                    <button type="button" class="btn btn-inverse-secondary btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/findPw'">비밀번호 찾기</button>
	                    <button type="button" class="btn btn-inverse-secondary btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/join'">회원가입</button>
                    </div>
                  </div>
                </div>
              </div>
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
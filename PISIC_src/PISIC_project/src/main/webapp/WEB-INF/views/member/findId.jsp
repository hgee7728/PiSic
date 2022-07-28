<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>아이디찾기</title>
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
  	.row {
  		margin-top: 0.75rem;
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
              <h2 class="card-title">FIND ID</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">아이디 찾기</li>
                </ol>
              </nav>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">아이디 찾기</h4>
                    <p class="card-description">아이디 찾기</p>
                    <form class="forms-sample" action="<%=request.getContextPath() %>/member/findId" method="post">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                      <div class="form-group">
                        <label id="LabelName" for="InputName">이름 *</label>
                        <input type="text" class="form-control" id="InputName" placeholder="Name" name="m_name" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelEmail" for="InputEmail">이메일 *</label>
                        <input type="email" class="form-control" id="InputEmail" placeholder="Email" name="m_email" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelPhone" for="InputPhone">휴대전화 *</label>
                        <input type="text" class="form-control" id="InputPhone" placeholder="Phone" name="m_phone" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelBirth" for="InputBirth">생년월일 *</label>
                        <input type="text" class="form-control" id="InputBirth" placeholder="Date of Birth" name="m_birth" required>
                      </div>
                      <button type="submit" class="btn btn-info btn-fw" id="BtnSubmit">아이디 찾기</button>
                    </form>
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
    <script>
    	var InputName = null;	
    	var InputEmail = null;
		var InputPhone = null;
		var InputBirth = null;
		
		var FlagName = false;
		var FlagEmail = false;
		var FlagPhone = false;
		var FlagBirth = false;
		
    	$(document).ready(function(){
    		// 이름
    		$("#InputName").on("keyup", function(){
    			var regexName = /(^[가-힣]{2,5}$)|(^[a-zA-Z]{2,20}(\s[a-zA-Z]{2,20})?$)/;
    			InputName = $("#InputName").val();		
    			
    			if (!regexName.test(InputName)) {
    				if (InputName == '') {
    					$("#LabelName").html('이름 <span id="SpanName"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelName").html('이름 <span id="SpanName"><i class="mdi mdi-close"></i> 한글과 영문 대 소문자를 사용하세요. 한글 : 2~5자, 영문 : 2~20자</span>');
    				}
    				FlagName = false;
    				$("#SpanName").css("color", "red");
    			} else {
    				$("#LabelName").html('이름 <span id="SpanName"><i class="mdi mdi-check"></i></span>');
    				$("#SpanName").css("color", "green");
    				FlagName = true;
    			}
    		})
    		
    		// 이메일
    		$("#InputEmail").on("keyup", function(){
    			var regexEmail = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    			InputEmail = $("#InputEmail").val();		
    			
    			if (!regexEmail.test(InputEmail)) {
    				if (InputEmail == '') {
    					$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-close"></i> 이메일 형식이 맞지 않습니다. ex)pisic1234@pisic.com</span>');
    				}
    				FlagEmail = false;
    				$("#SpanEmail").css("color", "red");
    			} else {
    			    $("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-check"></i></span>');
    		    	$("#SpanEmail").css("color", "green");
    		    	FlagEmail = true;
    			}
    		})
    		
    		// 휴대전화
    		$("#InputPhone").on("keyup", function(){
    			var regexPhone = /^01([0|1|6|7|8|9]{2})+([0-9]{6,7})$/;
    			InputPhone = $("#InputPhone").val();
    			
    			if (!regexPhone.test(InputPhone)) {
    				if (InputPhone == '') {
    					$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-close"></i> 휴대전화 형식이 맞지 않습니다. ex)01012345678</span>');
    				}
    				FlagPhone = false;
    				$("#SpanPhone").css("color", "red");
    			} else {
    			    $("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-check"></i></span>');
    		    	$("#SpanPhone").css("color", "green");
    		    	FlagPhone = true;
    			}
    		})
    		
    		// 생년월일
    		$("#InputBirth").on("keyup", function(){
    			var regexBirth = /^[0-9]{8}$/;
    			InputBirth = $("#InputBirth").val();		
    			
    			if (!regexBirth.test(InputBirth)) {
    				if (InputBirth == '') {
    					$("#LabelBirth").html('생년월일 <span id="SpanBirth"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelBirth").html('생년월일 <span id="SpanBirth"><i class="mdi mdi-close"></i> 생년월일 형식이 맞지 않습니다. ex)YYYYMMDD</span>');
    				}
    				FlagBirth = false;
    				$("#SpanBirth").css("color", "red");
    			} else {
    				$("#LabelBirth").html('생년월일 <span id="SpanBirth"><i class="mdi mdi-check"></i></span>');
    				$("#SpanBirth").css("color", "green");
    				FlagBirth = true;
    			}
    		})
    	});
    </script>
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
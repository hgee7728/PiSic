<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
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
              <h2 class="card-title">FIND PW</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">비밀번호 변경</li>
                </ol>
              </nav>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">비밀번호 변경</h4>
                    <p class="card-description">비밀번호 변경</p>
                    <form id="updatePwForm" class="forms-sample" action="<%=request.getContextPath() %>/findPwA" method="post">
                      <!-- csrf 공격 방지 -->
                      <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                      <input type="hidden" value="${member.m_id}" name="m_id">
                      <div class="form-group row">
                        <label id="LabelPassword1" for="InputPassword1" class="col-sm-3 col-form-label">변경할 비밀번호</label>
                        <div class="col-sm-9">
                         <div class="input-group">
                          <input type="password" class="form-control" id="InputPassword1" placeholder="Password" name="m_password" required>
                          <div class="input-group-append">
		                  	<button id="BtnPassword1" class="btn btn-inverse-secondary btn-fw" type="button"><i class="mdi mdi-eye-off"></i></button>
		                  </div>
		                 </div>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label id="LabelPassword2" for="InputPassword2" class="col-sm-3 col-form-label">변경할 비밀번호 확인</label>
                        <div class="col-sm-9">
                         <div class="input-group">
                          <input type="password" class="form-control" id="InputPassword2" placeholder="Re Password" required>
                          <div class="input-group-append">
		                  	<button id="BtnPassword2" class="btn btn-inverse-secondary btn-fw" type="button"><i class="mdi mdi-eye-off"></i></button>
		                  </div>
		                 </div>
                        </div>
                      </div>
                      <script>
                      	$(document).ready(function(){
                      		$("#BtnPassword1").on("click", function(){
                      			$("#InputPassword1").toggleClass("active");
                      			if ($("#InputPassword1").hasClass("active")) {
                      				$(this).find("i").attr("class", "mdi mdi-eye");
                      				$("#InputPassword1").attr("type", "text");
                      			} else {
                      				$(this).find("i").attr("class", "mdi mdi-eye-off");
                      				$("#InputPassword1").attr("type", "password");
                      			}
                      		})
                      		$("#BtnPassword2").on("click", function(){
                      			$("#InputPassword2").toggleClass("active");
                      			if ($("#InputPassword2").hasClass("active")) {
                      				$(this).find("i").attr("class", "mdi mdi-eye");
                      				$("#InputPassword2").attr("type", "text");
                      			} else {
                      				$(this).find("i").attr("class", "mdi mdi-eye-off");
                      				$("#InputPassword2").attr("type", "password");
                      			}
                      		})
                      	});
                      </script>
                      <input id="InputSubmit" type="button" class="btn btn-info btn-fw" value="비밀번호 변경"/>
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
    var InputPw1 = null;
	var InputPw2 = null;
	
	var FlagPw1 = false;
	var FlagPw2 = false;
	
	    $(document).ready(function(){
	    	// 비밀번호
    		$("#InputPassword1").on("keyup", function(){
    			var regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    			InputPw1 = $("#InputPassword1").val();
    			InputPw2 = $("#InputPassword2").val();
    			
    			if (!regexPw.test(InputPw1)) {
    				if (InputPw1 == '') {
    					$("#LabelPassword1").html('비밀번호 <label id="cLabelPassword1"><i class="mdi mdi-close"></i> 필수 정보입니다.</label>');
    				} else {
    					$("#LabelPassword1").html('비밀번호 <label id="cLabelPassword1"><i class="mdi mdi-close"></i> 8 ~ 20자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.</label>');
    				}
    				FlagPw1 = false;
    				$("#cLabelPassword1").css("color", "red");
    			} else {
    				$("#LabelPassword1").html('비밀번호 <label id="cLabelPassword1"><i class="mdi mdi-check"></i></label>');
    				$("#cLabelPassword1").css("color", "green");
    				FlagPw1 = true;
    			}
    			
    			if (InputPw1 != InputPw2) {
    				$("#LabelPassword2").html('비밀번호 확인 <label id="cLabelPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</label>');
    				$("#cLabelPassword2").css("color", "red");
    				FlagPw2 = false;
    			} else {
    				$("#LabelPassword2").html('비밀번호 확인 <label id="cLabelPassword2"><i class="mdi mdi-check"></i></label>');
    				$("#cLabelPassword2").css("color", "green");
    				FlagPw2 = true;
    			}
    		})
    		
    		// 비밀번호 확인
    		$("#InputPassword2").on("keyup", function(){
    			InputPw1 = $("#InputPassword1").val();
    			InputPw2 = $("#InputPassword2").val();
    			
    			if (InputPw1 != InputPw2) {
    				$("#LabelPassword2").html('비밀번호 확인 <label id="cLabelPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</label>');
    				$("#cLabelPassword2").css("color", "red");
    				FlagPw2 = false;
    			} else {
    				$("#LabelPassword2").html('비밀번호 확인 <label id="cLabelPassword2"><i class="mdi mdi-check"></i></label>');
    				$("#cLabelPassword2").css("color", "green");
    				FlagPw2 = true;
    			}
    		})
    		
	    	// Submit 유효성 검사
		    $("#InputSubmit").on("click", function(){
		    	InputPw1 = $("#InputPassword1").val();
				InputPw2 = $("#InputPassword2").val();
		    		
		    	if (FlagPw1 == false) {
		    		if (InputPw1 == '') {
		    			$("#LabelPassword1").html('비밀번호 <label id="cLabelPassword1"><i class="mdi mdi-close"></i> 필수 정보입니다.</label>');
		    			$("#cLabelPassword1").css("color", "red");
		    		}
		    		$("#InputPassword1").focus();
		    	} else if (FlagPw2 == false) {
			    	$("#LabelPassword2").html('비밀번호 확인 <label id="cLabelPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</label>');
	    			$("#cLabelPassword2").css("color", "red");
			    	$("#InputPassword2").focus();
			    } else {
			    	$("#updatePwForm").submit();
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  	#InputButtons {
  		text-align: center;
  	}
  	#InputCancel, #InputSubmit {
  		margin: 0 auto;
  	}
  	.row {
  		margin-top: 0.75rem;
  	}
  	#SpanErrormsg {
  		color: red;
  	}
  	@media (min-width: 768px) {
  		.col-md-6 {
			max-width: 70%;
		}
  	}
  </style>
  <script>
	  var msg = '${msg}';
	  if(msg){
		  alert(msg);
	  }
  </script>
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
                  <li class="breadcrumb-item"><a href="#">??????</a></li>
                  <li class="breadcrumb-item active" aria-current="page">???????????? ??????</li>
                </ol>
              </nav>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">???????????? ??????</h4>
                    <label class="card-description">???????????? ??????</label>
                    <c:if test="${not empty msg}">
                    	<span id="SpanErrormsg"><i class="mdi mdi-close"></i>${msg}</span>
                    </c:if>
                    <form id="findPwForm" class="forms-sample" action="<%=request.getContextPath() %>/findPw" method="post">
                      <!-- csrf ?????? ?????? -->
                      <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                      <div class="form-group">
                        <label id="LabelId" for="InputId">????????? *</label>
                        <input type="text" class="form-control" id="InputId" placeholder="Id" name="m_id" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelName" for="InputName">?????? *</label>
                        <input type="text" class="form-control" id="InputName" placeholder="Name" name="m_name" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelEmail" for="InputEmail">????????? *</label>
                        <input type="email" class="form-control" id="InputEmail" placeholder="Email" name="m_email" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelPhone" for="InputPhone">???????????? *</label>
                        <input type="text" class="form-control" id="InputPhone" placeholder="Phone" name="m_phone" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelBirth" for="InputBirth">???????????? *</label>
                        <input type="text" class="form-control" id="InputBirth" placeholder="Date of Birth" name="m_birth" required>
                      </div>
                      <div id="InputButtons">
                      	<input id="InputSubmit" type="button" class="btn btn-info btn-fw" value="???????????? ??????"/>
                      	<input id="InputCancel" type="button" class="btn btn-inverse-secondary btn-fw" value="??????">
                      </div>
                      <script>
                      	$("#InputCancel").on("click", function(){
                      		var cancel = confirm("???????????? ????????? ?????????????????????????");
                      		if (cancel) {
                      			location.href = '<%=request.getContextPath()%>/login';                   			
                      		}
                      	})
                      </script>
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
    var InputId = null;
	var InputName = null;	
	var InputEmail = null;
	var InputPhone = null;
	var InputBirth = null;
	
	var FlagId = false;
	var FlagName = false;
	var FlagEmail = false;
	var FlagPhone = false;
	var FlagBirth = false;
	
	$(document).ready(function(){
		// ?????????
		$("#InputId").on("keyup", function(){
			var regexId = /^[0-9a-zA-Z]{7,15}$/;
			InputId = $("#InputId").val();
			
			if (!regexId.test(InputId)) {
				if (InputId == '') {
					$("#LabelId").html('????????? <span id="SpanId"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				} else {
					$("#LabelId").html('????????? <span id="SpanId"><i class="mdi mdi-close"></i> 7 ~ 15?????? ??????, ????????? ?????? ???????????????.</span>');
				}
				$("#SpanId").css("color", "red");
				FlagId = false;
			} else {
			    $("#LabelId").html('????????? <span id="SpanId"><i class="mdi mdi-check"></i></span>');
			    $("#SpanId").css("color", "green");
			    FlagId = true;
			}
		})
		
		// ??????
		$("#InputName").on("keyup", function(){
			var regexName = /(^[???-???]{2,5}$)|(^[a-zA-Z]{2,20}(\s[a-zA-Z]{2,20})?$)/;
			InputName = $("#InputName").val();		
			
			if (!regexName.test(InputName)) {
				if (InputName == '') {
					$("#LabelName").html('?????? <span id="SpanName"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				} else {
					$("#LabelName").html('?????? <span id="SpanName"><i class="mdi mdi-close"></i> ????????? ?????? ??? ???????????? ???????????????. ?????? : 2~5???, ?????? : 2~20???</span>');
				}
				FlagName = false;
				$("#SpanName").css("color", "red");
			} else {
				$("#LabelName").html('?????? <span id="SpanName"><i class="mdi mdi-check"></i></span>');
				$("#SpanName").css("color", "green");
				FlagName = true;
			}
		})
		
		// ?????????
		$("#InputEmail").on("keyup", function(){
			var regexEmail = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
			InputEmail = $("#InputEmail").val();		
			
			if (!regexEmail.test(InputEmail)) {
				if (InputEmail == '') {
					$("#LabelEmail").html('????????? <span id="SpanEmail"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				} else {
					$("#LabelEmail").html('????????? <span id="SpanEmail"><i class="mdi mdi-close"></i> ????????? ????????? ?????? ????????????. ex)pisic1234@pisic.com</span>');
				}
				FlagEmail = false;
				$("#SpanEmail").css("color", "red");
			} else {
			    $("#LabelEmail").html('????????? <span id="SpanEmail"><i class="mdi mdi-check"></i></span>');
		    	$("#SpanEmail").css("color", "green");
		    	FlagEmail = true;
			}
		})
		
		// ????????????
		$("#InputPhone").on("keyup", function(){
			var regexPhone = /^01([0|1|6|7|8|9])+[0-9]{7,8}$/;
			InputPhone = $("#InputPhone").val();
			
			if (!regexPhone.test(InputPhone)) {
				if (InputPhone == '') {
					$("#LabelPhone").html('???????????? <span id="SpanPhone"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				} else {
					$("#LabelPhone").html('???????????? <span id="SpanPhone"><i class="mdi mdi-close"></i> ???????????? ????????? ?????? ????????????. ex)01012345678</span>');
				}
				FlagPhone = false;
				$("#SpanPhone").css("color", "red");
			} else {
			    $("#LabelPhone").html('???????????? <span id="SpanPhone"><i class="mdi mdi-check"></i></span>');
		    	$("#SpanPhone").css("color", "green");
		    	FlagPhone = true;
			}
		})
		
		// ????????????
		$("#InputBirth").on("keyup", function(){
			var regexBirth = /^[0-9]{8}$/;
			InputBirth = $("#InputBirth").val();		
			
			if (!regexBirth.test(InputBirth)) {
				if (InputBirth == '') {
					$("#LabelBirth").html('???????????? <span id="SpanBirth"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
				} else {
					$("#LabelBirth").html('???????????? <span id="SpanBirth"><i class="mdi mdi-close"></i> ???????????? ????????? ?????? ????????????. ex)YYYYMMDD</span>');
				}
				FlagBirth = false;
				$("#SpanBirth").css("color", "red");
			} else {
				$("#LabelBirth").html('???????????? <span id="SpanBirth"><i class="mdi mdi-check"></i></span>');
				$("#SpanBirth").css("color", "green");
				FlagBirth = true;
			}
		})
		
		// Submit ????????? ??????
	    $("#InputSubmit").on("click", function(){
	    	InputId = $("#InputId").val();
	    	InputName = $("#InputName").val();
	    	InputEmail = $("#InputEmail").val();
	    	InputPhone = $("#InputPhone").val();
	    	InputBirth = $("#InputBirth").val();
	    		
	    	if (FlagId == false) {
	    		if (InputId == '') {
					$("#LabelId").html('????????? <span id="SpanId"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
					$("#SpanId").css("color", "red");
	    		}
	    		$("#InputId").focus();
	    	} else if (FlagName == false) {
		    	if (InputName == '') {
		    		$("#LabelName").html('?????? <span id="SpanName"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
		    		$("#SpanName").css("color", "red");
		    	}
		    	$("#InputName").focus();
		    } else if (FlagEmail == false) {
		    	if (InputEmail == '') {
    				$("#LabelEmail").html('????????? <span id="SpanEmail"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
    				$("#SpanEmail").css("color", "red");
		    	}
		    	$("#InputEmail").focus();
		    } else if (FlagPhone == false) {
		    	if (InputPhone == '') {
    				$("#LabelPhone").html('???????????? <span id="SpanPhone"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
    				$("#SpanPhone").css("color", "red");
		    	}
		    	$("#InputPhone").focus();
		    } else if (FlagBirth == false) {
		    	if (InputBirth == '') {
    				$("#LabelBirth").html('???????????? <span id="SpanBirth"><i class="mdi mdi-close"></i> ?????? ???????????????.</span>');
    				$("#SpanBirth").css("color", "red");
		    	}
		    	$("#InputBirth").focus();
		    } else {
		    	$("#findPwForm").submit();
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf_header" th:content="${_csrf.headerName}">
	<meta name="_csrf" th:content="${_csrf.token}">
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
  	#Str {
  		color: red;
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
              <h2 class="card-title">QUIT</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">회원 탈퇴</li>
                </ol>
              </nav>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">회원 탈퇴</h4>
                    <label class="card-description">회원 탈퇴</label>
                    <form id="deleteForm" class="forms-sample" action="<%=request.getContextPath() %>/member/deleteMember" method="post">
                      <!-- csrf 공격 방지 -->
                      <input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                      <sec:authentication property="principal.m_id" var="m_id"/>
                      <input type="hidden" name="m_id" value="${m_id}">
                      <sec:authentication property="principal.m_password" var="m_password"/>
                      <div class="form-group">
                        <label id="LabelPassword1" for="InputPassword1">비밀번호 *</label>
                        <div class="input-group">
	                        <input type="password" class="form-control" id="InputPassword1" placeholder="Password" name="m_password" required>
	                      	<div class="input-group-append">
		                    	<button id="BtnPassword1" class="btn btn-inverse-secondary btn-fw" type="button"><i class="mdi mdi-eye-off"></i></button>
		                    </div>
		              	</div>
                      </div>
                      <div class="form-group">
                        <label id="LabelPassword2" for="InputPassword2">비밀번호 확인 *</label>
                        <div class="input-group">
	                        <input type="password" class="form-control" id="InputPassword2" placeholder="Re Password" required>
	                        <div class="input-group-append">
		                    	<button id="BtnPassword2" class="btn btn-inverse-secondary btn-fw" type="button"><i class="mdi mdi-eye-off"></i></button>
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
                      <div class="form-group">
                        <label id="LabelStr" for="InputStr">"<span id="Str">PISIC 홈페이지를 탈퇴하겠습니다.</span>" 라고 입력해 주세요 *</label>
                        <input type="text" class="form-control" id="InputStr" placeholder="PISIC 홈페이지를 탈퇴하겠습니다." required>
                      </div>
                      <div id="InputButtons">
                      	<input id="InputSubmit" type="button" class="btn btn-info btn-fw" value="회원 탈퇴"/>
                      	<input id="InputCancel" type="button" class="btn btn-inverse-secondary btn-fw" value="취소">                      
                      </div>
                      <script>
                      	$("#InputCancel").on("click", function(){
                      		var cancel = confirm("회원탈퇴를 취소하시겠습니까?");
                      		if (cancel) {
                      			location.href = '<%=request.getContextPath()%>/member/showMyInfo';                   			
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
    	$(document).ready(function(){
    		var InputPw1 = null;
    		var InputPw2 = null;
    		var InputStr = null;
    		
    		var FlagPw1 = false;
    		var FlagPw2 = false;
    		var FlagStr = false;
    		
    		var InfoId = '${m_id}';
    		var Str = "PISIC 홈페이지를 탈퇴하겠습니다.";
    		
    		var header = $("meta[name='_csrf_header']").attr('th:content');
    		var token = $("meta[name='_csrf']").attr('th:content');
			console.log(header);
			console.log(token);
    		
			// 비밀번호
    		$("#InputPassword1").on("input", function(){
    			$.fn.FxPassword1();
    		})
			
			// 비밀번호 함수
			$.fn.FxPassword1 = function(){
    			InputPw1 = $("#InputPassword1").val();
    			InputPw2 = $("#InputPassword2").val();
    			
    			if (InputPw1 == '') {
    				$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
	    			FlagPw1 = false;
    				$("#SpanPassword1").css("color", "red");
    			} else {
    				$.ajax({
    					url: "<%=request.getContextPath()%>/member/passwordCheck.ax",
    					data: {
    						m_id: InfoId,
    						m_password: InputPw1
    					},
    					dataType: "json",
    					type: "post",
    					beforeSend: function(xhr){
    				        xhr.setRequestHeader(header, token);
    				    },
    					success: function(result){
    					    if (result == 1) {
    			        		$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-check"></i></span>');
    		    				$("#SpanPassword1").css("color", "green");
    		    				console.log("일치");
    		    				FlagPw1 = true;
    			    		} else {
    			    			$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</span>');
    			        		$("#SpanPassword1").css("color", "red");
    			        		console.log("불일치");
    			        		FlagPw1 = false;
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			
    			if (InputPw1 != InputPw2) {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</span>');
    				$("#SpanPassword2").css("color", "red");
    				FlagPw2 = false;
    			} else {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPassword2").css("color", "green");
    				FlagPw2 = true;
    			}
    			console.log(FlagPw1);
    			console.log(FlagPw2);
    		}
			
    		// 비밀번호 확인
    		$("#InputPassword2").on("input", function(){
    			$.fn.FxPassword2();
    		})
    		
			// 비밀번호 확인 함수
    		$.fn.FxPassword2 = function(){
    			InputPw1 = $("#InputPassword1").val();
    			InputPw2 = $("#InputPassword2").val();
    			
    			if (InputPw1 != InputPw2) {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</span>');
    				$("#SpanPassword2").css("color", "red");
    				FlagPw2 = false;
    			} else {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPassword2").css("color", "green");
    				FlagPw2 = true;
    			}
    			console.log(FlagPw2);
    		}
    		
    		// 문자열 입력
    		$("#InputStr").on("input", function(){
    			$.fn.FxStr();
    		})
			
    		// 문자열 입력 함수
    		$.fn.FxStr = function(){
    			InputStr = $("#InputStr").val();
    			
    			if (InputStr != Str) {
    				$("#LabelStr").html('"<span id="Str">PISIC 홈페이지를 탈퇴하겠습니다.</span>" 라고 입력해 주세요 *');
    				$("#Str").css("color", "red");
    				FlagStr = false;
    			} else {
    				$("#LabelStr").html('"<span id="Str">PISIC 홈페이지를 탈퇴하겠습니다.</span>" 라고 입력해 주세요 <i class="mdi mdi-check"></i>');
    				$("#Str").css("color", "green");
    				$(".mdi-check").css("color", "green");
    				FlagStr = true;
    			}
    			console.log(FlagStr);
    		}
    		
    		// Submit 유효성 검사
	    	$("#InputSubmit").on("click", function(){
				if (FlagPw1 == false) {
					$.fn.FxPassword1();
		    		$("#InputPassword1").focus();
		    	} else if (FlagPw2 == false) {
		    		$.fn.FxPassword2();
		    		$("#InputPassword2").focus();
		    	} else if (FlagStr == false) {
		    		$.fn.FxStr();
		    		$("#InputStr").focus();
		    	} else {
		    		var submit = confirm("회원탈퇴 하시겠습니까?");
              		if (submit) {
              			$("#deleteForm").submit();                			
              		}
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
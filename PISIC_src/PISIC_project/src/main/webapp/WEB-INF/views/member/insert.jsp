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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
  <style>
  	.content-wrapper {
  		max-width: 900px;
  	}
  	.btn.btn-info.btn-fw {
  		margin: 0 auto;
    	display: block;
  	}
  	.btn.btn-inverse-secondary.btn-fw {
  		
  	}
  	#ImgProfilePre {
  		margin-right: 10px;
  		width: calc(100% - 160px);
  		border-radius: 2px;
  	}
  	@media (max-width: 321px) {
  		#ImgProfilePre {
			max-width: 172px;
		}
  	}
  </style>
  <style>
  	/* .uploadcare--widget__button, .uploadcare--widget__file-name, 
  	.uploadcare--widget__file-size, .uploadcare--widget__text {
    	display: none;
	} */
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
                      	<label id="LabelId" for="InputId">아이디 *</label>
                      	<div class="input-group">
	                        <input type="text" class="form-control" id="InputId" placeholder="ID" name="m_id" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label id="LabelPassword1" for="InputPassword1">비밀번호 *</label>
                        <input type="password" class="form-control" id="InputPassword1" placeholder="Password" name="m_password" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelPassword2" for="InputPassword2">비밀번호 확인 *</label>
                        <input type="password" class="form-control" id="InputPassword2" placeholder="Re Password" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelName" for="InputName">이름 *</label>
                        <input type="text" class="form-control" id="InputName" placeholder="Name" name="m_name" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelNickname" for="InputNickname">닉네임 *</label>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputNickname" placeholder="Nickname" name="m_nickname" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label id="LabelEmail" for="InputEmail">이메일 *</label>
                        <div class="input-group">
	                        <input type="email" class="form-control" id="InputEmail" placeholder="Email" name="m_email" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>
                      </div>
                      <div class="form-group">
                        <label id="LabelPhone" for="InputPhone">휴대전화 *</label>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputPhone" placeholder="Phone" name="m_phone" required>
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button">중복확인</button>
	                        </div>
                      	</div>                  
                      </div>
                      <div class="form-group">
                        <label id="LabelBirth" for="InputBirth">생년월일 *</label>
                        <input type="text" class="form-control" id="InputBirth" placeholder="Date of Birth" name="m_birth" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelGender" for="SelectGender">성별 *</label>
                        <select class="form-control" id="SelectGender" name="m_gender">
                          <option value="M">남성</option>
                          <option value="F">여성</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label id="LabelAddress" for="InputAddress">주소 *</label>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputAddress" placeholder="Address" name="m_address" required>  
	                        <div class="input-group-append">
	                          <button class="btn btn-inverse-secondary btn-fw" type="button" onclick="daumPost()">주소찾기</button>
	                        </div>
                      	</div>   
                      </div>
                      <div class="form-group">
                        <label id="LabelAddressDetail" for="InputAddressDetail">상세주소 *</label>
	                    <input type="text" class="form-control" id="InputAddressDetail" placeholder="AddressDetail" name="m_address_detail" required>
                      </div>
		      		  <!-- kakao 우편번호 서비스 -->
                      <script>
                      	function daumPost() {
                      		new daum.Postcode({
                      			oncomplete: function(data) {
                      				var fullAddr = '';
                      				var extraAddr = '';
                      				
                      				// 도로명 주소를 선택했을 경우
                      				if (data.userSelectedType === 'R') {
                      					fullAddr = data.roadAddress;
                      				// 지번 주소를 선택했을 경우
                      				} else {
                      					fullAddr = data.jibunAddress;
                      				}
                      				// 도로명일때 조합
                      				if (data.userSelectedType === 'R') {
                      					// 법정동명 추가
                      					if (data.bname !== '') {
                      						extraAddr += data.bname;
                      					}
                      					// 건물명 추가
                      					if (data.buildingName !== '') {
                      						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      					}
                      					// 괄호 추가
                      					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                      				}
                      				$("#InputAddress").val(fullAddr);
                      				$("#InputAddressDetail").focus();
                      			}
                      		}).open();
                      	}
                      </script>
                      <div class="form-group">
                        <label id="LabelProfile">프로필사진 *</label>
                        <div class="input-group">
                          <img id="ImgProfilePre" src="<%=request.getContextPath()%>/resources/assets/images/DummyImage.png">
                          <span class="input-group-append">
                            <button id="BtnProfile" class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
                          </span>
                        </div>
                        <input type="hidden" id="InputProfile" name="m_profile">
                        <input type="hidden" id="InputProfileUC" role="uploadcare-uploader" 
                            data-public-key="183400fad159d76bdf53" data-tabs="file gdrive gphotos"/>
                      </div>
                      <button type="submit" class="btn btn-info btn-fw" id="btn_submit">회원가입</button>
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
    <!-- 회원가입 from -->
    <script>
	    var InputId = null;
		var InputPw1 = null;
		var InputPw2 = null;
		var InputName = null;
		var InputNickname = null;
		var InputEmail = null;
		var InputPhone = null;
		var InputBirth = null;
		var InputAddress = null;
		var InputAddressDetail = null;
		var InputProfile = null;
		
    	$(document).ready(function(){
    		// 아이디
    		$("#InputId").on("keyup", function(){
    			var regexId = /^[0-9a-zA-Z]{7,15}$/;
    			InputId = $("#InputId").val();
    			
    			if (!regexId.test(InputId)) {
    				if (InputId == '') {
    					$("#LabelId").html('아이디 <span id="SpanId"><i class="mdi mdi-close"></i> (필수 정보입니다.)</span>');
    				} else {
    					$("#LabelId").html('아이디 <span id="SpanId"><i class="mdi mdi-close"></i> (7 ~ 15자의 영문, 숫자만 사용 가능합니다.)</span>');
    				}
    				$("#SpanId").css("color", "red");
    			} else {
    				$("#LabelId").html('아이디 <span id="SpanId"><i class="mdi mdi-check"></i></span>');
    				$("#SpanId").css("color", "green");
    			}
    		})
    		
    		// 비밀번호
    		$("#InputPassword1").on("keyup", function(){
    			var regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    			InputPw1 = $("#InputPassword1").val();
    			
    			if (!regexPw.test(InputPw1)) {
    				if (InputPw1 == '') {
    					$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-close"></i> 8 ~ 20자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>');
    				}
    				$("#SpanPassword1").css("color", "red");
    			} else {
    				$("#LabelPassword1").html('비밀번호 <span id="SpanPassword1"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPassword1").css("color", "green");
    			}
    		})
    		
    		// 비밀번호 확인
    		$("#InputPassword2").on("keyup", function(){
    			InputPw1 = $("#InputPassword1").val();
    			InputPw2 = $("#InputPassword2").val();
    			
    			if (InputPw1 != InputPw2) {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-close"></i> 비밀번호가 일치하지 않습니다.</span>');
    				$("#SpanPassword2").css("color", "red");
    			} else {
    				$("#LabelPassword2").html('비밀번호 확인 <span id="SpanPassword2"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPassword2").css("color", "green");
    			}
    		})
    		
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
    				$("#SpanName").css("color", "red");
    			} else {
    				$("#LabelName").html('이름 <span id="SpanName"><i class="mdi mdi-check"></i></span>');
    				$("#SpanName").css("color", "green");
    			}
    		})
    		
    		// 닉네임
    		$("#InputNickname").on("keyup", function(){
    			var regexNickname = /^[가-힣|a-z|A-Z|0-9]{2,15}$/;
    			InputNickname = $("#InputNickname").val();
    			
    			if (!regexNickname.test(InputNickname)) {
    				if (InputNickname == '') {
    					$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-close"></i> 2 ~ 15자의 한글, 영문 대 소문자, 숫자를 사용하세요.</span>');
    				}
    				$("#SpanNickName").css("color", "red");
    			} else {
    				$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-check"></i></span>');
    				$("#SpanNickName").css("color", "green");
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
    					$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-close"></i> 이메일 형식이 맞지 않습니다. ex)pisic1234@gmail.com</span>');
    				}
    				$("#SpanEmail").css("color", "red");
    			} else {
    				$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-check"></i></span>');
    				$("#SpanEmail").css("color", "green");
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
    				$("#SpanPhone").css("color", "red");
    			} else {
    				$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPhone").css("color", "green");
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
    				$("#SpanBirth").css("color", "red");
    			} else {
    				$("#LabelBirth").html('생년월일 <span id="SpanBirth"><i class="mdi mdi-check"></i></span>');
    				$("#SpanBirth").css("color", "green");
    			}
    		})
    		
    		// 주소
    		$("#InputAddress").attr("readonly", true);
    		InputAddress = $("#InputAddress").val();
    		
    		if (InputAddress != '') {
    			$("#LabelAddress").html('주소 <span id="SpanAddress"><i class="mdi mdi-check"></i></span>');
    			$("#SpanAddress").css("color", "green");
    		}
    		
    		// 상세주소
    		$("#InputAddressDetail").on("keyup", function(){
    			InputAddressDetail = $("#InputAddressDetail").val();		
    			
				if (InputAddressDetail == '') {
					$("#LabelAddressDetail").html('상세주소 <span id="SpanAddressDetail"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#SpanAddressDetail").css("color", "red");	
    			} else {
    				$("#LabelAddressDetail").html('상세주소 <span id="SpanAddressDetail"><i class="mdi mdi-check"></i></span>');
    				$("#SpanAddressDetail").css("color", "green");
    			}
    		})
    		
    		// 프로필 사진
    		$("#BtnProfile").on("click", function(){
	    		$(".uploadcare--widget__button.uploadcare--widget__button_type_open").trigger("click");    			
    		})
			
    		/* uploadcare */
    	    UPLOADCARE_LOCALE = "ko"
    	    UPLOADCARE_LOCALE_TRANSLATIONS = {
    	        buttons: {
    	            choose: {
    	                files: {
    	                    one: '사진첨부'
    	                }
    	            }
    	        }
    	    }
    		
    		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	    	singleWidget.onUploadComplete(function(info){
		    	console.log(info.cdnUrl);
		    	var fileUrl = info.cdnUrl;
			    	$.ajax({
				    	url: "<%=request.getContextPath()%>/member/profileUpdate.do",
				    	data: {
				    		fileUrl: fileUrl
				    	},
				    	async: false,
				    	type: "post",
				    	success: function(result){
				    		console.log(result);
				    		$("#ImgProfilePre").attr("src", fileUrl);
				    		$("#LabelProfile").html('프로필사진 <span id="SpanProfile"><i class="mdi mdi-check"></i></span>');
				    		$("#SpanProfile").css("color", "green");
				    		$("#InputProfile").attr("value", fileUrl);
				    	},
				    	error: function(error){
				    		console.log(error);
				    		$("#ImgProfilePre").attr("src", fileUrl);
				    		$("#LabelProfile").html('프로필사진 <span id="SpanProfile"><i class="mdi mdi-close"></i> 다시 시도해 주세요.</span>');
				    		$("#SpanProfile").css("color", "red");
				    		$("#InputProfile").attr("value", fileUrl);
			    		}
	    		});
    		});
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

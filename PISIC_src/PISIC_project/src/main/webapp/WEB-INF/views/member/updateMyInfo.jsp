<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>정보 수정</title>
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
  	.uploadcare--widget__button, .uploadcare--widget__file-name, 
  	.uploadcare--widget__file-size, .uploadcare--widget__text {
    	display: none;
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
              <h3 class="page-title">정보수정</h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">정보수정</li>
                </ol>
              </nav>
            </div>
          	<div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">정보수정</h4>
                    <form id="updateForm" class="forms-sample" action="<%=request.getContextPath() %>/member/updateMyInfo" method="post">
                      <div class="form-group">
                      	<label id="LabelId" for="InputId">아이디</label>
                      	<sec:authentication property="principal.m_id" var="m_id"/>
                      	<input type="text" class="form-control file-upload-info" id="InputId" placeholder="ID" name="m_id" value="${m_id}" readonly required>
                      </div>
                      <div class="form-group">
                        <label id="LabelName" for="InputName">이름</label>
                        <sec:authentication property="principal.m_name" var="m_name"/>
                        <input type="text" class="form-control" id="InputName" placeholder="Name" name="m_name" value="${m_name}" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelNickname" for="InputNickname">닉네임</label>
                        <sec:authentication property="principal.m_nickname" var="m_nickname"/>
                        <input type="text" class="form-control" id="InputNickname" placeholder="Nickname" name="m_nickname" value="${m_nickname}" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelEmail" for="InputEmail">이메일</label>
                        <sec:authentication property="principal.m_email" var="m_email"/>
                        <input type="email" class="form-control" id="InputEmail" placeholder="Email" name="m_email" value="${m_email}" required>
                      </div>
                      <div class="form-group">
                        <label id="LabelPhone" for="InputPhone">휴대전화</label>
                        <sec:authentication property="principal.m_phone" var="m_phone"/>
                        <input type="text" class="form-control" id="InputPhone" placeholder="Phone" name="m_phone" value="${m_phone}" required>               
                      </div>
                      <div class="form-group">
                        <label id="LabelBirth" for="InputBirth">생년월일</label>
                        <sec:authentication property="principal.m_birth" var="m_birth"/>
                        <input type="text" class="form-control file-upload-info" id="InputBirth" placeholder="Date of Birth" name="m_birth" value="${m_birth}" readonly required>
                      </div>
                      <div class="form-group">
                        <label id="LabelGender" for="SelectGender">성별</label>
                        <sec:authentication property="principal.m_gender" var="m_gender"/>
                        <select class="form-control" id="SelectGender" name="m_gender">
                        <c:choose>
                        	<c:when test="${m_gender eq 'M'}">
                        		<option value="M" selected>남성</option>
                          		<option value="F">여성</option>
                        	</c:when>
                        	<c:otherwise>
                        		<option value="M">남성</option>
                          		<option value="F" selected>여성</option>
                        	</c:otherwise>
                        </c:choose>
                          
                        </select>
                      </div>
                      <div class="form-group">
                        <label id="LabelAddress" for="InputAddress">주소</label>
                        <sec:authentication property="principal.m_address" var="m_address"/>
                        <div class="input-group">
	                        <input type="text" class="form-control" id="InputAddress" placeholder="Address" name="m_address" value="${m_address}" readonly required>  
	                        <div class="input-group-append">
	                          <button id="BtnAddress" class="btn btn-inverse-secondary btn-fw" type="button" onclick="daumPost()">주소찾기</button>
	                        </div>
                      	</div>   
                      </div>
                      <div class="form-group">
                        <label id="LabelAddressDetail" for="InputAddressDetail">상세주소</label>
                        <sec:authentication property="principal.m_address_detail" var="m_address_detail"/>
	                    <input type="text" class="form-control" id="InputAddressDetail" placeholder="AddressDetail" name="m_address_detail" value="${m_address_detail}" required>
                      </div>
		      		  <!-- kakao 우편번호 서비스 -->
                      <script>
              			var FlagAddress = false;
                      
                      	function daumPost() {
                      		new daum.Postcode({
                      			oncomplete: function(data) {
                      				var fullAddr = '';
                      				var extraAddr = '';
                      				
                      				//도로명 주소를 선택했을 경우
                      				if (data.userSelectedType === 'R') {
                      					fullAddr = data.roadAddress;
                      				//지번 주소를 선택했을 경우
                      				} else {
                      					fullAddr = data.jibunAddress;
                      				}
                      				//도로명일때 조합
                      				if (data.userSelectedType === 'R') {
                      					//법정동명 추가
                      					if (data.bname !== '') {
                      						extraAddr += data.bname;
                      					}
                      					//건물명 추가
                      					if (data.buildingName !== '') {
                      						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      					}
                      					//괄호 추가
                      					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                      				}
                      				$("#InputAddress").val(fullAddr);
                      				$("#InputAddress").attr("readonly", false);
                      				if ($("#InputAddress").val() == fullAddr) {
                      					$("#LabelAddress").html('주소 <span id="SpanAddress"><i class="mdi mdi-check"></i></span>');
                            		    $("#SpanAddress").css("color", "green");
                        		    	FlagAddress = true;
                      				} else {
                      					$("#LabelAddress").html('주소 <span id="SpanAddress"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
                        		    	$("#SpanAddress").css("color", "red");
                            		    FlagAddress = false;
                      				}
                      				$("#InputAddress").attr("readonly", true);
                      				$("#InputAddressDetail").focus();
                      				console.log(FlagAddress);
                      			}
                      		}).open();
                      	}
                      </script>
                      <div class="form-group">
                        <label id="LabelProfile">프로필사진</label>
                        <sec:authentication property="principal.m_profile" var="m_profile"/>
                        <div class="input-group">
                          <img id="ImgProfilePre" src="${m_profile}">
                          <span class="input-group-append">
                            <button id="BtnProfile" class="btn btn-inverse-secondary btn-fw" type="button">첨부파일</button>
                          </span>
                        </div>
                        <input type="hidden" id="InputProfile" name="m_profile">
                        <input type="hidden" id="InputProfileUC" role="uploadcare-uploader" 
                            data-public-key="183400fad159d76bdf53" data-tabs="file gdrive gphotos"/>
                      </div>
                      <input id="InputSubmit" type="button" class="btn btn-info btn-fw" value="정보수정">
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
    <!-- 정보수정 form -->
    <!-- 회원가입 from -->
    <script>
    	$(document).ready(function(){
    		var InputName = null;
    		var InputNickname = null;
    		var InputEmail = null;
    		var InputPhone = null;
    		var InputAddress = null;
    		var InputAddressDetail = null;
    		var InputProfile = null;

    		var InfoName = '${m_name}';
    		var InfoNickname = '${m_nickname}';
    		var InfoEmail = '${m_email}';
    		var InfoPhone = '${m_phone}';
    		var InfoGender = '${m_gender}';
    		var InfoAddress = '${m_address}';
    		var InfoAddressDetail = '${m_address_detail}';
    		
    		var FlagId = false;
    		var FlagName = false;
    		var FlagNickname = false;
    		var FlagEmail = false;
    		var FlagPhone = false;
    		var FlagGender = false;
    		var FlagAddressDetail = false;
    		
    		// 이름
    		$("#InputName").on("input", function FxName(){
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
    			console.log(FlagName);
    		})
    		
    		// 닉네임
    		$("#InputNickname").on("input", function FxNickname(){
    			var regexNickname = /^[가-힣|a-z|A-Z|0-9]{2,15}$/;
    			InputNickname = $("#InputNickname").val();
    			
    			if (!regexNickname.test(InputNickname)) {
    				if (InputNickname == '') {
    					$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-close"></i> 2 ~ 15자의 한글, 영문 대 소문자, 숫자를 사용하세요.</span>');
    				}
    				FlagNickname = false;
    				$("#SpanNickName").css("color", "red");
    			} else if (InputNickname == InfoNickname){
    				$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-check"></i></span>');
    				$("#SpanNickName").css("color", "green");
    				FlagNickname = true;
    			} else {
    				$.ajax({
    					url: "<%=request.getContextPath()%>/member/nicknameCheck.ax",
    					data: {
    					    m_nickname: InputNickname
    					},
    					type: "post",
    					success: function(result){
    					    if (result == 1) {
    			    			$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-delta"></i> 중복된 닉네임이 있습니다.</span>');
    			        		$("#SpanNickName").css("color", "yellow");
    			        		FlagNickname = false;
    			    		} else {
    			    			$("#LabelNickname").html('닉네임 <span id="SpanNickName"><i class="mdi mdi-check"></i></span>');
    		    				$("#SpanNickName").css("color", "green");
    		    				FlagNickname = true;
    			        		
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			console.log(FlagNickname);
    		})
    		
    		// 이메일
    		$("#InputEmail").on("input", function FxEmail(){
    			var regexEmail = /^[A-Za-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    			InputEmail = $("#InputEmail").val();		
    			
    			if (!regexEmail.test(InputEmail)) {
    				if (InputEmail == '') {
    					$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-close"></i> 이메일 형식이 맞지 않습니다. ex)pisic1234@pisic.com</span>');
    				}
    				FlagEmail = false;
    				$("#SpanEmail").css("color", "red");
    			} else if (InputEmail == InfoEmail){
    				$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-check"></i></span>');
    				$("#SpanEmail").css("color", "green");
    				FlagEmail = true;
    			} else {
    				$.ajax({
    					url: "<%=request.getContextPath()%>/member/emailCheck.ax",
    					data: {
    					    m_email: InputEmail
    					},
    					type: "post",
    					success: function(result){
    					    if (result == 1) {
    			    			$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-delta"></i> 중복된 이메일이 있습니다.</span>');
    			        		$("#SpanEmail").css("color", "yellow");
    			        		FlagEmail = false;
    			    		} else {
    			    			$("#LabelEmail").html('이메일 <span id="SpanEmail"><i class="mdi mdi-check"></i></span>');
    		    				$("#SpanEmail").css("color", "green");
    		    				FlagEmail = true;
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			console.log(FlagEmail);
    		})
    		
    		// 휴대전화
    		$("#InputPhone").on("input", function FxPhone(){
    			var regexPhone = /^[0][1]([0|1|6|7|8|9])+[0-9]{7,8}$/;
    			InputPhone = $("#InputPhone").val();
    			
    			if (!regexPhone.test(InputPhone)) {
    				if (InputPhone == '') {
    					$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
    				} else {
    					$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-close"></i> 휴대전화 형식이 맞지 않습니다. ex)01012345678</span>');
    				}
    				FlagPhone = false;
    				$("#SpanPhone").css("color", "red");
    			} else if (InputPhone == InfoPhone){
    				$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-check"></i></span>');
    				$("#SpanPhone").css("color", "green");
    				FlagPhone = true;
    			} else {
    				$.ajax({
    					url: "<%=request.getContextPath()%>/member/phoneCheck.ax",
    					data: {
    					    m_phone: InputPhone
    					},
    					type: "post",
    					success: function(result){
    					    if (result == 1) {
    					    	$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-delta"></i> 중복된 휴대전화 번호가 있습니다.</span>');
    			        		$("#SpanPhone").css("color", "yellow");
    			        		FlagPhone = false;
    			    		} else {
    			    			$("#LabelPhone").html('휴대전화 <span id="SpanPhone"><i class="mdi mdi-check"></i></span>');
    		    				$("#SpanPhone").css("color", "green");
    		    				FlagPhone = true;
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			console.log(FlagPhone);
    		})
    		
    		// 성별
    		$("#SelectGender").on("click", function(){
    			$("#LabelGender").html('성별 <span id="SpanGender"><i class="mdi mdi-check"></i></span>');
				$("#SpanGender").css("color", "green");
				FlagGender = true;
    		})
    		
    		// 주소
    		InputAddress = $("#InputAddress").val();
    		
    		// 상세주소
    		$("#InputAddressDetail").on("keyup", function FxAddressDetail(){
    			InputAddressDetail = $("#InputAddressDetail").val();		
    			
				if (InputAddressDetail == '') {
					$("#LabelAddressDetail").html('상세주소 <span id="SpanAddressDetail"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
					$("#SpanAddressDetail").css("color", "red");
					FlagAddressDetail = false;
    			} else {
    				$("#LabelAddressDetail").html('상세주소 <span id="SpanAddressDetail"><i class="mdi mdi-check"></i></span>');
    				$("#SpanAddressDetail").css("color", "green");
    				FlagAddressDetail = true;
    			}
				console.log(FlagAddressDetail);
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
    		
    		/* uploadcare */
    		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
	    	singleWidget.onUploadComplete(function(info){
		    	console.log(info.cdnUrl);
		    	var fileUrl = info.cdnUrl;
				    $("#ImgProfilePre").attr("src", fileUrl);
				    $("#LabelProfile").html('프로필사진 <span id="SpanProfile"><i class="mdi mdi-check"></i></span>');
				    $("#SpanProfile").css("color", "green");
				    $("#InputProfile").attr("value", fileUrl);
				 /* $("#ImgProfilePre").attr("src", fileUrl);
				    $("#LabelProfile").html('프로필사진 <span id="SpanProfile"><i class="mdi mdi-close"></i> 다시 시도해 주세요.</span>');
				    $("#SpanProfile").css("color", "red");
				    $("#InputProfile").attr("value", fileUrl); */
    		});
	    	
	    	// Flag 확인
	    	$("#BtnProfile").on("click", function(){
	    		console.log(FlagName);
	    		console.log(FlagNickname);
	    		console.log(FlagEmail);
	    		console.log(FlagPhone);
	    		console.log(FlagAddress);
	    		console.log(FlagAddressDetail);
	    	})
	    	
	    	// Submit 유효성 검사
	    	$("#InputSubmit").on("click", function(){
				if (FlagName == false) {
		    		$("#InputName").focus();
		    	} else if (FlagNickname == false) {
		    		$("#InputNickname").focus();
		    	} else if (FlagEmail == false) {
		    		$("#InputEmail").focus();
		    	} else if (FlagPhone == false) {
		    		$("#InputPhone").focus();
		    	} else if (FlagGender == false) {
		    		$("#LabelGender").html('성별 <span id="SpanGender"><i class="mdi mdi-close"></i> 성별을 선택해 주세요.</span>');
					$("#SpanGender").css("color", "red");
					$("#SelectGender").focus();
		    	} else if (FlagAddress == false) {
		    		$("#LabelAddress").html('주소 <span id="SpanAddress"><i class="mdi mdi-close"></i> 필수 정보입니다.</span>');
		        	$("#SpanAddress").css("color", "red");
		        	$("#InputAddress").focus();
		    	} else if (FlagAddressDetail == false) {
		    		$("#InputAddressDetail").focus();
		    	} else {
		    		$("#updateForm").submit();
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
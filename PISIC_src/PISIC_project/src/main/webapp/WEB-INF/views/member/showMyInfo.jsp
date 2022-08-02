<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style>
    .row {
  		margin-top: 0.75rem;
  	}
  	.btn.btn-info.btn-fw, .btn.btn-inverse-secondary.btn-fw {
  		flex: 0 0 50%;
  		max-width: 150px !important;
  		min-width: 150px !important;
  		margin: 0 auto;
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
              <h2 class="card-title">INFORMATION</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">회원</a></li>
                  <li class="breadcrumb-item active" aria-current="page">회원정보</li>
                </ol>
              </nav>
            </div>
            <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">회원정보</h4>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">아이디</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_id}" readonly>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">플랫폼</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_platform}" readonly>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">이름</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_name}" readonly>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">닉네임</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_nickname}" readonly>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">이메일</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_email}" readonly>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">휴대전화</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_phone}" readonly>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">생년월일</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_birth}" readonly>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">성별</label>
                            <div class="col-sm-9">
                            	<c:choose>
                            		<c:when test="${member.m_gender eq 'M'}">
		                              <input class="form-control file-upload-info" value="남자" readonly>
                            		</c:when>
                            		<c:otherwise>
		                              <input class="form-control file-upload-info" value="여자" readonly>
                            		</c:otherwise>
                            	</c:choose>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">주소</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_address}" readonly>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">상세주소</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="${member.m_address_detail}" readonly>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                      	<div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">가입일자</label>
                            <div class="col-sm-9">
                              <input class="form-control file-upload-info" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_date}"/>" readonly>
                            </div>
                          </div>
                        </div>
                      </div>
                  	<div class="row">
	                    <button type="button" class="btn btn-info btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/updateMyInfo'">정보수정</button>
	                    <button type="button" class="btn btn-inverse-secondary btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/updatePassword'">비밀번호 변경</button>
		                <button type="button" class="btn btn-inverse-secondary btn-fw" onclick="location.href='<%=request.getContextPath()%>/member/deleteMember'">회원탈퇴</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>아티스트 음원 추가</title>
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
</head>
<body>
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="../_sidebar_login.jsp" />
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../_navbar.jsp" />
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          	<div class="card-body">
          		<form class="forms-sample" action="<%=request.getContextPath() %>/crawling/insertA" method="post">
          		<!-- csrf 공격 방지 -->
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<h4 class="card-title">1. 아티스트 추가</h4>
				<div class="form-group">
                    <div class="input-group">
                    	<div class="input-group-prepend">
                          <span class="input-group-text">아티스트명</span>
                        </div>
                        <input type="text" class="form-control" name="artist" required>
                        <div class="input-group-append">
                          <button class="btn btn-sm btn-primary" type="submit">시작</button>
                        </div>
                    </div>
                </div>
                </form>
                <form class="forms-sample" action="<%=request.getContextPath() %>/crawling/insertB" method="post">
                <!-- csrf 공격 방지 -->
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<h4 class="card-title">2. 앨범, 노래 추가</h4>
				<div class="form-group">
                    <div class="input-group">
                    	<div class="input-group-prepend">
                          <span class="input-group-text">아티스트명</span>
                        </div>
                        <input type="text" class="form-control" name="artist" required>
                        <div class="input-group-append">
                          <button class="btn btn-sm btn-primary" type="submit">시작</button>
                        </div>
                    </div>
                </div>
                </form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf_header" th:content="${_csrf.headerName}">
	<meta name="_csrf" th:content="${_csrf.token}">
    <title>PISIC ADMIN</title>
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
		.table-responsive {
			width: 100%;
			height: 680px;
			overflow: auto;
		}
		
		div.search_membership {
			width: 600px;
		}
		
		.btn-search {
			background-color: #8f5fe8;
			border-color: #8f5fe8;
			width: 100px;
		}
		
		table.membership_list tr>td {
			text-align: center;
		}
    </style>
    <script>
	    $(function(){
	    	var msg = '${msg}';
	    	if(msg){
	    		alert(msg);
	    	}
	    	
	    	// 체크박스 전체선택
	        $("#check_all").click(function(){
	        	if($('#check_all').is(':checked')){
	        		$('input:checkbox').prop('checked', true);
	        	} else {
	        		$('input:checkbox').prop('checked', false);
	        	}
	        });
	        $("input:checkbox").click(function() {
	    		var total = $(".membership_checkbox").length;
	    		var checked = $(".membership_checkbox:checked").length;
	    		console.log("total : " + total);
	    		console.log("checked : " + checked);
	    		if(total != checked) {
	    			$("#check_all").prop("checked", false);
	    		} else {
	    			$("#check_all").prop("checked", true); 
	    		}
	    	});
	    });
    </script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
      <jsp:include page="../_sidebar_admin.jsp" />
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="../_navbar.jsp" />
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">Membership Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search_membership">
							<form name="search-form" autocomplete="off">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="이용권 이름" aria-label="Recipient's username" aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button" id="search_membership">조회하기</button>
									</div>
								</div>
							</form>
						</div>
					<form name="frm_sound">
						<div class="select_btns">
							<button type="button" id="insert_membership" class="btn btn-info btn-fw" >이용권 추가</button>
							<button type="button" id="select_delete" class="btn btn-info btn-fw">선택 삭제</button>
						</div>
						<br>
							<div class="table-responsive">
								<table class="table membership_list" id="membership_list">
									<thead>
										<tr>
											<td>
												<div class="form-check form-check-muted m-0">
													<label class="form-check-label">
													<input type="checkbox" class="form-check-input" id="check_all">
													</label>
												</div>
											</td>
											<td>No</td>
											<td>이름</td>
											<td>가격</td>
											<td>기간</td>
											<td>수정</td>
											<td>삭제</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${membershipList}" var="membership" varStatus="index">
											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input membership_checkbox" value="${membership.ms_no}" name="m_id">
														</label>
													</div>
												</td>
												<td>${index.count }</td>
												<td>${membership.ms_name}</td>
												<td>${membership.ms_price}</td>
												<td>${membership.ms_period}</td>
												<td>
													<div class="select_btns">
														<button type="button" class="btn btn-info btn-fw update_membership_btn" onclick="location.href='<%=request.getContextPath() %>/admin/updateMembership?ms_no=${membership.ms_no}'">수정</button>
													</div>
												</td>
												<td>
													<div class="select_btns">
														<button type="button"
															class="btn btn-info btn-fw delete_membership_btn">삭제</button>
														<input type="hidden" value="${membership.ms_no}" name="delete_one_ms_no">
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
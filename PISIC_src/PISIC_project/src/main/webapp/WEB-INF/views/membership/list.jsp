<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="_csrf_header" th:content="${_csrf.headerName}">
	<meta name="_csrf" th:content="${_csrf.token}">
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  	<style>
  		h3 {
  			font-size: xx-large;
  		}
  		.text-success {
  			font-size: xx-large;
  			color: #8f5fe8 !important;
  			margin-left: auto;
  		}
  		.btn-info:not(.btn-light):not(.btn-secondary) {
		    margin-top: 30px;
		}
		#pMs_No {
			display: hidden;
		}
  	</style>
  </head>
  <body>
    <sec:authentication property="principal.m_id" var="m_id"/>
    <sec:authentication property="principal.m_name" var="m_name"/>
    <sec:authentication property="principal.m_nickname" var="m_nickname"/>
    <sec:authentication property="principal.m_email" var="m_email"/>
    <sec:authentication property="principal.m_phone" var="m_phone"/>
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
              <h2 class="card-title">MEMBERSHIP</h2>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">이용권</a></li>
                  <li class="breadcrumb-item active" aria-current="page">이용권 구매</li>
                </ol>
              </nav>
            </div>
            <c:forEach items="${membershipList}" var="membershipList">
            <!-- 1행 시작 -->
            <div class="row">
              <div class="col-xl-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-9">
                        <div class="d-flex align-items-center align-self-start">
                          <h3 id="h3Price" class="mb-0">${membershipList.ms_name}</h3>
                          <p id="pPname" class="text-success ml-2 mb-0 font-weight-medium">${membershipList.ms_price}</p>
                        </div>
                      </div>
                      <div class="col-3">
                          <input type="button" class="InputPurchase btn btn-info btn-lg btn-block" value="구매">
                      </div>
                    </div>
                    <h6 class="text-muted font-weight-normal">무제한 듣기 ${membershipList.ms_no}</h6>
                  </div>
                </div>
              </div>
            </div>
            <!-- 1행 끝 -->
            </c:forEach>
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
            var IMP = window.IMP;
            var code = "imp39912594";
            IMP.init(code);
            
            var mId = "${m_id}";
            var mName = "${m_name}";
            var mNickname = "${m_nickname}";
            var mEmail = "${m_email}";
            var mPhone = "${m_phone}";
            var remPhone = mPhone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
            
    		var header = $("meta[name='_csrf_header']").attr('th:content');
    		var token = $("meta[name='_csrf']").attr('th:content');
			console.log(header);
			console.log(token);
            
            $(".InputPurchase").on("click", function(){
    	    	var price = $(this).parent().prev().find("#pPname").text();
    	    	var pname = $(this).parent().prev().find("#h3Price").text();
    	    	console.log(pname);
    	    	console.log(price);
    	    	
    	    	IMP.request_pay({
    	    		pg : 'html5_inicis',
    	    		pay_method : 'card',
    	    		merchant_uid: "merchant_" + new Date().getTime(),
    	    		name : pname,
    	    		amount : price,
    	    		buyer_email : mEmail,
    	    		buyer_name : mName,
    	    		buyer_tel : remPhone
    	    	}, function (rsp) { // callback
    	    		// 결제 성공
    	            if (rsp.success) {
	    	            $.ajax({
		    	            url: "<%=request.getContextPath()%>/membership/payments/complete",
		    	            type: 'POST',
	    					beforeSend: function(xhr){
	    				        xhr.setRequestHeader(header, token);
	    				    },
		    	            dataType: 'json',
		    	            data: {
		    	            	imp_uid : rsp.imp_uid,
		    	            	merchant_uid: rsp.merchant_uid,
		    	        		m_id : mId
	    	        		}
	    	            }).done(function(data) {
	    	            	if (everythings_fine) {
	    	            		var msg = '결제가 완료되었습니다.';
	    	            		msg += '\n고유ID : ' + rsp.imp_uid;
	    	        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    	        			msg += '\결제 금액 : ' + rsp.paid_amount;
	    	        			msg += '카드 승인번호 : ' + rsp.apply_num;
	    	        			alert(msg);
	    	            	} else {
	    	            		var msg = '결제가 제대로 되지 않았습니다.';
	    	            		alert(msg);
	    	            	}
	    	            })
    	            // 결제 실패  
    	            } else {
    	               var msg = '결제에 실패하였습니다.';
    	               msg += '에러내용 : ' + rsp.error_msg;
    	               alert(msg);
    	            }
    	        });
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
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
  		h6 {
  			padding-left: 12px;
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
    <sec:authentication property="principal.m_address" var="m_address"/>
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
                  <li class="breadcrumb-item"><a href="#">?????????</a></li>
                  <li class="breadcrumb-item active" aria-current="page">????????? ??????</li>
                </ol>
              </nav>
            </div>
            <c:forEach items="${membershipList}" var="membershipList">
            <!-- 1??? ?????? -->
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
                          <input type="button" class="InputPurchase btn btn-info btn-lg btn-block" value="??????">
                          <input type="hidden" class="inputPeriod" value="${membershipList.ms_period}">
                      </div>
                      <h6 class="text-muted font-weight-normal">????????? ??????<span id="spanPno">${membershipList.ms_no}</span></h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 1??? ??? -->
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
            
			var price = null;
			var pname = null;
			var period = null;
			var pno = null;
			var ppg = null;
			
			$(".InputPurchase").on("click", function(){
            	price = $(this).parent().prev().find("#pPname").text();
    	    	pname = $(this).parent().prev().find("#h3Price").text();
    	    	period = $(this).next().val();
    	    	pno = $(this).parent().next().find("#spanPno").text();
    	    	
    	    	console.log(pname);
    	    	console.log(price);
    	    	console.log(period);
    	    	console.log(pno);
    	    	
    	    	var res = null;
    	    	
    	    	$.ajax({
					url: "<%=request.getContextPath()%>/membership/checkMembership",
					data: {
					    m_id: mId
					},
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
				    dataType: "json",
					type: "post",
					success: function(result){
						if (result > 0) {
							alert("???????????? ?????? ?????? ????????????.");
						} else {
							if (period != 0) {
				            	$.fn.FxGeneralPayment();    	    		
			    	    	} else {
			    	    		$.fn.FxRegularPayment();  
			    	    	}
						}
					},
					error: function(error){
					    console.log(error);
				    }
		    	})
        	})
			
			// ?????? ??????
			$.fn.FxGeneralPayment = function(){
				ppg = '????????????(?????????)';
    	    	IMP.request_pay({
    	    		pg : 'html5_inicis',
    	    		pay_method : 'card',
    	    		merchant_uid : "merchant_" + new Date().getTime(),
    	    		name : pname,
    	    		amount : price,
    	    		buyer_email : mEmail,
    	    		buyer_name : mName,
    	    		buyer_tel : remPhone
    	    	}, function (rsp) { // callback
    	    		// ?????? ??????
    	            if (rsp.success) {
    	            	console.log("????????? ??????");
	    	            $.ajax({
		    	            url: "<%=request.getContextPath()%>/payments/completeG",
		    	            type: 'POST',
	    					beforeSend: function(xhr){
	    				        xhr.setRequestHeader(header, token);
	    				    },
		    	            dataType: 'json',
		    	            data: {
		    	            	imp_uid : rsp.imp_uid,
		    	            	merchant_uid : rsp.merchant_uid,
		    	            	price : rsp.paid_amount,
		    	            	pno : pno,
		    	            	period : period,
		    	            	ppg : ppg
	    	        		}
	    				// ajax ??????
	    	            }).done(function(data) {
	    	            	console.log(data);
	    	            	console.log("???????????? ??????");
	    	            	
	    	            	var msg = '????????? ?????????????????????.';
	    	            	msg += '\n??????ID : ' + rsp.imp_uid;
	    	        		msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
	    	        		msg += '\n?????? ?????? : ' + rsp.paid_amount;
	    	        		alert(msg);
	    	        		alert("?????? ?????????????????????.");
	    	        		// ????????? ?????? ????????? ??????
	    	    	    	location.href="<%=request.getContextPath()%>/membership/history";
	    	            });
    	            // ?????? ??????
    	            } else {
    	               var msg = '????????? ?????????????????????.';
    	               msg += '\n???????????? : ' + rsp.error_msg;
    	               alert(msg);
    	            }
    	        });
        	}
			
			// ?????? ??????
			$.fn.FxRegularPayment = function(){
				ppg = '???????????????';
    	    	IMP.request_pay({
    	    		pg : 'html5_inicis.INIBillTst',
    	    		pay_method : 'card',
    	    		merchant_uid: "merchant_" + new Date().getTime(),
    	    		name : pname,
    	    		amount : price,
    	    		customer_uid : mId,
    	    		buyer_email : mEmail,
    	    		buyer_name : mName,
    	    		buyer_tel : remPhone
    	    	}, function (rsp) { // callback
    	    		// ?????? ??????
    	            if (rsp.success) {
    	            	console.log("????????? ??????");
	    	            $.ajax({
		    	            url: "<%=request.getContextPath()%>/payments/completeR",
		    	            type: 'POST',
	    					beforeSend: function(xhr){
	    				        xhr.setRequestHeader(header, token);
	    				    },
		    	            dataType: 'json',
		    	            data: {
		    	            	customer_uid : mId,
		    	            	imp_uid : rsp.imp_uid,
		    	            	merchant_uid : rsp.merchant_uid,
		    	            	price : rsp.price,
		    	            	pno : pno,
		    	            	period : period,
		    	            	ppg : ppg
	    	        		}
	    	            }).done(function(data) {
	    	            	console.log(data);
	    	            	console.log("???????????? ??????");
	    	            	
	    	            	var msg = '????????? ?????????????????????.';
	    	            	msg += '\n??????ID : ' + rsp.imp_uid;
	    	        		msg += '\n?????? ??????ID : ' + rsp.merchant_uid;
	    	        		msg += '\n?????? ?????? : ' + rsp.paid_amount;
	    	        		alert(msg);
	    	        		alert("?????? ?????????????????????.");
	    	    	    	location.href="<%=request.getContextPath()%>/membership/history";
	    	            });
    	            // ?????? ??????  
    	            } else {
    	               var msg = '????????? ?????????????????????.';
    	               msg += '???????????? : ' + rsp.error_msg;
    	               alert(msg);
    	            }
    	            console.log("???");
    	        });
			}
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
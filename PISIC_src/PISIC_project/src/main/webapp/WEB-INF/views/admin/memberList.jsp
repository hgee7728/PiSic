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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.table-responsive {
			width: 100%;
			height: 680px;
			overflow: auto;
		}
		
		.search_member {
			width: 600px;
		}
		
		.btn-search {
			background-color: #8f5fe8;
			border-color: #8f5fe8;
			width: 100px;
		}
		
		table.member_list tr>td {
			text-align: center;
		}
		.pageInfo_wrap{
			text-align: center;
		}
		.pageInfo{
		    list-style : none;
		    display: inline-block;
		   	margin: 50px 0 0 100px;      
		}
		.pageInfo li{
		    float: left;
		    font-size: 20px;
		    margin-left: 18px;
		    padding: 7px;
		    font-weight: 500;
		 }
		.pageInfo a:link {color:white; text-decoration: none;}
		.pageInfo a:visited {color:white; text-decoration: none;}
		.pageInfo a:hover {color:white; text-decoration: underline;}
		.here{
		      background-color: #8f5fe8;
		  }
    </style>
    <script>
	    $(function(){
	    	var header = $("meta[name='_csrf_header']").attr('th:content');
			var token = $("meta[name='_csrf']").attr('th:content');
	    	
	    	var msg = '${msg}';
	    	if(msg){
	    		alert(msg);
	    	}
	    	
	    	// 관리자 추가 버튼
	    	$("#insert_admin").click(function(){
	    		location.href="<%=request.getContextPath()%>/admin/insertAdmin";
	    	});
	    	
	    	// 체크박스 전체선택
	        $("#check_all").click(function(){
	        	if($('#check_all').is(':checked')){
	        		$('input:checkbox').prop('checked',true);
	        	} else {
	        		$('input:checkbox').prop('checked',false);
	        	}
	        })
	        $("input:checkbox").click(function() {
	    		var total = $(".member_checkbox").length;
	    		var checked = $(".member_checkbox:checked").length;
	    		console.log("total : " + total);
	    		console.log("checked : " + checked);
	    		if(total != checked) {
	    			$("#check_all").prop("checked", false);
	    		} else {
	    			$("#check_all").prop("checked", true); 
	    		}
	    	});
	    	
	     	// 한개 탈퇴 버튼
	    	$(document).on("click", ".delete_member_btn", function() {
	    		var confm = confirm("해당 회원을 탈퇴처리 하시겠습니까?");
	        	if (confm == false) {
	        		alert("취소하셨습니다.");
	        	} else {
	        		$.ajax({
	        			url:"<%=request.getContextPath()%>/admin/deleteMember",
	        			type:"post",
	        			beforeSend: function(xhr){
	    			        xhr.setRequestHeader(header, token);
	    			    },
	        			data:{
	        				m_id: $(this).next("input[name=delete_one_m_id]").val()
	        			},
	        			success:function(result){
	        				console.log(result);
	        				if(result == "0"){
	        					alert("회원 탈퇴처리가 실패했습니다. 다시 시도해주세요");
	        				} else {
	        					alert("회원이 탈퇴처리 되었습니다.");
	        					location.reload();
	        				}
	        			},
	        			error:function(error){
	        				
	        			}
	        		});
	        	}
	    	});
	     	
	    	// 선택 탈퇴
	    	$("#select_delete").click(function(){
	    		var confm = confirm("선택된 회원을 삭제 하시겠습니까?");
	        	if (confm == false) {
	        		alert("취소하셨습니다.");
	        	} else {
	        		var m_idArray = [];
	        		$('input[name=m_id]:checked').each(function(){ //체크된 리스트 저장
	        			m_idArray.push($(this).val());
	        	    });
	        		console.log("m_idArray : " + m_idArray);
	        		$.ajax({
	        			url:"<%=request.getContextPath()%>/admin/deleteMember",
	        			type:"post",
	        			traditional:true,
	        			beforeSend: function(xhr){
	    			        xhr.setRequestHeader(header, token);
	    			    },
	        			data:{
	        				m_id : m_idArray
	        				},
	        			success:function(result){
	        				console.log(result);
	        				if(result == "0"){
	        					alert("회원 탈퇴처리가 실패했습니다. 다시 시도해주세요");
	        				} else {
	        					alert("회원이 탈퇴처리 되었습니다.");
	        					location.reload();
	        				}
	        			},
	        			error:function(error){
	        				
	        			}
	        		});
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
						<h2 class="card-title">Member Admin Page</h2>
					</div>
					<br>
					<div class="content_div0 content_div4">
						<div class="form-group search_member">
							<form name="search-form" autocomplete="off">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="아이디, 닉네임, 이름으로 조회하기" aria-label="Recipient's username" aria-describedby="basic-addon2" name="keyword">
									<div class="input-group-append">
										<button class="btn btn-sm btn-search" type="button" id="search_member">조회하기</button>
									</div>
								</div>
							</form>
						</div>
					<form name="frm_sound">
						<div class="select_btns">
							<button type="button" id="insert_admin" class="btn btn-info btn-fw" >관리자 추가</button>
							<button type="button" id="select_delete" class="btn btn-info btn-fw">선택 탈퇴</button>
						</div>
						<br>
							<div class="table-responsive">
								<table class="table member_list" id="member_list">
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
											<td>아이디</td>
											<td>플랫폼</td>
											<td>이름</td>
											<td>닉네임</td>
											<td>가입일자</td>
											<td>탈퇴여부</td>
											<td>이용권</td>
											<td>로그인실패횟수</td>
											<td>계정잠금</td>
											<td>탈퇴처리</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${memberList}" var="member" varStatus="index">
											<tr>
												<td>
													<div class="form-check form-check-muted m-0">
														<label class="form-check-label">
															<input type="checkbox" class="form-check-input member_checkbox" value="${member.m_id}" name="m_id">
														</label>
													</div>
												</td>
												<td>${index.count }</td>
												<td>${member.m_id}</td>
												<td>${member.m_platform}</td>
												<td>${member.m_name}</td>
												<td>${member.m_nickname}</td>
												<td>${member.m_date}</td>
												<td>${member.m_delete_yn}</td>
												<td>${member.m_membership_yn}</td>
												<td>${member.m_fail_cnt}</td>
												<td>
												<c:choose>
													<c:when test="${member.m_enabled eq true}">
														X
													</c:when>
													<c:otherwise>
														O
													</c:otherwise>
												</c:choose>
												</td>
												<td>
													<div class="select_btns">
														<button type="button" class="btn btn-info btn-fw delete_member_btn">탈퇴</button>
														<input type="hidden" value="${member.m_id}" name="delete_one_m_id">
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
						<div class="pageInfo_wrap" >
						        <div class="pageInfo_area">
						        	<ul id="pageInfo" class="pageInfo">
							        <c:if test="${memberPaging.prev}">
					                    <li class="pageInfo_btn previous"><a href="<%=request.getContextPath()%>/admin/member?pageNum=${memberPaging.startPage-1}">Previous</a></li>
					                </c:if>
						 			
						 			<c:forEach var="num" begin="${memberPaging.startPage}" end="${memberPaging.endPage}">
					                    <li class='pageInfo_btn ${memberPaging.cri.pageNum == num ? "here":"" }'><a href="<%=request.getContextPath()%>/admin/member?pageNum=${num}">${num}</a></li>
					                </c:forEach>
					                
					                <c:if test="${memberPaging.next}">
					                    <li class="pageInfo_btn next"><a href="<%=request.getContextPath()%>/admin/member?pageNum=${memberPaging.endPage + 1 }">Next</a></li>
					                </c:if>  
					                </ul>
						        </div>
						    </div>
						</form>
						<form id="movePage" method="get">
							<input type="hidden" name="pageNum" value="${memberPaging.cri.pageNum }">
	        				<input type="hidden" name="amount" value="${memberPaging.cri.amount }">
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
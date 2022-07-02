<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sound Detail</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	margin-right: 20px;
}

table.intro_table tr > td:nth-child(1){
	width:50px;
} 
.content_info {
	vertical-align: middle;
}

.content_div2 {
	clear: both;
	margin: 30px 0px 30px 0px;
}
table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(3),
table.sound_list  tr > td:nth-child(7),
table.sound_list  tr > td:nth-child(8),
table.sound_list  tr > td:nth-child(9){
	width: 5%;
}
table.sound_list  tr > td:nth-child(7),
table.sound_list  tr > td:nth-child(8),
table.sound_list  tr > td:nth-child(9){
	text-align:center;
}

.intro_box {
	font-size:14px;
}
.list_icon{
	font-size:30px;
	margin: 0px 5px;
}


</style>
<script>
$(function(){
	
	// 더보기 기능
	var content = $(".intro_box");
    var content_txt = content.text();
    var content_html = content.html();
    var content_txt_short = content_txt.substring(0,100)+"...";
    
    if(content_txt.length >= 100){
        content.html(content_txt_short)
        
    }else{
        $(".btn_more").hide()
    }
    
    $(".btn_more").click(toggle_content);
    function toggle_content(){
        if($(this).hasClass('short')){
            // 접기 상태
            $(this).html('더보기');
            content.html(content_txt_short)
            $(this).removeClass('short');
        }else{
            // 더보기 상태
            $(this).html('접기');
            content.html(content_html);
            $(this).addClass('short');

        }
    }
    
 	// 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    

    
    // 선택 재생
    $("#select_play").click(function(){
    	// 체크된 노래 확인 후 , 체크 안되어있다면 input-hidden 지우기
    	$("[name=s_no]").each(function(){
    		if(!(this.checked)){
    			$(this).next("[name=a_no]").remove();
    		} 
    		console.log(this.checked);
    	});
    	// Post 방식으로 새창 열기
    	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
    	sound_frm.action="<%=request.getContextPath() %>/sound/play";
    	sound_frm.target="SoundPlayer";
    	sound_frm.method="post";
    	sound_frm.submit();
    });
});

//한곡 재생 - post방식으로 a태그 이용해서 이동
function playOne(a_no,s_no){
	console.log("한곡재생");
	
	var frm = document.createElement('form');
    var input_s_no = document.createElement('input');
    input_s_no.setAttribute('type', 'hidden');
    input_s_no.setAttribute('name', 's_no');
    input_s_no.setAttribute('value', s_no);
	var input_a_no = document.createElement('input');
    input_a_no.setAttribute('type', 'hidden');
    input_a_no.setAttribute('name', 'a_no');
    input_a_no.setAttribute('value', a_no);
    
    frm.appendChild(input_s_no);
    frm.appendChild(input_a_no);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', '<%=request.getContextPath() %>/sound/play');
    document.body.appendChild(frm);
	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.target="SoundPlayer";
    frm.submit();
};
</script>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="../_sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<%-- <jsp:include page="_navbar.jsp" /> --%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="title_div">
						<h2 class="card-title">곡 정보</h2>
					</div>
					<div class="content_div1">
						<div class="main_img_div">
							<img id="main_img"
								src="${sound.a_cover }"
								width="300" height="300">
						</div>
						<div class="content_info  card">
							<div class="card-body">
								<table class="table intro_table">
									<thead>
										<tr>
											<th colspan="2">${sound.s_name}</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>앨범명 :</td>
											<td>${sound.a_name}</td>
										</tr>
										<tr>
											<td>가수명 :</td>
											<td>
												<c:forEach items="${sound.artist_names }" var="singer">
												${singer}&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>작사 :</td>
											<td>
												<c:forEach items="${sound.sound_writers }" var="writer">
												${writer}&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>작곡 :</td>
											<td>
												<c:forEach items="${sound.sound_composers }" var="composer">
												${composer}&nbsp;
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td>좋아요</td>
											<td>
												<div style="text-align:justify">
												${sound.cnt_like }
												<i class="mdi mdi-heart list_icon like_after"></i>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<button type="button" id="select_play" class="btn btn-info btn-fw">선택재생</button>
												<button type="button" class="btn btn-info btn-fw">선택담기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="content_div2">
						<div>
							<h3 class="card-title">가사</h3>

						</div>
						<hr color="white">
						<blockquote class="blockquote">
						<div class="intro_box">
						${sound.s_lyrics1}${sound.s_lyrics2}
						</div>
						</blockquote>
						<div style="text-align:center">
							<button type="button" class="btn btn-outline-light btn-fw btn_more">더보기</button>
						</div>
					</div>
					<div class="content_div3">
						
						
					</div>
					<div class="content_div4">
					
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/chart.js/Chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<!-- End custom js for this page -->
</body>
</html>
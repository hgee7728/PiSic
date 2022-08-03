<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en"
	  xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>PISIC</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/soundList.css">
<link
	href="<%=request.getContextPath()%>/resources/assets/css/reset.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- Layout styles -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/_soundListMini.js"></script>
<style>
.map {
	display: block;
	margin: 0px auto;
}

.artistimg {
	display: grid;
	grid-template-columns: auto auto auto auto;
	grid-gap: 20px;
	margin: 10px;
	place-items: center;
}

.artistRan {
	background-color: #2A3038;
	width: 240px;
	height: 240px;
	padding: 5px;
	border-radius: 5px;
}

img:nth-child(2) {
	grid-column: 1/3;
	grid-row: 1/3;
	width: 400px;
	height: 400px;
	align-self: center;
}

img:nth-child(3) {
	grid-column: 3;
	grid-row: 1;
}

img:nth-child(4) {
	grid-column: 4;
	grid-row: 1;
}

img:nth-child(5) {
	grid-column: 3;
	grid-row: 2;
}

img:nth-child(6) {
	grid-column: 4;
	grid-row: 2;
}
</style>

<style>
.popup-wrap {
	background-color: rgba(0, 0, 0, .3);
	color: black;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: none;
	padding: 15px;
}

.popup {
	width: 100%;
	max-width: 400px;
	border-radius: 10px;
	overflow: hidden;
	background-color: #8f5fe8;
	box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
}

.popup-head {
	width: 100%;
	height: 50px;
	display: flex; /
	align-items: center;
	justify-content: center;
	line-height: 50px;
	color: white;
	font-size: 30px;
}

.popup-body {
	width: 100%;
	background-color: #ffffff;
}

.body-content {
	width: 100%;
	padding: 30px;
}

.body-titlebox {
	text-align: center;
	width: 100%;
	margin-bottom: 10px;
}

.body-contentbox {
	word-break: break-word;
	overflow-y: auto;
	max-height: 1000px;
}

.popup-foot {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #ffffff;
}

.pop-btn.close {
	display: inline-flex;
	width: 15%;
	height: 100%;
	justify-content: center;
	align-items: center;
	float: left;
	color: #ffffff;
	cursor: pointer;
}

.pop-btn.confirm {
	display: inline-flex;
	width: 85%;
	height: 100%;
	justify-content: center;
	align-items: center;
	float: left;
	color: #ffffff;
	cursor: pointer;
	border-right: 1px solid #ffffff;
	font-size: 20px;
}

.popup-footer {
	text-align: right;
}

.close-cookie {
	display: inline-flex; : center;
	cursor: pointer;
	color: #ffffff;
}
.btn_reload{
	color: #ffffff;
	background-color: black;
}
</style>
<style>
table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(2),
table.sound_list  tr > td:nth-child(6),
table.sound_list  tr > td:nth-child(7){
	width: 5%;
}
table.sound_list  tr > td:nth-child(1),
table.sound_list  tr > td:nth-child(6),
table.sound_list  tr > td:nth-child(7){
	text-align:center;
}

.intro_box {
	font-size:14px;
}
.list_icon{
	font-size:30px;
	margin: 0px 5px;
}
table.sound_list a {
	color:#6c7293;
}
a {
  text-decoration: none;
  color: white;
}
</style>
<script>
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
</script>
<script>
const root_path = '<%=request.getContextPath() %>';
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
</script>
</head>
<body>
	<div class="container-scroller">
		<jsp:include page="_sidebar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<jsp:include page="_navbar.jsp" />
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card corona-gradient-card">
								<div class="card-body py-0 px-0 px-sm-3">
									<div class="row align-items-center">
										<div class="col-4 col-sm-3 col-xl-2">
											<img
												src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo.png"
												alt="logo" class="gradient-corona-img img-fluid">
										</div>
										<div class="col-5 col-sm-7 col-xl-8 p-0">
											<h4 class="mb-1 mb-sm-0">Explore Top Music Powered by
												your PISIC</h4>
											<p class="mb-0 font-weight-normal d-none d-sm-block">We
												bring together your favorite music services and join up
												listening, watching and sharing to connect your musical
												world. Below you can visualize, in real-time, the listening
												habits &amp; trends of PISIC's global community. Go Explore.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<h4 class="card-title">PISIC ARTIST</h4>

					<div class="row artistimg">

						<c:forEach items="${artistRandom }" var="artist">
							<img alt="" src="${artist.artist_profile }"
								class="gradient-corona-img card-body artistRan"
								onclick="location.href='<%=request.getContextPath() %>/sound/artistDetail?artist_no=${artist.artist_no }'" style="cursor:pointer">
								
						</c:forEach>

					</div>

					<br>
					<div id="reload">
					<div class=" card-title">
						<h4><button type="button" class="mdi mdi-reload btn_reload" id="btn_reload"></button> 실시간 TOP 10</h4>
					</div>

					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card-body">
							<p>${serverTime}</p>
							<div class="table-responsive">
								<table class="table sound_list">
									<thead>
										<tr>

											<td>순위</td>
											<td></td>
											<td>노래명</td>
											<td>가수명</td>
											<td>앨범명</td>
											<td>듣기</td>
											<td>좋아요</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${chartDetail}" var="sounds">
											<tr>
												<td>${sounds.chart }</td>
												<td><img src="${sounds.a_cover }" alt="image" /></td>
												<td><a
													href="javascript:selectSoundDetail('${sounds.a_no }','${sounds.s_no}')">${sounds.s_name}</a></td>
												<td><c:forEach items="${ sounds.singers}"
														var="singer">
														<a
															href="javascript:selectArtistDetail('${singer.artist_no}')">${singer.artist_name}</a>&nbsp;
												</c:forEach></td>
												<td><a
													href="javascript:selectAlbumDetail('${sounds.a_no }')">${sounds.a_name }</a></td>
												<td><a
													href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-play list_icon" style="color: #8f5fe8;"></i></a></td>
												<td><a
													href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-heart list_icon like_after" style="color: #8f5fe8;"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					</div>
					
					<br>
					<div class="row">
						<div class="col-md-6 corona-gradient-card">
							<h4 class="card-title">ALL TIME SCOROBBLES</h4>
							<!-- TODO mg : total count 등록하기 -->
							<div id="cnt_div">
								<div class="card-body" style="text-align: center;">
									<p class="text-muted mb-0">A live global counter showing the total number of tracks listened to by PISIC users since 2022</p>
								</div>
								<div class="card-body" style="text-align: center;">
									<h1 class="font-weight-blod mb-0 count_h3"><fmt:formatNumber value="${playCnt }" pattern="#,###"/></h1>
								</div>
									
							</div>
		



						</div>
						<div class="col-lg-6 corona-gradient-card">
							<h4 class="card-title">지역별 플레이리스트 보기</h4>
							<div class="card">
								<div class="card-body">
									<img
										src="<%=request.getContextPath()%>/resources/assets/images/main/mapamp.gif"
										alt="" class="img-fluid map" usemap="#map">
									<!-- TODO hg : 클릭 범위 넓히기 -->
									<map name="map" id="map">
										<area shape="rect" coords="283,35,317,91"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=10" alt="도봉구">
										<area shape="rect" coords="260,92,294,108"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=3" alt="강북구">
										<area shape="rect" coords="322,44,362,95"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=9" alt="노원구">
										<area shape="rect" coords="170,110,206,127"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=22" alt="은평구">
										<area shape="rect" coords="260,138,298,154"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=17" alt="성북구">
										<area shape="rect" coords="344,145,382,162"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=25" alt="중랑구">
										<area shape="rect" coords="171,170,220,187"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=14" alt="서대문구">
										<area shape="rect" coords="226,162,262,178"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=23" alt="종로구">
										<area shape="rect" coords="298,163,342,179"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=11" alt="동대문구">
										<area shape="rect" coords="58,185,92,204"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=4" alt="강서구">
										<area shape="rect" coords="150,190,190,207"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=13" alt="마포구">
										<area shape="rect" coords="245,191,272,207"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=24" alt="중구">
										<area shape="rect" coords="289,199,324,215"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=16" alt="성동구">
										<area shape="rect" coords="226,226,261,242"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=21" alt="용산구">
										<area shape="rect" coords="334,211,372,227"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=6" alt="광진구">
										<area shape="rect" coords="393,201,430,217"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=2" alt="강동구">
										<area shape="rect" coords="93,239,133,258"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=19" alt="양천구">
										<area shape="rect" coords="146,237,189,253"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=20" alt="영등포구">
										<area shape="rect" coords="188,260,226,277"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=12" alt="동작구">
										<area shape="rect" coords="250,281,290,298"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=15" alt="서초구">
										<area shape="rect" coords="299,264,336,281"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=1" alt="강남구">
										<area shape="rect" coords="356,251,393,269"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=18" alt="송파구">
										<area shape="rect" coords="85,272,122,290"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=7" alt="구로구">
										<area shape="rect" coords="137,298,175,315"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=8" alt="금천구">
										<area shape="rect" coords="190,306,226,323"
											href="<%=request.getContextPath()%>/pymusic/area?area_code=5" alt="관악구">
									</map>
								</div>

							</div>
						</div>
					</div>

				</div>
				<jsp:include page="_footer.jsp" />
			</div>
		</div>
	</div>
	<div class="container">
		<div class="popup-wrap" id="modal">
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">WELCOME PISIC</span>
				</div>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-titlebox">
							<h4>PISIC 이용권 구매 이벤트</h4>
							<br>
							<h1 style="font-style: italic;">지금 결제하면 누구나 12개월 무료</h1>
							<br>
						</div>
						<div class="body-contentbox">
							<p>PISIC 멤버쉽에 처음 가입하는 구독자는 12개월 무료로 이용 가능합니다. 지금 바로 아래 버튼을 눌러
								구매 페이지로 이동해보세요!!</p>

						</div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn confirm" id="confirm"><a href="<%=request.getContextPath()%>/membership/list">이용권 구매 바로가기</a></span> <span
						class="pop-btn close" id="close"><i class="mdi mdi-close"></i></span>
				</div>
				<div class="popup-footer">
					<span class="pop-btn close-cookie" id="close-cookie"><i
						class="mdi mdi-close"></i>&nbsp;오늘 하루 보지 않기&nbsp;</span>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* Javascript */
		var $layerPopup = document.querySelector('.popup-wrap');
		var $btnLayerPopupClose = document.querySelector('.close');
		var $btnLayerPopupTodayHide = document.querySelector('.close-cookie');
		var $btnReload = document.querySelector('#btn_reload');
		var $btnMembership = document.querySelector('.confirm');
		
		//최초 레이어팝업 노출 (todayCookie라는 이름의 쿠키가 존재하지 않으면 레이어 노출)
		if (!$.cookie('todayCookie')) {
			layerPopupShow();
		}
		
		//레이어팝업 이용권 구매 바로가기 클릭
		$btnMembership.addEventListener('click', function() {
			location.href = '<%=request.getContextPath()%>/membership/list';
		});
		
		//레이어팝업 닫기 버튼 클릭
		$btnLayerPopupClose.addEventListener('click', function() {
			layerPopupHide(0);
		});

		//레이어팝업 오늘 하루 보지 않기 버튼 클릭
		$btnLayerPopupTodayHide.addEventListener('click', function() {
			layerPopupHide(1);
		});

		//레이어팝업 노출
		function layerPopupShow() {
			$layerPopup.style.display = 'flex'
		}
		//레이어팝업 비노출
		function layerPopupHide(state) {
			//닫기버튼 오늘하루보지않기 버튼 무관하계 레이어팝업은 닫는다.
			$layerPopup.style.display = 'none'

			//오늘하루보지않기 버튼을 누른 경우
			if (state === 1) {
				//'todayCookie' 이름의 쿠키가 있는지 체크한다.
				if ($.cookie('todayCookie') == undefined) {
					//쿠키가 없는 경우 todayCookie 쿠키를 추가
					$.cookie('todayCookie', 'Y', {
						expires : 1,
						path : '/'
					});
				}
			}
		}

		/* 실시간 차트 reload */
	
		$(document).on("click", "#btn_reload", function() {
		        $("#reload").load(window.location.href+" #reload ");
		    });
		
		// 카운트를 표시할 요소
		const $counter = document.querySelector(".count_h3");

		// 카운트 보이기 - 테스트
		/* setInterval(function(){
			$.ajax({
				url: root_path + "/sound/countPlayCnt",
				type: "get",
				success: function(result) {
					console.log(result);
					$("#cnt_div h3").text(result);
				}
			}); // ajax 끝
		}, 1000); */
		setInterval(() => {
			$.ajax({
				url: root_path + "/sound/countPlayCnt",
				type: "get",
				success: function(result) {
					// 목표수치
					let max = parseInt(result);
					let now = parseInt(minusComma($("#cnt_div h3").text()));
					console.log("max : "+max);
					console.log("now : "+now);

					counter($counter, max, now);
				}
			}); // ajax 끝
		 }, 3000);
	
	// 3자리 마다 콤마 찍기 함수
	function AddComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	} 
	// 콤마 빼기
	function minusComma(str){
		return str.replace(/,/gi , "");
	}
	
	// 카운트 함수
	function counter($counter, max, now) {
			if(max > now){
				const handle = setInterval(() => {
					$(".count_h3").css("color","red");
					now += 1;
				    $counter.innerHTML = AddComma(now);
				  	
				    // 목표에 도달하면 정지
				    if (now >= max) {
				      clearInterval(handle);
				      $(".count_h3").css("color","white");
				    }
				  
				    
				  }, 30);
			}
		 
		}
	
	</script>

	<script
		src="<%=request.getContextPath()%>/resources/assets/vendors/js/vendor.bundle.base.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/misc.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/settings.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/todolist.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/dashboard.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

</body>
</html>
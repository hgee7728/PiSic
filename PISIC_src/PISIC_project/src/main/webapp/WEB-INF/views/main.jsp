<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PISIC</title>
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

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(7),
	table.sound_list  tr>td:nth-child(8), table.sound_list  tr>td:nth-child(9)
	{
	width: 5%;
}

table.sound_list  tr>td:nth-child(7), table.sound_list  tr>td:nth-child(8),
	table.sound_list  tr>td:nth-child(9) {
	text-align: center;
}
.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}
</style>
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
												src="<%=request.getContextPath()%>/resources/assets/images/PISIC-logo.png" alt="logo"
												class="gradient-corona-img img-fluid">
										</div>
										<div class="col-5 col-sm-7 col-xl-8 p-0">
											<h4 class="mb-1 mb-sm-0">Explore Top Music Powered by
												your PISIC</h4>
											<p class="mb-0 font-weight-normal d-none d-sm-block">We
												bring together your favourite music services and join up
												listening, watching and sharing to connect your musical
												world. Below you can visualise, in real-time, the listening
												habits & trends of PISIC's global community. Go Explore.</p>
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
								class="gradient-corona-img card-body artistRan">
						</c:forEach>

					</div>

					<br>

					<h4 class=" card-title">
						실시간 TOP 10
						<p>
							<i type="button" class="mdi mdi-reload btn_reload"></i>
							<code>${serverTime}</code>
						</p>
					</h4>

					<div class="col-lg-12 grid-margin stretch-card">
						<div class="card-body">

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


										<!-- TODO hg : 순위 for문 돌리기 -->
										<c:forEach items="${ chartTopten}" var="sounds">
											<tr>
												<td>${sounds.chart }</td>
												<td><img src="${sounds.a_cover }" alt="image" /></td>
												<td>${sounds.s_name}</td>
												<td><c:forEach items="${ sounds.singers}" var="singer">
																${singer.artist_name}&nbsp;
																</c:forEach></td>
												<td>${sounds.a_name }</td>
												<td><a
													href="javascript:playOne('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-play list_icon"></i></a></td>
												<td><a
													href="javascript:soundLike('${sounds.a_no }','${sounds.s_no}')"><i
														class="mdi mdi-heart list_icon like_after"></i></a> <!-- <i class="mdi mdi-heart-outline list_icon like_before"></i> -->
												</td>
												
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-6 corona-gradient-card">
							<h4 class="card-title">ALL TIME SCOROBBLES</h4>
							<!-- TODO mg : total count 등록하기 -->


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
											href="http://www.dobong.go.kr/WDB_DEV/MF030301/MF030301search.asp"
											target="_blank" title="새창으로 열립니다." alt="도봉구">
										<area shape="rect" coords="260,92,294,108"
											href="http://www.gangbuk.go.kr/www/contents.do?key=305"
											target="_blank" title="새창으로 열립니다." alt="강북구">
										<area shape="rect" coords="322,44,362,95"
											href="https://www.nowon.kr/www/user/orgnzt/BD_selectOrgnzt.do"
											target="_blank" title="새창으로 열립니다." alt="노원구">
										<area shape="rect" coords="170,110,206,127"
											href="http://www.ep.go.kr/CmsWeb/viewPage.req?idx=PG0000004276"
											target="_blank" title="새창으로 열립니다." alt="은평구">
										<area shape="rect" coords="260,138,298,154"
											href="http://www.sb.go.kr/PageLink.do?link=forward:/sb_new/seongbukgu/organization/organization.do&tempParam1=&menuNo=07000000&subMenuNo=07040000&thirdMenuNo=&fourthMenuNo="
											target="_blank" title="새창으로 열립니다." alt="성북구">
										<area shape="rect" coords="344,145,382,162"
											href="http://www.jungnang.go.kr/portal/bbs/list/B0000389.do?dept=01&menuNo=201180"
											target="_blank" title="새창으로 열립니다." alt="중랑구">
										<area shape="rect" coords="171,170,220,187"
											href="http://www.sdm.go.kr/wesdm/info/organization.do"
											target="_blank" title="새창으로 열립니다." alt="서대문구">
										<area shape="rect" coords="226,162,262,178"
											href="http://www.jongno.go.kr/Main.do?menuId=1917&amp;menuNo=1917"
											target="_blank" title="새창으로 열립니다." alt="종로구">
										<area shape="rect" coords="298,163,342,179"
											href="http://www.ddm.go.kr/ddm/organization.jsp"
											target="_blank" title="새창으로 열립니다." alt="동대문구">
										<area shape="rect" coords="58,185,92,204"
											href="https://www.gangseo.seoul.kr/gs050201" target="_blank"
											title="새창으로 열립니다." alt="강서구">
										<area shape="rect" coords="150,190,190,207"
											href="https://www.mapo.go.kr/site/main/content/mapo040301"
											target="_blank" title="새창으로 열립니다." alt="마포구">
										<area shape="rect" coords="245,191,272,207"
											href="http://www.junggu.seoul.kr/content.do?cmsid=14066"
											target="_blank" title="새창으로 열립니다." alt="중구">
										<area shape="rect" coords="289,199,324,215"
											href="https://www.sd.go.kr/main/selectEmpList.do?key=2015"
											target="_blank" title="새창으로 열립니다." alt="성동구">
										<area shape="rect" coords="226,226,261,242"
											href="https://www.yongsan.go.kr/portal/member/user/orgcht.do?menuNo=200203"
											target="_blank" title="새창으로 열립니다." alt="용산구">
										<area shape="rect" coords="334,211,372,227"
											href="https://www.gwangjin.go.kr/portal/main/contents.do?menuNo=200202"
											target="_blank" title="새창으로 열립니다." alt="광진구">
										<area shape="rect" coords="393,201,430,217"
											href="https://www.gangdong.go.kr/site/contents/koRenew/html03/html00/html00/index01.html"
											target="_blank" title="새창으로 열립니다." alt="강동구">
										<area shape="rect" coords="93,239,133,258"
											href="http://www.yangcheon.go.kr/site/yangcheon/ex/dept/org_map.do"
											target="_blank" title="새창으로 열립니다." alt="양천구">
										<area shape="rect" coords="146,237,189,253"
											href="https://www.ydp.go.kr/www/contents.do?key=2901&"
											target="_blank" title="새창으로 열립니다." alt="영등포구">
										<area shape="rect" coords="188,260,226,277"
											href="http://www.dongjak.go.kr/portal/main/contents.do?menuNo=200655"
											target="_blank" title="새창으로 열립니다." alt="동작구">
										<area shape="rect" coords="250,281,290,298"
											href="http://www.seocho.go.kr/site/seocho/05/10503010100002015062601.jsp"
											target="_blank" title="새창으로 열립니다." alt="서초구">
										<area shape="rect" coords="299,264,336,281"
											href="http://www.gangnam.go.kr/dept/user/find.do?mid=FM040603"
											target="_blank" title="새창으로 열립니다." alt="강남구">
										<area shape="rect" coords="356,251,393,269"
											href="https://www.songpa.go.kr/www/contents.do?key=2355&"
											target="_blank" title="새창으로 열립니다." alt="송파구">
										<area shape="rect" coords="85,272,122,290"
											href="http://www.guro.go.kr/www/selectEmplDeptWebList.do?key=1816&"
											target="_blank" title="새창으로 열립니다." alt="구로구">
										<area shape="rect" coords="137,298,175,315"
											href="http://www.geumcheon.go.kr/program/wooriGC/staffOffice.jsp?menuID=001004003001001"
											target="_blank" title="새창으로 열립니다." alt="금천구">
										<area shape="rect" coords="190,306,226,323"
											href="http://www.gwanak.go.kr/site/gwanak/11/11103010000002016051207.jsp"
											target="_blank" title="새창으로 열립니다." alt="관악구">
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
					<span class="pop-btn confirm" id="confirm">이용권 구매 바로가기</span> <span
						class="pop-btn close" id="close"><i class="mdi mdi-close"></i></span>
				</div>
			</div>
		</div>
	</div>


	<script>
		window.onload = function() {

			document.querySelector('.popup-wrap').style.display = 'flex';

			function closeModal() {
				document.querySelector('.popup-wrap').style.display = 'none';
			}

			document.querySelector('.close').addEventListener('click',
					closeModal);
		};

		document.querySelector(".btn_reload").onclick = function() {
			location.reload();
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

</body>
</html>
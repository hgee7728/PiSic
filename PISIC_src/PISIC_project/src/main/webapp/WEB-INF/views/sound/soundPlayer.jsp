<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- Website Design By: www.happyworm.com -->
<title>PISIC Player</title>
<link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
<%-- <link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/lib/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/jplayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/add-on/jplayer.playlist.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){
	// jPlayer API
	var myPlaylist = new jPlayerPlaylist({
		jPlayer: "#jquery_jplayer_N",
		cssSelectorAncestor: "#jp_container_N"
	}, [
		
	], {
		playlistOptions: {
			enableRemoveControls: true
		},
		swfPath: "../../dist/jplayer",
		supplied: "webmv, ogv, m4v, oga, mp3",
		useStateClassSkin: true,
		autoBlur: false,
		smoothPlayBar: true,
		keyEnabled: true,
		audioFullScreen: true
	});
	
	// JSON 형태로 넘겨 받은 데이터 OBJECT 형태로 변환 
	var sound_data = '${soundList}';
	var obj = JSON.parse(sound_data);
	var sound_obj = JSON.parse(sound_data);
	
	// 받은 노래 데이터로 플레이 리스트 만들기
	for(var i = 0 ; i < sound_obj.length ; i++){
		// jPlayer
		myPlaylist.add({
			title: sound_obj[i].s_name,
			artist: sound_obj[i].artist_name,
			mp3: sound_obj[i].s_path,
			poster: sound_obj[i].a_cover
		});
	};
	// 자동재생 on
	//myPlaylist.option("autoPlay", true);
	
	// 재생 버튼
	$("#playlist-play").click(function() {
		myPlaylist.play();
	});
	// 일시 정지
	$("#playlist-pause").click(function() {
		myPlaylist.pause();
	});
	// 셔플하고 재생
	$("#playlist-shuffle").click(function() {
		myPlaylist.shuffle(true,true);
	});
	// 다음곡 재생
	$("#playlist-next").click(function() {
		myPlaylist.next();
	});
	// 이전 곡 재생
	$("#playlist-previous").click(function() {
		myPlaylist.previous();
	});
	// 일시 정지
	$("#playlist-pause").click(function() {
		myPlaylist.pause();
	});
});
//]]>
</script>
<style>
	img#jp_poster_0{
		width:480px !important;
		height:350px !important;
	}
	div#jquery_jplayer_N{
		width:480px !important;
		height:350px !important;
	}
</style>
</head>
<body>
${soundList }
<div id="jp_container_N" class="jp-video jp-video-270p" role="application" aria-label="media player">
	<div class="jp-type-playlist">
		<div id="jquery_jplayer_N" class="jp-jplayer"></div>
		<div class="jp-gui">
			<div class="jp-video-play">
				<button class="jp-video-play-icon" role="button" tabindex="0">play</button>
			</div>
			<div class="jp-interface">
				<div class="jp-progress">
					<div class="jp-seek-bar">
						<div class="jp-play-bar"></div>
					</div>
				</div>
				<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
				<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
				<div class="jp-controls-holder">
					<div class="jp-controls">
						<button class="jp-previous" role="button" tabindex="0">previous</button>
						<button class="jp-play" role="button" tabindex="0">play</button>
						<button class="jp-next" role="button" tabindex="0">next</button>
						<button class="jp-stop" role="button" tabindex="0">stop</button>
					</div>
					<div class="jp-volume-controls">
						<button class="jp-mute" role="button" tabindex="0">mute</button>
						<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
						<div class="jp-volume-bar">
							<div class="jp-volume-bar-value"></div>
						</div>
					</div>
					<div class="jp-toggles">
						<button class="jp-repeat" role="button" tabindex="0">repeat</button>
						<button class="jp-shuffle" role="button" tabindex="0">shuffle</button>
						<button class="jp-full-screen" role="button" tabindex="0">full screen</button>
					</div>
				</div>
				<div class="jp-details">
					<div class="jp-title" aria-label="title">&nbsp;</div>
				</div>
			</div>
		</div>
		<div class="jp-playlist">
			<ul>
				<!-- The method Playlist.displayPlaylist() uses this unordered list -->
				<li>&nbsp;</li>
			</ul>
		</div>
		<div class="jp-no-solution">
			<span>Update Required</span>
			To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
		</div>
	</div>
</div>
			
			<input type="hidden" name="id" id="sid" value="aaa">
			<button type="button" id="btn">테스트버튼</button>
			<button type="button" id="current_name">현재곡 뭐야</button>
			
</body>

<script type="text/javascript">
console.log(typeof($(".jp-current-time").text()));
console.log($(".jp-current-time").text());
 /* setInterval(function () { 
	console.log(typeof($(".jp-current-time").text()));
	console.log($(".jp-current-time").text());
	
	}, 1000); */
$(function(){
	//var time = '00:03';
	console.log($("#sid").val());
	<%-- setInterval(function () { 
		if( ($(".jp-current-time").text()) == time){
			console.log("3초됐어");
			$.ajax({
				url:"<%=request.getContextPath()%>/sound/insert",
				type:"post",
				data: { id:$("#sid").val()},
				success:function(result){
					console.log(result);
				}
			}); // ajax 끝
		}
	}, 1000) --%>
	
	$("#btn").click(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/sound/test",
			type:"post",
			data: { id:$("#sid").val()},
			success:function(result){
				console.log(result);
			}
		}); // ajax 끝
	});
	
	
	// stop watch 방식
	let timerId;
	let time = 0;
	let timeLimit = 5;
	let initTime = '00:00';
	//const stopwatch = document.getElementById("stopwatch");
	//let  hour, min, sec;
	
	
	function printTime() {
	    time++;
	    //stopwatch.innerText = getTimeFormatString();
	}
	
	//시계 시작
	function startClock() {
		 timer = setInterval(function(){
		        	time++;
		      	}, 1000);
	}
	
	//시계 중지
	function stopClock() {
		clearInterval(timer);
	}
	
	// 시계 초기화
	function resetClock() {
	    stopClock()
	   // stopwatch.innerText = "00:00:00";
	    time = 0;
	}
	
	/* <button class="jp-previous" role="button" tabindex="0">previous</button>
	<button class="jp-play" role="button" tabindex="0">play</button>
	<button class="jp-next" role="button" tabindex="0">next</button>
	<button class="jp-stop" role="button" tabindex="0">stop</button> */
	
	
	
	
	
		console.log("intervalFunction() 실행");
		var interval = setInterval(function () {
			console.log("db다녀오기 대기 시작");
			if(time == timeLimit){
				clearInterval(interval);
				console.log("db 다녀왕~");
			}
		}, 1000)
	
	
	/* setInterval(function () { 
		if( ($(".jp-current-time").text()) == initTime){
			console.log("0초야");
			
		}
		// 클래스 존재여부 - 버튼이 재생상태, 일시정지 상태 확인하고싶어
		if($("#jp_container_N").hasClass("active") === true) {

		// class가 존재함.
			console.log("일시")
		} else {

		// class가 존재하지 않음	

		}
		
	}, 1000) */
	
		
	//클래스 변경 되면 이벤트	
	/* $('#jp_container_N').bind('DOMSubtreeModified', function () {
		  console.log('div 변경됐어!!!');
	}); */ // 재생중에 #jp_container_N 이게 너무 많이 바껴, 전체 제일 큰 div라서..
	
	/* $('#jp_container_N').on('classChange', function() {
		console.log('div 변경됐어!!!');
	}); */
	
	$(".jp-play").click(function() {
		if($("div").hasClass("jp-state-playing") === true) {
			// class가 존재함.
			console.log("일시정지");
			stopClock();
		} else {
			// class가 존재하지 않음	
			console.log("재생");
			startClock();
		}
	});
	
	/* $("#playlist-pause").click(function() {
		console.log("일시정지 버튼");
		stopClock();
	}); */
	
	// 다음곡 재생
	$(".jp-next").click(function() {
		time = 0 ;
		startClock();
		intervalFunction();
	});
	// 이전 곡 재생
	$(".jp-previous").click(function() {
		time = 0 ;
		startClock();
		intervalFunction();
	});
	
	$(".jp-stop").click(function() {
		stopClock();
		time = 0 ;
		
	});
	// 동적으로 생성된 엘리먼트에 이벤트 걸어주기
	/* $(document).on("click", ".jp-state-playing", function() {
		console.log("일시정지 버튼클릭");
	}); */
	
	setInterval(function () {
		console.log("시간 : " + time);
	}, 1000)
	
	$("#current_name").click(function(){
		var name = $(".jp-playlist-current").text();
		console.log(name);
	});
	// 플레이어 아래 리스트 클릭하면 노래 재생됐을때의 경우만 하면돼!!
	// 현재 시간이 00:00 되면 작동되게 하는 방식 생각중 
	
	
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<!-- Website Design By: www.happyworm.com -->
<title>PISIC Player</title>
<link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
<%-- <link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/lib/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/jplayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/add-on/jplayer.playlist.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png" />
<script type="text/javascript">
//<![CDATA[
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';

$(document).ready(function(){
	let msg = '${msg}';
	console.log(msg);
	if(msg){
		alert(msg);
		window.opener.location.replace("<%=request.getContextPath()%>/main");
		self.close();
	} else {
		// jPlayer API
		var myPlaylist = new jPlayerPlaylist({
			jPlayer: "#jquery_jplayer_N",
			cssSelectorAncestor: "#jp_container_N"
		}, [
			
		], {
			playlistOptions: {
				enableRemoveControls: true
				, shuffleTime: 0
			},
			swfPath: "../../dist/jplayer",
			supplied: "webmv, ogv, m4v, oga, mp3",
			useStateClassSkin: true,
			autoBlur: false,
			smoothPlayBar: true,
			keyEnabled: true,
			audioFullScreen: true,
		});
		
		// JSON 형태로 넘겨 받은 데이터 OBJECT 형태로 변환 
		var sound_data = '${soundList}';
		var sound_obj = JSON.parse(sound_data);
		var singerObj = {};
		for (var i = 0 ; i < sound_obj.length ; i ++){
			for(var k = 0 ; k < sound_obj[i].singers.length ; k++){
				singerObj[i] = sound_obj[i].singers[k].artist_name;
			}
		}
		
		// 받은 노래 데이터로 플레이 리스트 만들기
		var html = "";
		for(var i = 0 ; i < sound_obj.length ; i++){
			
			// jPlayer
			myPlaylist.add({
				title: sound_obj[i].s_name,
				artist: singerObj[i],
				mp3: sound_obj[i].s_path,
				poster: sound_obj[i].a_cover,
				s_no : sound_obj[i].s_no
			});
			
			html += '<div id="soundData'+i+'" class="soundDataDiv">';
			html += '<input type="hidden" name="a_no" value="'+sound_obj[i].a_no+'">';
			html += '<input type="hidden" name="s_no" value="'+sound_obj[i].s_no+'">';
			html += '<input type="hidden" name="s_order" value="'+sound_obj[i].s_order+'">';
			html += '</div>';
			$("div.jp-playlist ul li:nth-child("+(i+1)+")").attr('id',(i+1))
		};
		$("body").append(html);
		
		

		// stop watch 방식
		let time = 0;
		let timeLimit = 5;
		let timer;

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
		    time = 0;
		}

		// DB 대기 Interval 함수
		var interval = setInterval(function () {
			console.log("db다녀오기 대기 시작");
			if(time == timeLimit){
				clearInterval(interval);
				console.log("db 다녀왕~");
				goInsertPlayinfo();
			}
		}, 1000)

		// 재생, 일시정지 버튼
		$(".jp-play").click(function() {
			if($("div").hasClass("jp-state-playing") === true) {
				// class가 존재함.
				console.log("일시정지");
				stopClock();
				clearInterval(interval);
			} else {
				// class가 존재하지 않음	
				console.log("재생");
				startClock();
				interval = setInterval(function () {
					console.log("db다녀오기 대기 시작");
					if(time == timeLimit){
						clearInterval(interval);
						console.log("db 다녀왕~");
						goInsertPlayinfo();
					}
				}, 1000)
			}
		});

		// 정지 버튼
		$(".jp-stop").click(function() {
			clearInterval(interval);
			resetClock();
		});
		
		// 다음곡 재생
		$(".jp-next").click(function() {
			if($('li.jp-playlist-current').index() == $('ul li:nth-last-child(1)').index()){
				console.log("다음 곡 없어");
				return;
			}
			clearInterval(interval);
			resetClock();
			startClock();
			interval = setInterval(function () {
				console.log("db다녀오기 대기 시작");
				if(time == timeLimit){
					clearInterval(interval);
					console.log("db 다녀왕~");
					goInsertPlayinfo();
				}
			}, 1000)
		});
		// 이전 곡 재생
		$(".jp-previous").click(function() {
			if($('li.jp-playlist-current').index() == 0){
				console.log("이전 곡 없어");
				return;
			}
			clearInterval(interval);
			resetClock();
			startClock();
			interval = setInterval(function () {
				console.log("db다녀오기 대기 시작");
				if(time == timeLimit){
					clearInterval(interval);
					console.log("db 다녀왕~");
					goInsertPlayinfo();
				}
			}, 1000)
		});
		
		
		
		// 플레이 리스트에 곡을 클릭했을 경우
		$(document).on("click", ".jp-playlist-item", function() {
			clearInterval(interval);
			console.log("노래클릭");
			resetClock()
			startClock();
			interval = setInterval(function () {
				console.log("db다녀오기 대기 시작");
				if(time == timeLimit){
					clearInterval(interval);
					console.log("db 다녀왕~");
					goInsertPlayinfo();
				}
			}, 1000)
		});
		
		// 흐른 시간 보기, 00:00초 되면 타이머 리셋
		setInterval(function () {
			console.log("시간 : " + time);
			
		}, 1000)
		
		// 동적으로 생성된 x 버튼에 기능 추가 - 현재 플레이 리스트 table에서 삭제
		$(document).on("click", ".jp-playlist-item-remove", function() {
			if($(this).closest('li').hasClass("jp-playlist-current") == true){
				console.log("현재 곡 지웠어");
				clearInterval(timer)
				clearInterval(interval);
				time = 0;
			} 
			
			// 비동기 방식으로 현재 플레이 리스트에서 삭제 후 순서 다시 맞추기
			$.ajax({
				url: "<%=request.getContextPath() %>/mymusic/deleteSoundPlaylist0",
				type: "post",
				dataType: "json",
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				data:{
					a_no: $('div#soundData'+$(this).closest('li').index()+'').children("input[name=a_no]").val(),
					s_no: $('div#soundData'+$(this).closest('li').index()+'').children("input[name=s_no]").val(),
					s_order: $('div#soundData'+$(this).closest('li').index()+'').children("input[name=s_order]").val()
				},
				success: function(result) {
					console.log(result);
					if(result.s_no == "0" && result.a_no == "0"){
						alert("리스트에서 삭제에 실패하였습니다. 다시 시도해주세요.");
					} else {
						
						// 해당 곡 리스트에서 삭제 후 다시 순서 부여
						$('div#soundData'+(result.s_order-1)+'').remove();
						$('div.soundDataDiv').each(function(index){
							$(this).attr('id', 'soundData'+index);
							$(this).children('input[name=s_order]').val(index+1);
						});
					}
				},
				error:function(){
					
				}
			}); // ajax 끝
			
		});
		
		// 셔플 기능 작동하면 현재 플레이 리스트 순서 맞추기
		$(".jp-shuffle").click(function(){
			var s_nameArray = [];
			var artist_nameArray = [];
			$('div.jp-playlist ul li div a.jp-playlist-item').each(function(){
				
				// API form에 맞춰서 원하는 데이터 가공
				var totalStr = $(this).text().split('by');
				for(var i in totalStr){
					if(i % 2 == 0){
						s_nameArray.push(totalStr[i].trim());
					} else {
						artist_nameArray.push(totalStr[i].trim());
					}
				}
			});
			
			// 가공된 데이터 가지고 db 변경
			$.ajax({
				url: "<%=request.getContextPath() %>/mymusic/insertPlaylist0Order",
				type: "post",
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				traditional:true,
				data:{
					s_name: s_nameArray,
					artist_name: artist_nameArray
				},
				dataType: "json",
				success: function(result) {
					var re_sound_obj = result;
					var re_singerObj = {};
					for (var i = 0 ; i < re_sound_obj.length ; i ++){
						for(var k = 0 ; k < re_sound_obj[i].singers.length ; k++){
							re_singerObj[i] = re_sound_obj[i].singers[k].artist_name;
						}
					
					}
					
					// 받은 노래 데이터 순서 다시 맞추기
					var html = "";
					for(var i = 0 ; i < re_sound_obj.length ; i++){
						html += '<div id="soundData'+i+'" class="soundDataDiv">';
						html += '<input type="hidden" name="a_no" value="'+re_sound_obj[i].a_no+'">';
						html += '<input type="hidden" name="s_no" value="'+re_sound_obj[i].s_no+'">';
						html += '<input type="hidden" name="s_order" value="'+re_sound_obj[i].s_order+'">';
						html += '</div>';
					};
					$("body div.soundDataDiv").remove();
					$("body").append(html);
						
					
					
				},
				error:function(){
					
				}
			}); // ajax 끝
			
		});
	}
	
	
		    
});


let latitude ="";
let longitude ="";

// 위도 경도 위치값 받아오기
$(document).ready(function() {
	if ("geolocation" in navigator) { /* geolocation 사용 가능 */
		navigator.geolocation.getCurrentPosition(
			function(data) {
				latitude = data.coords.latitude;
				longitude = data.coords.longitude;
			}, function(error) {
				alert(error);
			}, {
				enableHighAccuracy : true,
				timeout : Infinity,
				maximumAge : 0
			}
		);
	} else { /* geolocation 사용 불가능 */
		alert('geolocation 사용 불가능');
	}
});

// 플레이 인포 데이터 삽입
function goInsertPlayinfo(){
	console.log($("li.jp-playlist-current").index());
	$.ajax({
		url: "<%=request.getContextPath() %>/sound/insertPalyInfo",
		type: "post",
		beforeSend: function(xhr){
	        xhr.setRequestHeader(header, token);
	    },
		data:{
			a_no: $('div#soundData'+$("li.jp-playlist-current").index()+'').children("input[name=a_no]").val(),
			s_no: $('div#soundData'+$("li.jp-playlist-current").index()+'').children("input[name=s_no]").val(),
			currentLat: latitude,
			currentLon: longitude
		},
		success: function(result) {
			
		},
		error:function(){
			
		}
	}); // ajax 끝
};
//]]>
</script>

<script>
	/* function delete0(i){
		console.log("제발 되라ㅏㅏㅏㅏㅏㅏ: " + i);
	}
	// player 세팅
	function setPlayer(sound_obj, singerArray){
		for(var i = 0 ; i < sound_obj.length ; i++){
			//$(".jp-type-playlist").attr('id','ididid');
			$("div.jp-playlist ul li:nth-child("+(i+1)+")").attr('id',(i+1))
			$("div.jp-playlist ul li:nth-child("+(i+1)+")").append('<input type="hidden" name="a_no" value="'+sound_obj[i].a_no+'">');
			$("div.jp-playlist ul li:nth-child("+(i+1)+")").append('<input type="hidden" name="s_no" value="'+sound_obj[i].s_no+'">');
		}; 
	}
	 */
	
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
</body>


</html>
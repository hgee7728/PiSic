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
		audioFullScreen: true,
		//ready: setPlayer(sound_obj, singerArray)
	});
	// JSON 형태로 넘겨 받은 데이터 OBJECT 형태로 변환 
	var sound_data = '${soundList}';
	var obj = JSON.parse(sound_data);
	var sound_obj = JSON.parse(sound_data);
	console.log("sound_data : " + sound_data);
	console.log("sound_obj[1].singers.length : " + sound_obj[1].singers.length);
	console.log("sound_obj[2].singers.length : " + sound_obj[2].singers.length);
	console.log("sound_obj[1].singers : " + sound_obj[1].singers[0].artist_name);
	console.log("sound_obj[2].singers : " + sound_obj[2].singers[0].artist_name);
	var singerArray = [];
	for (var i = 0 ; i < sound_obj.length ; i ++){
		for(var k = 0 ; k < sound_obj[i].singers.length ; k++){
			console.log("sound_obj[i].singers[k].artist_name :" + sound_obj[i].singers[k].artist_name);
			singerArray.push(sound_obj[i].singers[k].artist_name);
		}
	}
	console.log("singerArray: "+singerArray);
	var a_noArray = [];
	var s_noArray = [];
	// 받은 노래 데이터로 플레이 리스트 만들기
	var html = "";
	for(var i = 0 ; i < sound_obj.length ; i++){
		// jPlayer
		myPlaylist.add({
			title: sound_obj[i].s_name,
			artist: singerArray[i],
			mp3: sound_obj[i].s_path,
			poster: sound_obj[i].a_cover
		});
		html += '<div id="soundData'+i+'" class="soundDataDiv">';
		html += '<input type="hidden" name="a_no" value="'+sound_obj[i].a_no+'">';
		html += '<input type="hidden" name="s_no" value="'+sound_obj[i].s_no+'">';
		html += '</div>';
		//$(".jp-type-playlist").attr('id','ididid');
		/* $("div.jp-playlist ul li:nth-child("+(i+1)+")").attr('id',(i+1))
		a_noArray.push('<div><input type="hidden" name="a_no" value="'+sound_obj[i].a_no+'"></div>');
		s_noArray.push('<div><input type="hidden" name="s_no" value="'+sound_obj[i].s_no+'"></div>');
		$("div.jp-playlist ul li:nth-child("+(i+1)+")").append('<input type="hidden" name="a_no" value="'+sound_obj[i].a_no+'">');
		$("div.jp-playlist ul li:nth-child("+(i+1)+")").append('<input type="hidden" name="s_no" value="'+sound_obj[i].s_no+'">'); */
	};
	$("body").append(html);
	
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
	
	opener.location.reload();
	
	// 동적으로 생성된 x 버튼에 기능 추가 - 현재 플레이 리스트에서 삭제
	$(document).on("click", ".jp-playlist-item-remove", function() {
	    //alert("현재 플레이 리스트에서 삭제 했습니다.");
	   // alert("x 누른 곡 인덱스 : "+$(this).closest('li').index());
	    //alert("현재곡 인덱스 : " + $(".jp-playlist-current").closest('li').index());
	    alert("누른곡의 div : " + $('div#soundData'+$(this).closest('li').index()+''));
	    $.ajax({
			url: "<%=request.getContextPath() %>/mymusic/deleteSoundPlaylist0",
			type: "post",
			data:{
				a_no: $('div#soundData'+$(this).closest('li').index()+'').children("input[name=a_no]").val(),
				s_no: $('div#soundData'+$(this).closest('li').index()+'').children("input[name=s_no]").val()
			},
			success: function(result) {
				if(result == "-1"){
					alert("로그인 후 이용해 주세요.");
				} else if(result == "0"){
					alert("실패하였습니다. 다시 시도해주세요.");
				} else if(result == "1"){
					alert("해당 곡을 플레이 리스트에서 삭제했습니다.");
					// 해당 곡 리스트에서 삭제 후 다시 순서 부여
					$('div.soundData'+$(this).closest('li').index()+'').remove();
					$('div.soundDataDiv').each(function(index){
						$(this).attr('id', index);
					});
					
				}
			},
			error:function(){
				
			}
		}); // ajax 끝
	});
	
	
	/* $(document).find("div.jp-playlist ul li").each(function(){
		console.log("id값 : "+$(this).closest('li').attr('id'));
		$(this).children().children('a.jp-playlist-item-remove').attr('href','javascript:delete0('+$(this).closest('li').attr('id')+')');
	}); */
	
	/* $("#jquery_jplayer_N").on($.jPlayer.event.ready, function(event) { 
        console.log("[[[[[[[[[준비완료]]]]]]]]]");
	}); */
	/* $("#jquery_jplayer_N").jPlayer({
	    ready: function () {
	    			console.log("[[[[[[[[[준비완료]]]]]]]]]");
	        	}
		}); */
		    
});
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
$(function(){
	// stop watch 방식
	let timerId;
	let time = 0;
	let timeLimit = 5;
	let initTime = '00:00';

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

		console.log("intervalFunction() 실행");
		var interval = setInterval(function () {
			console.log("db다녀오기 대기 시작");
			if(time == timeLimit){
				clearInterval(interval);
				console.log("db 다녀왕~");
			}
		}, 1000)

	// 재생, 일시정지 버튼
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

	// 다음곡 재생
	$(".jp-next").click(function() {
		clearInterval(interval);
		resetClock()
		startClock();
		interval = setInterval(function () {
			console.log("db다녀오기 대기 시작");
			if(time == timeLimit){
				clearInterval(interval);
				console.log("db 다녀왕~");
			}
		}, 1000)
	});
	// 이전 곡 재생
	$(".jp-previous").click(function() {
		clearInterval(interval);
		resetClock()
		startClock();
		interval = setInterval(function () {
			console.log("db다녀오기 대기 시작");
			if(time == timeLimit){
				clearInterval(interval);
				console.log("db 다녀왕~");
			}
		}, 1000)
	});
	
	// 정지 버튼
	$(".jp-stop").click(function() {
		stopClock();
		time = 0 ;
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
			}
		}, 1000)
	});
	
	// 흐른 시간 보기
	setInterval(function () {
		console.log("시간 : " + time);
	}, 1000)
});

function goInsertPlayinfo(){
	
};
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<!-- Website Design By: www.happyworm.com -->
<title>Demo : The jPlayerPlaylist Object</title>
<link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/pink.flag/css/jplayer.pink.flag.min.css" rel="stylesheet" type="text/css" />
<%-- <link href="<%=request.getContextPath() %>/resources/jPlayer/dist/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/lib/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/jplayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jPlayer/dist/add-on/jplayer.playlist.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){

	var myPlaylist = new jPlayerPlaylist({
		jPlayer: "#jquery_jplayer_N",
		cssSelectorAncestor: "#jp_container_N"
	}, [
		{
			title:"Cro Magnon Man",
			artist:"The Stark Palace",
			mp3:"http://res.cloudinary.com/dj5umvpkd/video/upload/v1654026634/upload/Play%20Dead%20-%20NEFFEX.mp3",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		},
		{
			title:"Your Face",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		},
		{
			title:"Hidden",
			artist:"Miaow",
			free: true,
			mp3:"http://res.cloudinary.com/dj5umvpkd/video/upload/v1654026634/upload/Play%20Dead%20-%20NEFFEX.mp3",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		},
		{
			title:"Cyber Sonnet",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		},
		{
			title:"Tempered Song",
			artist:"Miaow",
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		},
		{
			title:"Lentement",
			artist:"Miaow",
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-03-Lentement.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		}
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


	// Audio mix playlist

	$("#playlist-setPlaylist-audio-mix").click(function() {
		myPlaylist.setPlaylist([
			{
				title:"Cro Magnon Man",
				artist:"The Stark Palace",
				mp3:"http://res.cloudinary.com/dj5umvpkd/video/upload/v1654026634/upload/Play%20Dead%20-%20NEFFEX.mp3",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Your Face",
				artist:"The Stark Palace",
				mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
				oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Hidden",
				artist:"Miaow",
				free: true,
				mp3:"http://res.cloudinary.com/dj5umvpkd/video/upload/v1654026634/upload/Play%20Dead%20-%20NEFFEX.mp3",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			},
			{
				title:"Cyber Sonnet",
				artist:"The Stark Palace",
				mp3:"http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
				oga:"http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Tempered Song",
				artist:"Miaow",
				mp3:"http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			},
			{
				title:"Lentement",
				artist:"Miaow",
				mp3:"http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-03-Lentement.ogg",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			}
		]);
	});

	// Video mix playlist

	/* $("#playlist-setPlaylist-video-mix").click(function() {
		myPlaylist.setPlaylist([
			{
				title:"Big Buck Bunny Trailer",
				artist:"Blender Foundation",
				m4v:"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v",
				ogv:"http://www.jplayer.org/video/ogv/Big_Buck_Bunny_Trailer.ogv",
				webmv: "http://www.jplayer.org/video/webm/Big_Buck_Bunny_Trailer.webm",
				poster:"http://www.jplayer.org/video/poster/Big_Buck_Bunny_Trailer_480x270.png"
			},
			{
				title:"Finding Nemo Teaser",
				artist:"Pixar",
				m4v: "http://www.jplayer.org/video/m4v/Finding_Nemo_Teaser.m4v",
				ogv: "http://www.jplayer.org/video/ogv/Finding_Nemo_Teaser.ogv",
				webmv: "http://www.jplayer.org/video/webm/Finding_Nemo_Teaser.webm",
				poster: "http://www.jplayer.org/video/poster/Finding_Nemo_Teaser_640x352.png"
			},
			{
				title:"Incredibles Teaser",
				artist:"Pixar",
				m4v: "http://www.jplayer.org/video/m4v/Incredibles_Teaser.m4v",
				ogv: "http://www.jplayer.org/video/ogv/Incredibles_Teaser.ogv",
				webmv: "http://www.jplayer.org/video/webm/Incredibles_Teaser.webm",
				poster: "http://www.jplayer.org/video/poster/Incredibles_Teaser_640x272.png"
			}
		]);
	}); */

	// Media mix playlist

	/* $("#playlist-setPlaylist-media-mix").click(function() {
		myPlaylist.setPlaylist([
			{
				title:"Cro Magnon Man",
				artist:"The Stark Palace",
				mp3:"http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3",
				oga:"http://www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Your Face",
				artist:"The Stark Palace",
				mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
				oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Hidden",
				artist:"Miaow",
				free: true,
				mp3:"http://www.jplayer.org/audio/mp3/Miaow-02-Hidden.mp3",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			},
			{
				title:"Big Buck Bunny Trailer",
				artist:"Blender Foundation",
				m4v:"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v",
				ogv:"http://www.jplayer.org/video/ogv/Big_Buck_Bunny_Trailer.ogv",
				webmv: "http://www.jplayer.org/video/webm/Big_Buck_Bunny_Trailer.webm",
				poster:"http://www.jplayer.org/video/poster/Big_Buck_Bunny_Trailer_480x270.png"
			},
			{
				title:"Finding Nemo Teaser",
				artist:"Pixar",
				m4v: "http://www.jplayer.org/video/m4v/Finding_Nemo_Teaser.m4v",
				ogv: "http://www.jplayer.org/video/ogv/Finding_Nemo_Teaser.ogv",
				webmv: "http://www.jplayer.org/video/webm/Finding_Nemo_Teaser.webm",
				poster: "http://www.jplayer.org/video/poster/Finding_Nemo_Teaser_640x352.png"
			},
			{
				title:"Cyber Sonnet",
				artist:"The Stark Palace",
				mp3:"http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
				oga:"http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg",
				poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
			},
			{
				title:"Incredibles Teaser",
				artist:"Pixar",
				m4v: "http://www.jplayer.org/video/m4v/Incredibles_Teaser.m4v",
				ogv: "http://www.jplayer.org/video/ogv/Incredibles_Teaser.ogv",
				webmv: "http://www.jplayer.org/video/webm/Incredibles_Teaser.webm",
				poster: "http://www.jplayer.org/video/poster/Incredibles_Teaser_640x272.png"
			},
			{
				title:"Tempered Song",
				artist:"Miaow",
				mp3:"http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			},
			{
				title:"Lentement",
				artist:"Miaow",
				mp3:"http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
				oga:"http://www.jplayer.org/audio/ogg/Miaow-03-Lentement.ogg",
				poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
			}
		]);
	}); */

	// Miaow tracks

	$("#playlist-add-bubble").click(function() {
		myPlaylist.add({
			title:"Bubble",
			artist:"Miaow",
			free:true,
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-07-Bubble.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		});
	});

	$("#playlist-add-hidden").click(function() {
		myPlaylist.add({
			title:"Hidden",
			artist:"Miaow",
			free: true,
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-02-Hidden.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		});
	});

	$("#playlist-add-tempered-song").click(function() {
		myPlaylist.add({
			title:"Tempered Song",
			artist:"Miaow",
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-01-Tempered-song.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-01-Tempered-song.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		});
	});

	$("#playlist-add-lentement").click(function() {
		myPlaylist.add({
			title:"Lentement",
			artist:"Miaow",
			mp3:"http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
			oga:"http://www.jplayer.org/audio/ogg/Miaow-03-Lentement.ogg",
			poster: "http://www.jplayer.org/audio/poster/Miaow_640x360.png"
		});
	});

	// The Stark Palace tracks

	$("#playlist-add-cro-magnon-man").click(function() {
		myPlaylist.add({
			title:"Cro Magnon Man",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		});
	});

	$("#playlist-add-your-face").click(function() {
		myPlaylist.add({
			title:"Your Face",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		});
	});

	$("#playlist-add-cyber-sonnet").click(function() {
		myPlaylist.add({
			title:"Cyber Sonnet",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-07-Cybersonnet.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-07-Cybersonnet.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		});
	});

	// Videos

	/* $("#playlist-add-big-buck-bunny").click(function() {
		myPlaylist.add({
			title:"Big Buck Bunny Trailer",
			artist:"Blender Foundation",
			m4v:"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v",
			ogv:"http://www.jplayer.org/video/ogv/Big_Buck_Bunny_Trailer.ogv",
			webmv: "http://www.jplayer.org/video/webm/Big_Buck_Bunny_Trailer.webm",
			poster:"http://www.jplayer.org/video/poster/Big_Buck_Bunny_Trailer_480x270.png"
		});
	});

	$("#playlist-add-finding-nemo").click(function() {
		myPlaylist.add({
			title:"Finding Nemo Teaser",
			artist:"Pixar",
			m4v: "http://www.jplayer.org/video/m4v/Finding_Nemo_Teaser.m4v",
			ogv: "http://www.jplayer.org/video/ogv/Finding_Nemo_Teaser.ogv",
			webmv: "http://www.jplayer.org/video/webm/Finding_Nemo_Teaser.webm",
			poster: "http://www.jplayer.org/video/poster/Finding_Nemo_Teaser_640x352.png"
		});
	});

	$("#playlist-add-incredibles").click(function() {
		myPlaylist.add({
			title:"Incredibles Teaser",
			artist:"Pixar",
			m4v: "http://www.jplayer.org/video/m4v/Incredibles_Teaser.m4v",
			ogv: "http://www.jplayer.org/video/ogv/Incredibles_Teaser.ogv",
			webmv: "http://www.jplayer.org/video/webm/Incredibles_Teaser.webm",
			poster: "http://www.jplayer.org/video/poster/Incredibles_Teaser_640x272.png"
		});
	}); */

	// 플레이 리스트 선택 지우기
	
	//모두 지우기
	$("#playlist-remove").click(function() {
		myPlaylist.remove();
	});
	// 맨 뒤에서 2번째 지우기
	$("#playlist-remove--2").click(function() {
		myPlaylist.remove(-2);
	});
	// 맨 뒤에꺼 지우기
	$("#playlist-remove--1").click(function() {
		myPlaylist.remove(-1);
	});
	// 현재 재생곡 지우기
	$("#playlist-remove-0").click(function() {
		myPlaylist.remove(0);
	});
	// 다음 곡 지우기
	$("#playlist-remove-1").click(function() {
		myPlaylist.remove(1);
	});
	// 다다음곡 지우기
	$("#playlist-remove-2").click(function() {
		myPlaylist.remove(2);
	});

	// 셔플, 기본값 true
	$("#playlist-shuffle").click(function() {
		myPlaylist.shuffle();
	});
	// 섞인 경우, 다시 섞지 않아
	$("#playlist-shuffle-false").click(function() {
		myPlaylist.shuffle(false);
	});
	// 셔플, 셔플하고 재생 true,true
	$("#playlist-shuffle-true").click(function() {
		//myPlaylist.shuffle(true);
		myPlaylist.shuffle(true,true);
	});

	// 곡 선택
	// 맨 뒤에서 2번째 곡
	$("#playlist-select--2").click(function() {
		myPlaylist.select(-2);
	});
	// 맨 뒤에 곡
	$("#playlist-select--1").click(function() {
		myPlaylist.select(-1);
	});
	// 현재곡
	$("#playlist-select-0").click(function() {
		myPlaylist.select(0);
	});
	// 다음곡
	$("#playlist-select-1").click(function() {
		myPlaylist.select(1);
	});
	// 다다음곡
	$("#playlist-select-2").click(function() {
		myPlaylist.select(2);
	});

	
	// 다음곡 재생
	$("#playlist-next").click(function() {
		myPlaylist.next();
	});
	// 이전 곡 재생
	$("#playlist-previous").click(function() {
		myPlaylist.previous();
	});

	// 곡 선택 후 재생
	// 그냥 재생 버튼
	$("#playlist-play").click(function() {
		myPlaylist.play();
	});
	// 맨 뒤에서 2번째 재생
	$("#playlist-play--2").click(function() {
		myPlaylist.play(-2);
	});
	// 맨 뒤 재생
	$("#playlist-play--1").click(function() {
		myPlaylist.play(-1);
	});
	// 첫번째 곡 재생
	$("#playlist-play-0").click(function() {
		myPlaylist.play(0);
	});
	// 2번째 곡 재생
	$("#playlist-play-1").click(function() {
		myPlaylist.play(1);
	});
	// 3번째 곡 재생
	$("#playlist-play-2").click(function() {
		myPlaylist.play(2);
	});

	// 일시 정지

	$("#playlist-pause").click(function() {
		myPlaylist.pause();
	});

	
	// 옵션들

	// 자동재생, 기본값 false
	// 자동재생 on
	$("#playlist-option-autoPlay-true").click(function() {
		myPlaylist.option("autoPlay", true);
	});
	// 자동재생 off
	$("#playlist-option-autoPlay-false").click(function() {
		myPlaylist.option("autoPlay", false);
	});

	// Option: enableRemoveControls

	$("#playlist-option-enableRemoveControls-true").click(function() {
		myPlaylist.option("enableRemoveControls", true);
	});
	$("#playlist-option-enableRemoveControls-false").click(function() {
		myPlaylist.option("enableRemoveControls", false);
	});

	// 새로운 재생목록이 생성되면 애니메이션 속도
	$("#playlist-option-displayTime-0").click(function() {
		myPlaylist.option("displayTime", 0);
	});
	$("#playlist-option-displayTime-fast").click(function() {
		myPlaylist.option("displayTime", "fast");
	});
	$("#playlist-option-displayTime-slow").click(function() {
		myPlaylist.option("displayTime", "slow");
	});
	$("#playlist-option-displayTime-2000").click(function() {
		myPlaylist.option("displayTime", 2000);
	});

	// 새로운 재생목록이 추가되면 애니메이션 속도
	$("#playlist-option-addTime-0").click(function() {
		myPlaylist.option("addTime", 0);
	});
	$("#playlist-option-addTime-fast").click(function() {
		myPlaylist.option("addTime", "fast");
	});
	$("#playlist-option-addTime-slow").click(function() {
		myPlaylist.option("addTime", "slow");
	});
	$("#playlist-option-addTime-2000").click(function() {
		myPlaylist.option("addTime", 2000);
	});

	// 재생목록 지우는 애니메이션 속도
	$("#playlist-option-removeTime-0").click(function() {
		myPlaylist.option("removeTime", 0);
	});
	$("#playlist-option-removeTime-fast").click(function() {
		myPlaylist.option("removeTime", "fast");
	});
	$("#playlist-option-removeTime-slow").click(function() {
		myPlaylist.option("removeTime", "slow");
	});
	$("#playlist-option-removeTime-2000").click(function() {
		myPlaylist.option("removeTime", 2000);
	});

	// 셔플 누르면 애니메이션 속도
	$("#playlist-option-shuffleTime-0").click(function() {
		myPlaylist.option("shuffleTime", 0);
	});
	$("#playlist-option-shuffleTime-fast").click(function() {
		myPlaylist.option("shuffleTime", "fast");
	});
	$("#playlist-option-shuffleTime-slow").click(function() {
		myPlaylist.option("shuffleTime", "slow");
	});
	$("#playlist-option-shuffleTime-2000").click(function() {
		myPlaylist.option("shuffleTime", 2000);
	});

	// 새로운 곡이 추가되면 바로 재생하는 똑같은 코드 2개
	$("#playlist-equivalent-1-a").click(function() {
		myPlaylist.add({
			title:"Your Face",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		}, true);
	});

	$("#playlist-equivalent-1-b").click(function() {
		myPlaylist.add({
			title:"Your Face",
			artist:"The Stark Palace",
			mp3:"http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
			oga:"http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
			poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
		});
		myPlaylist.play(-1);
	});

});
//]]>
</script>
</head>
<body>
[[${mk }]]
<c:forEach items="${ck }" var="i">
[[${i }]]
</c:forEach>

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
			<p style="margin-top:1em;">
				<code>setPlaylist( <a href="javascript:;" id="playlist-setPlaylist-audio-mix">[Audio Mix]</a> | <a href="javascript:;" id="playlist-setPlaylist-video-mix">[Video Mix]</a> | <a href="javascript:;" id="playlist-setPlaylist-media-mix">[Media Mix]</a> )</code><br />

				Miaow audio: <code>추가( <a href="javascript:;" id="playlist-add-bubble">{Bubble}</a> | <a href="javascript:;" id="playlist-add-hidden">{Hidden}</a> | <a href="javascript:;" id="playlist-add-tempered-song">{Tempered Song}</a> | <a href="javascript:;" id="playlist-add-lentement">{Lentement}</a> )</code><br />
				The Stark Palace audio: <code>추가( <a href="javascript:;" id="playlist-add-cro-magnon-man">{Cro Magnon Man}</a> | <a href="javascript:;" id="playlist-add-your-face">{Your Face}</a> | <a href="javascript:;" id="playlist-add-cyber-sonnet">{Cyber Sonnet}</a> )</code><br />
				Various video: <code>추가( <a href="javascript:;" id="playlist-add-big-buck-bunny">{Big Buck Bunny}</a> | <a href="javascript:;" id="playlist-add-incredibles">{Incredibles}</a> | <a href="javascript:;" id="playlist-add-finding-nemo">{Finding Nemo}</a> )</code><br />

				<code><a href="javascript:;" id="playlist-remove">remove</a>(  <a href="javascript:;" id="playlist-remove--2">-2</a> | <a href="javascript:;" id="playlist-remove--1">-1</a> | <a href="javascript:;" id="playlist-remove-0">0</a> | <a href="javascript:;" id="playlist-remove-1">1</a> | <a href="javascript:;" id="playlist-remove-2">2</a> )</code>
				| <code><a href="javascript:;" id="playlist-shuffle">shuffle</a>( <a href="javascript:;" id="playlist-shuffle-false">false</a> | <a href="javascript:;" id="playlist-shuffle-true">true</a> )</code><br />

				<code>select( <a href="javascript:;" id="playlist-select--2">-2</a> | <a href="javascript:;" id="playlist-select--1">-1</a> | <a href="javascript:;" id="playlist-select-0">0</a> | <a href="javascript:;" id="playlist-select-1">1</a> | <a href="javascript:;" id="playlist-select-2">2</a> )</code>
				| <code><a href="javascript:;" id="playlist-next">next</a>()</code> | <code><a href="javascript:;" id="playlist-previous">previous</a>()</code><br />

				<code><a href="javascript:;" id="playlist-play">play</a>( <a href="javascript:;" id="playlist-play--2">-2</a> | <a href="javascript:;" id="playlist-play--1">-1</a> | <a href="javascript:;" id="playlist-play-0">0</a> | <a href="javascript:;" id="playlist-play-1">1</a> | <a href="javascript:;" id="playlist-play-2">2</a> )</code>
				| <code><a href="javascript:;" id="playlist-pause">pause</a>()</code><br />

				<code>옵션( "자동재생", <a href="javascript:;" id="playlist-option-autoPlay-false">false</a> | <a href="javascript:;" id="playlist-option-autoPlay-true">true</a> )</code> Default: false<br />
				<code>옵션( "enableRemoveControls", <a href="javascript:;" id="playlist-option-enableRemoveControls-false">false</a> | <a href="javascript:;" id="playlist-option-enableRemoveControls-true">true</a> )</code> Default: false<br />
				<code>옵션( "리스트 불러올때 애니메이션 속도", <a href="javascript:;" id="playlist-option-displayTime-0">0</a> | <a href="javascript:;" id="playlist-option-displayTime-fast">'fast'</a> | <a href="javascript:;" id="playlist-option-displayTime-slow">'slow'</a> | <a href="javascript:;" id="playlist-option-displayTime-2000">2000</a> )</code> Default: 'slow'<br />
				<code>옵션( "곡 추가 할때 애니메이션 속도", <a href="javascript:;" id="playlist-option-addTime-0">0</a> | <a href="javascript:;" id="playlist-option-addTime-fast">'fast'</a> | <a href="javascript:;" id="playlist-option-addTime-slow">'slow'</a> | <a href="javascript:;" id="playlist-option-addTime-2000">2000</a> )</code> Default: 'fast'<br />
				<code>옵션( "곡 제거 할때 애니메이션 속도", <a href="javascript:;" id="playlist-option-removeTime-0">0</a> | <a href="javascript:;" id="playlist-option-removeTime-fast">'fast'</a> | <a href="javascript:;" id="playlist-option-removeTime-slow">'slow'</a> | <a href="javascript:;" id="playlist-option-removeTime-2000">2000</a> )</code> Default: 'fast'<br />
				<code>옵션( "셔플 할때 애니메이션 속도", <a href="javascript:;" id="playlist-option-shuffleTime-0">0</a> | <a href="javascript:;" id="playlist-option-shuffleTime-fast">'fast'</a> | <a href="javascript:;" id="playlist-option-shuffleTime-slow">'slow'</a> | <a href="javascript:;" id="playlist-option-shuffleTime-2000">2000</a> )</code> Default: 'slow'

			</p>
			<!-- <p>
				Equivalent Effect: <code><a href="javascript:;" id="playlist-equivalent-1-a">add(Your Face, true)</a></code> == <code><a href="javascript:;" id="playlist-equivalent-1-b">add(Your Face) then play(-1)</a></code>
			</p> -->
			<!-- <p>
				Avoid code like: <code><a href="javascript:;" id="playlist-avoid-1">remove(2) then remove(3)</a></code><br />
				Because the second command will only work if the remove animation time, <code class="prettyprint">removeTime</code>, is zero.
				Even then, it will look like it removes the 3rd and 5th items from the original playlist before both commands executed.
				This is because the <code class="prettyprint">remove(2)</code> removes the 3rd item and then <code class="prettyprint">remove(3)</code> removes the 4th item, which was the 5th item before the 3rd item was removed.
				To remove the 3rd and 4th items, you'd use <code class="prettyprint">remove(2)</code> and then <code class="prettyprint">remove(2)</code> again.
				The <code class="prettyprint">remove()</code> method returns a <code class="prettyprint">true</code> when successful, a <code class="prettyprint">false</code> when ignored, which allows you to know whether it worked or not.
			</p> -->
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
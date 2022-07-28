<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta name="_csrf" th:content="${_csrf.token}">
<title>Update Playlist</title>
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
<script
	src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.content_div1 {
	display: flex;
	margin: 30px 0px 30px 0px;
}

.main_img_div {
	margin-right: 20px;
}

.img_btn {
	text-align: center;
	margin: 10px 0px;
}

.radio_div {
	margin: 0px 10px;
}

.content_info.card {
	position: relative;
	top: 50px;
	height: 200px;
}

.content_div2 {
	clear: both;
	margin: 30px 0px;
}

.select_op {
	color: white;
}

.grid-2 {
	flex: 0 0 50%;
	max-width: 50%;
}

.sound_list_div {
	flex-wrap: nowrap;
}

.sound_select_btn {
	margin-top: 20px;
	display: flex;
}

table.left_sound_list a, table.right_sound_list a {
	color: #6c7293;
}

.list_icon {
	font-size: 30px;
	margin: 0px 5px;
}
div.table-responsive{
	height:730px;
	overflow: auto;
}

table.sound_list  tr>td:nth-child(1), table.sound_list  tr>td:nth-child(2),
	table.sound_list  tr>td:nth-child(3), table.sound_list  tr>td:nth-child(6)
	{
	width: 9%;
}
table.sound_list  tr>td:nth-child(4) {
	width: 45%;
}


table.sound_list  tr>td:nth-child(2), table.sound_list  tr>td:nth-child(6)
	{
	text-align: center;
}
div.sound_select_btn input[name=keyword] {
	width:200px;
	margin-left:20px;
}
#recent_sound, #often_sound, #like_sound{
	margin-right:15px;
}
#myplaylist_select{
	width:500px;
	color:white;
}
</style>
<script>
UPLOADCARE_LOCALE = "ko"
	UPLOADCARE_LOCALE_TRANSLATIONS = {
		buttons : {
			choose : {
				files : {
					one : '사진 변경'
				}
			}
		}
	}
let header = $("meta[name='_csrf_header']").attr('th:content');
let token = $("meta[name='_csrf']").attr('th:content');
let csrf_parameterName = '${_csrf.parameterName }';
let csrf_token = '${_csrf.token }';
	$(function() {
		
		// 사진 등록하면 미리보기 + input-hidden에 값 넣기
		var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]');
		singleWidget.onUploadComplete(function(info) {
			console.log(info.cdnUrl);
			var fileUrl = info.cdnUrl;
			$("#main_img").attr("src", fileUrl);
			$('input[name=l_image]').val(fileUrl);

		});
		
		// 플레이 리스트 선택시 해당 목록 불러오기 - select-option
		$("#myplaylist_select").change(function(){
			console.log("변했당");
			console.log($("#myplaylist_select").val());
			$.ajax({
				url: "<%=request.getContextPath()%>/mymusic/playlistSound",
				type: "post",
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				data:{
					l_no:$("#myplaylist_select").val()
				},
				dataType: 'json',
				success: function(result) {
					$(".left_title").text($("#myplaylist_select option:selected").text());
					console.log(result);
					var html = "";
					for(var i = 0; i < result.length; i++){
						var resultData = result[i];
						html += '<tr>';
						html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
						html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
						html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
						html += '<td>'+(i+1)+'</td>';
						html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
						html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
						html += '<td>';
							for(var j = 0 ; j < resultData.singers.length ; j ++){
								var resultData2 = resultData.singers[j]
								html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
								html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
							}
						html += '</td>';
						html += '<td><a href="javascript:soundPlus('+(i+1)+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
						html += '</tr>';
						
					
					}
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
				},
			}); // ajax 끝
		});
		
		// 최근 들은 곡 리스트 불러오기
		$("#recent_sound").click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/mymusic/soundRecent",
				type: "post",
				dataType: 'json',
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success: function(result) {
					$(".left_title").text("최근 들은 곡");
					console.log(result);
					var html = "";
					if(result.length > 0){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr>';
							html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
							html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
							html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
							html += '<td>'+(i+1)+'</td>';
							html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
							html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
							html += '<td>';
								for(var j = 0 ; j < resultData.singers.length ; j ++){
									var resultData2 = resultData.singers[j]
									html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
									html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
								}
							html += '</td>';
							html += '<td><a href="javascript:soundPlus('+(i+1)+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
							html += '</tr>';
							
						
						}
					} else {
						html += '	<tr>   											';
						html += '		<td colspan="6" style="text-align:center;"> <h6 class="card-title">최근 들은 곡이 없습니다. </h6> </td>			';
						html += '	</tr>											';
					}
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
				},
			}); // ajax 끝
		});
		
		// 자주 들은 곡 리스트 불러오기
		$("#often_sound").click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/mymusic/soundOften",
				type: "post",
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				dataType: 'json',
				success: function(result) {
					$(".left_title").text("자주 들은 곡");
					console.log(result);
					var html = "";
					if(result.length > 0){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr>';
							html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
							html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
							html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
							html += '<td>'+(i+1)+'</td>';
							html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
							html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
							html += '<td>';
								for(var j = 0 ; j < resultData.singers.length ; j ++){
									var resultData2 = resultData.singers[j]
									html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
									html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
								}
							html += '</td>';
							html += '<td><a href="javascript:soundPlus('+(i+1)+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
							html += '</tr>';
							
						
						}
					} else {
						html += '	<tr>   											';
						html += '		<td colspan="6" style="text-align:center;"> <h6 class="card-title">자주 들은 곡이 없습니다. </h6> </td>			';
						html += '	</tr>											';
					}
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
				},
			}); // ajax 끝
		});
		
		// 좋아요 곡 리스트 불러오기
		$("#like_sound").click(function(){
			$.ajax({
				url: "<%=request.getContextPath()%>/mymusic/soundLike",
				type: "post",
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				dataType: 'json',
				success: function(result) {
					$(".left_title").text("좋아요 곡");
					console.log(result);
					var html = "";
					if(result.length > 0){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr>';
							html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
							html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
							html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
							html += '<td>'+(i+1)+'</td>';
							html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
							html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
							html += '<td>';
								for(var j = 0 ; j < resultData.singers.length ; j ++){
									var resultData2 = resultData.singers[j]
									html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
									html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
								}
							html += '</td>';
							html += '<td><a href="javascript:soundPlus('+(i+1)+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
							html += '</tr>';
							
						
						}
					} else {
						html += '	<tr>   											';
						html += '		<td colspan="6" style="text-align:center;"> <h6 class="card-title">좋아요 한 곡이 없습니다. </h6> </td>			';
						html += '	</tr>											';
					}
					
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
				},
			}); // ajax 끝
		});
		
		// 체크박스 전체선택 - 왼쪽 테이블
	    $("#check_all1").click(function(){
	    	if($('#check_all1').is(':checked')){
	    		$('table.left_sound_list input:checkbox').prop('checked',true);
	    	} else {
	    		$('table.left_sound_list input:checkbox').prop('checked',false);
	    	}
	    })
	    $(document).on("click", "table.left_sound_list .sound_checkbox1", function() {
			var total = $("table.left_sound_list .sound_checkbox1").length;
			var checked = $("table.left_sound_list .sound_checkbox1:checked").length;
			console.log("total : " + total);
			console.log("checked : " + checked);
			if(total != checked) {
				$("#check_all1").prop("checked", false);
			} else {
				$("#check_all1").prop("checked", true); 
			}
		});
	    // 체크박스 전체선택 - 오른쪽 테이블
	    $("#check_all2").click(function(){
	    	if($('#check_all2').is(':checked')){
	    		$('table.right_sound_list input:checkbox').prop('checked',true);
	    	} else {
	    		$('table.right_sound_list input:checkbox').prop('checked',false);
	    	}
	    })
	    $(document).on("click", "table.right_sound_list .sound_checkbox1", function() {
			var total = $("table.right_sound_list .sound_checkbox1").length;
			var checked = $("table.right_sound_list .sound_checkbox1:checked").length;
			console.log("total : " + total);
			console.log("checked : " + checked);
			if(total != checked) {
				$("#check_all2").prop("checked", false);
			} else {
				$("#check_all2").prop("checked", true); 
			}
		});
	    
	    // 선택 옮기기
	    $("#select_sound_plus").click(function(){
	    	console.log("선택 담기 클릭");
	    	if($('table.left_sound_list input[name=s_no]:checked').length == '0'){
				alert("곡을 선택하세요.");
			} else {
		    	var tableArray = [];
		    	var s_noArray = [];
		    	var a_noArray = [];
		    	$('table.left_sound_list input[name=s_no]:checked').each(function(){ //체크된 리스트 저장
		    		s_noArray.push($(this).val());
					a_noArray.push($(this).parent().next("input[name=a_no]").val());
		    		tableArray.push($(this).closest('tr').html());
		        });
		    	
				var html = "";
				for (var i = 0; i < tableArray.length; i++) {
					html += '<tr>';
					html += tableArray[i];
					html += '</tr>';
				}
				console.log(html);
				$("table.right_sound_list tbody").append(html);

				// number 부여하기, 빼기 버튼 함수 바꾸기
				for (var i = 0; i < $("table.right_sound_list tbody tr").length; i++) {
					$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(2)').text(i + 1);
					$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(6) a').attr('href','javascript:soundMinus('+(i+1)+')');
					$("table.right_sound_list tr:nth-child("+(i+1)+") td:nth-child(6) a").attr('href','javascript:soundMinus('+(i+1)+')');
		    		$("table.right_sound_list tr:nth-child("+(i+1)+") td:nth-child(6) a").children("i").attr('class','mdi mdi-minus-box list_icon');

				}
				/* // 다시 hidden 생성
		    	$("table.left_sound_list input[name=s_no]").each(function(){
		    		if(!($(this).parent().next("table.left_sound_list input[name=a_no]").length)){
		    			$(this).parent().after();
		    		} 
		    	}); */
		    	
				// 담으면 전체 선택 해제
				$('table.left_sound_list input:checkbox').prop('checked',false);
				// 미니 버튼들 a태그 색상 바꾸기
				$("i.mdi").parent('a').css('color', '#8f5fe8');
			}
	    });
		
		// 선택 빼기
		$("#select_sound_minus").click(function(){
			console.log("선택 빼기 클릭");
	    	if($('table.right_sound_list input[name=s_no]:checked').length == '0'){
				alert("곡을 선택하세요.");
			} else {
				var select_row = $('table.right_sound_list input[name=s_no]:checked');
				for(var i = select_row.length-1 ; i > -1 ; i--){
					select_row.eq(i).closest("tr").remove();
				}
				// number 부여하기
				for (var j = 0; j < $("table.right_sound_list tbody tr").length; j++) {
					$('table.right_sound_list tbody tr:nth-child('+(j + 1)+') td:nth-child(2)').text(j + 1);
					$('table.right_sound_list tbody tr:nth-child('+(j + 1)+') td:nth-child(6) a#sound_minus').attr('href','javascript:soundMinus(' + (j + 1) + ')');
				}
				// 담으면 전체 선택 해제
				$('table.right_sound_list input:checkbox').prop('checked',false);
			}
		});
	    
	    // 플레이 리스트 수정하기
	    $("#update_btn").click(function(){
	    	console.log("수정하기 버튼 클릭");
	    	if($("input[name=l_name]").val().trim() == null || $("input[name=l_name]").val().trim() == ""){
	    		alert("플레이 리스트 명을 입력해주세요.");
	    		$("input[name=l_name]").focus();
	    		return;
	    	} else if($('table.right_sound_list input[name=s_no]').length == 0){
	    		alert("곡을 담아주세요.");
	    		return;
	    	}
	    	var s_noArray = [];
	    	var a_noArray = [];
	    	$('table.right_sound_list input[name=s_no]').each(function(){ // 옮겨진 val 저장
	    		s_noArray.push($(this).val());
	    		a_noArray.push($(this).parent().next("table.right_sound_list input[name=a_no]").val());
	        });
	    	/* $('input[name=a_no]').each(function(){
	    		a_noArray.push($(this).val());
	        }); */
	    	console.log("s_noArray: "+s_noArray);
	    	console.log("a_noArray: "+a_noArray);
	    	var ajaxData = {
	    			s_no : s_noArray,
	    			a_no : a_noArray,
	    			l_name : $("input[name=l_name]").val(),
	    			l_private_yn : $("input[name=l_private_yn]:checked").val(),
	    			l_image : $('input[name=l_image]').val(),
	    			l_no : $('input[name=l_no]').val()
	    	}
	    	$.ajax({
	    		url: "<%=request.getContextPath() %>/mymusic/updatePlaylist.do",
	    		type: "post",
	    		beforeSend: function(xhr){
	    	        xhr.setRequestHeader(header, token);
	    	    },
	    		dataType: "json",
	    		data: ajaxData,
	    		traditional:true,
	    		success: function(result) {
	    			if(result == "0"){
	    				alert("플레이 리스트 수정에 실패했습니다. 다시 시도해주세요.");
	    			} else if(result == "1"){
	    				alert("플레이 리스트를 수정했습니다.");
	    				location.replace("<%=request.getContextPath() %>/mymusic/playlist");
	    			}
	    		},
	    		error:function(){
	    			
	    		}
	    	});  // ajax 끝
	    	<%-- right_sound_list_frm.action="<%=request.getContextPath() %>/mymusic/insertPlaylist";
	    	right_sound_list_frm.method="post";
	    	right_sound_list_frm.submit(); --%>
	    	
	    });
	    
	    // 초기화 버튼 클릭
	    $("#reset_btn").click(function(){
	    	var confm = confirm("초기화 버튼을 누르시면 담으셨던 곳이 모두 초기화 됩니다. 초기화를 하시겠습니까?");
			if (confm == false) {
				alert("취소하셨습니다.")
			} else {
				console.log("초기화 버튼 클릭");
		    	left_sound_list_frm.reset();
		    	right_sound_list_frm.reset();
		    	$("table.right_sound_list tbody").children().remove();
			}
	    });
	    
	    // 취소 버튼 클릭
	    $("#cancel_btn").click(function(){
	    	console.log("취소 버튼 클릭");
	    	history.back();
	    });
	    
		 // 미니 버튼들 a태그 색상 바꾸기
		$("i.mdi").parent('a').css('color', '#8f5fe8');
		 
		// 검색 버튼
		$("#playlist_search_btn").click(function(){
			$.ajax({
	    		url: "<%=request.getContextPath() %>/search/searchSound",
	    		type: "get",
	    		dataType: "json",
	    		data: {
	    			keyword: $(".sound_select_btn input[name=keyword]").val()
	    		},
	    		beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
	    		success: function(result) {
	    			$(".left_title").text("'"+$(".sound_select_btn input[name=keyword]").val()+"'  검색 결과");
					console.log(result);
					var html = "";
					if(result.length>=1){
						for(var i = 0; i < result.length; i++){
							var resultData = result[i];
							html += '<tr>';
							html += '<td><div class="form-check form-check-muted m-0"><label class="form-check-label">';
							html += '<input type="checkbox" class="form-check-input sound_checkbox1" value="'+resultData.s_no+'" name="s_no"><i class="input-helper"></i>';
							html += '</label><input type="hidden" value="'+resultData.a_no+'" name="a_no"></div></td>';
							html += '<td>'+(i+1)+'</td>';
							html += '<td><img src="'+resultData.a_cover+'" alt="image" /></td>'
							html += '<td><a href="javascript:selectSoundDetail('+resultData.a_no+','+resultData.s_no+')">'+resultData.s_name+'</a></td>'
							html += '<td>';
								for(var j = 0 ; j < resultData.singers.length ; j ++){
									var resultData2 = resultData.singers[j]
									html += '<input type="hidden" name="artist_no" value="'+resultData2.artist_no+'">';
									html += '<a href="javascript:selectArtistDetail('+resultData2.artist_no+')">'+resultData2.artist_name+'</a>&nbsp;';
								}
							html += '</td>';
							html += '<td><a href="javascript:soundPlus('+(i+1)+')"><i class="mdi mdi-arrow-right-bold list_icon"></i></a></td>';
							html += '</tr>';
							
						
						}
					} else {
						html += '<tr>';
						html += '<td colspan="6" style="text-align:center;"><h6 class="card-title">검색결과가 없습니다.</h6></td>'
						html += '</tr>';
					}
					console.log(html);
					$("table.left_sound_list tbody").children().remove();
					$("table.left_sound_list tbody").append(html);
					// 미니 버튼들 a태그 색상 바꾸기
					$("i.mdi").parent('a').css('color','#8f5fe8');
	    		},
	    		error:function(){
	    			
	    		}
	    	});  // ajax 끝
		});
	}); // $(founction(){}) 끝
	
	// 제목, 아티스트, 앨범 클릭시 상세조회 페이지
	function selectSoundDetail(a_no, s_no){
		location.href = "<%=request.getContextPath()%>/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
	};
	function selectArtistDetail(artist_no){
		location.href = "<%=request.getContextPath()%>/sound/artistDetail?artist_no=" + artist_no;
	};
	
	// 담을 곡으로 한곡 옮기기
	function soundPlus(i){
		console.log("i : "+i);
		console.log("테이블 : " + $('table.left_sound_list tbody tr:nth-child('+ i +')').html());
		var html = "";
		html += '<tr>';
		html += $('table.left_sound_list tbody tr:nth-child('+i+')').html();
		html += '</tr>';
		console.log(html);
		$("table.right_sound_list tbody").append(html);

		// number 부여하기
		for (var i = 0; i < $("table.right_sound_list tbody tr").length; i++) {
			$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(2)').text(i + 1);
			$('table.right_sound_list tbody tr:nth-child('+(i+1)+') td:nth-child(6) a').attr('href','javascript:soundMinus('+(i+1)+')');
			$("table.right_sound_list tr:nth-child("+(i+1)+") td:nth-child(6) a").children("i").attr('class','mdi mdi-minus-box list_icon');

		}
		// 미니 버튼들 a태그 색상 바꾸기
		$("i.mdi").parent('a').css('color', '#8f5fe8');
				
	}

	// 한곡 빼기
	function soundMinus(i) {
		$('table.right_sound_list tbody tr:nth-child(' + i + ')').remove();

		// number 부여하기
		for (var j = 0; j < $("table.right_sound_list tbody tr").length; j++) {
			$('table.right_sound_list tbody tr:nth-child('+(j + 1)+') td:nth-child(2)').text(j + 1);
			$('table.right_sound_list tbody tr:nth-child('+(j + 1)+') td:nth-child(6) a').attr('href','javascript:soundMinus(' + (j + 1) + ')');
		}
	}
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
						<h2 class="card-title">내 플레이 리스트 만들기</h2>
						<input type="hidden" name="l_no" value="${MyMusic.l_no }">
					</div>
					
						<div class="content_div1">
							<div class="main_img_div">
								<div>
									<img id="main_img"
										src="${MyMusic.l_image }"
										width="300" height="300">
								</div>
								<div class="img_btn">
									<input type="hidden" role="uploadcare-uploader"
										data-public-key="43cc829c5d2fae8676a5"
										data-tabs="file gdrive gphotos" /> <input type="hidden"
										name="l_image"
										value="${MyMusic.l_image }">
								</div>
							</div>
							<div class="content_info  card">
								<div class="card-body">
									<table class="table intro_table">
										<thead>
											<tr>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2"><input name="l_name" type="text" class="form-control"
													placeholder="플레이리스트명" required maxlength="16" value="${MyMusic.l_name }"></td>
											</tr>
											<tr>
												<td>공개 여부 :</td>
												<td>
													<div class="row">
													<c:choose>
														<c:when test="${MyMusic.l_private_yn == 'Y' }">
															<div class="form-check radio_div">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="l_private_yn" id="optionsRadios1" value="Y"
																	checked> 공개
																</label>
															</div>
															<div class="form-check radio_div">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="l_private_yn" id="optionsRadios2" value="N">
																	비공개
																</label>
															</div>
														</c:when>
														<c:when test="${MyMusic.l_private_yn == 'N' }">
															<div class="form-check radio_div">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="l_private_yn" id="optionsRadios1" value="Y"> 공개
																</label>
															</div>
															<div class="form-check radio_div">
																<label class="form-check-label"> <input
																	type="radio" class="form-check-input"
																	name="l_private_yn" id="optionsRadios2" value="N" 
																	checked>
																	비공개
																</label>
															</div>
														</c:when>
													</c:choose>
														
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="content_div2">
							<div>
								<h3 class="card-title">곡 담기</h3>
							</div>
							<hr color="white">
							<div>
								<select class="form-control" id="myplaylist_select">
									<option class="select_op">플레이 리스트를 선택하세요.</option>
									<c:forEach items="${mymusicList }" var="items">
										<option class="select_op" value="${items.l_no }">${items.l_name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="sound_select_btn">
								<button type="button" id="recent_sound"
									class="btn btn-outline-light btn-fw">최근 들은 곡</button>
								<button type="button" id="often_sound"
									class="btn btn-outline-light btn-fw">자주 들은 곡</button>
								<button type="button" id="like_sound"
									class="btn btn-outline-light btn-fw">좋아요 곡</button>
								<input type="text" class="form-control" placeholder="Search Sound" name="keyword">
						        <button type="button" id="playlist_search_btn" class="btn btn-outline-light btn-sm">Search</button>
							</div>
							<div class="row grid-2 sound_list_div">
							
								<div class="col-12 grid-margin">
									<div class="card">
										<div class="card-body">
											<div style="display: flex; justify-content: space-between;">
												<h3 class="card-title left_title">리스트를 선택하세요.</h3>
												<button id="select_sound_plus" type="button" class="btn btn-info btn-fw" style="height: 30px;">선택 담기</button>
											</div>
											<div class="table-responsive">
											<form name="left_sound_list_frm">
											<!-- csrf 공격 방지 -->
                      						<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
												<table class="table left_sound_list sound_list">
													<thead>
														<tr>
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all1">
																	</label>
																</div>
															</td>
															<td>No</td>
															<td><img src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>담기</td>
														</tr>
													</thead>
													<tbody>
													
													</tbody>
												</table>
												</form>
											</div>
										</div>
									</div>
								</div>
								
								
								<div class="col-12 grid-margin">
									<div class="card">
										<div class="card-body">
											<div style="display: flex; justify-content: space-between;">
												<h3 class="card-title right_title">플레이리스트에 담을 곡</h3>
												<button id="select_sound_minus" type="button" class="btn btn-info btn-fw" style="height: 30px;">선택 빼기</button>
											</div>
											<div class="table-responsive">
											<form name="right_sound_list_frm">
											<!-- csrf 공격 방지 -->
                      						<input id="csrf" type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
												<table class="table right_sound_list sound_list">
													<thead>
														<tr>
															<td>
																<div class="form-check form-check-muted m-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		id="check_all2">
																	</label>
																</div>
															</td>
															<td>No</td>
															<td><img src="<%=request.getContextPath()%>/resources/assets/images/playlist_img.png"></td>
															<td>노래명</td>
															<td>가수명</td>
															<td>빼기</td>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${ MyMusic.sounds}" var="sounds" varStatus="status">
															<tr>
																<td>
																	<div class="form-check form-check-muted m-0">
																		<label class="form-check-label"> 
																			<input type="checkbox" class="form-check-input sound_checkbox" value="${sounds.s_no }" name="s_no">
																		</label>
																		<input type="hidden" value="${sounds.a_no }" name="a_no">
																	</div>
																</td>
																<td>${status.index+1 }</td>
																<td><img src="${sounds.a_cover }" alt="image" /></td>
																<td><a href="javascript:selectSoundDetail(${sounds.a_no },${sounds.s_no})">${sounds.s_name}</a></td>
																<td>
																	<c:forEach items="${ sounds.singers}" var="singer">
																	<a href="javascript:selectArtistDetail(${singer.artist_no})">${singer.artist_name}</a>&nbsp;
																	</c:forEach>
																</td>
																<td>
																	<a href="javascript:soundMinus(${status.index+1 })"><i class="mdi mdi-minus-box list_icon"></i></a>
																	<!-- <i class="mdi mdi-plus-box list_icon"></i> -->
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												</form>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						<div class="insert_playlist_btns" style="text-align: center;">
							<button type="button" id="update_btn" class="btn btn-info btn-fw">수정하기</button>
							<button type="button" id="reset_btn" class="btn btn-info btn-fw">초기화</button>
							<button type="button" id="cancel_btn" class="btn btn-info btn-fw">취소</button>
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
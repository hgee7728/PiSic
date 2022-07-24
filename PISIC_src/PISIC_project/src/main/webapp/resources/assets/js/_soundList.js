$(function(){
	
    
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
    	if($('input[name=s_no]:checked').length == '0'){
			alert("곡을 선택하세요.");
		} else {
			
	    	// Post 방식으로 새창 열기
	    	window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	    	sound_frm.action= root_path + "/sound/play";
	    	sound_frm.target="SoundPlayer";
	    	sound_frm.method="post";
	    	sound_frm.submit();
		}
    });
    
    /* 플레이 리스트 담기 - modal */
	$("#select_insert").click(function() {
		console.log($('input[name=s_no]:checked').length);
		if($('input[name=s_no]:checked').length == '0'){
			alert("곡을 선택하세요.");
		} else {
			$("#playlist_insert_modal").show();
			$.ajax({
				url: root_path + "/mymusic/playlist.ax",
				type: "post",
				dataType: 'json',
				beforeSend: function(xhr){
    				        xhr.setRequestHeader(header, token);
    				    },
				success: function(result) {
					var html = "";
					for(var i = 0; i < result.length; i++){
						var vo = result[i];
						html += '<div class="preview-item border-bottom">';
						html += '<div class="preview-thumbnail">';
						html += '<img src='+vo.l_image+' class="modal_content">';
						html += '</div>';
						html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
						html += '<div class="flex-grow">';
						html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistSelectInsertDo('+vo.l_no+')">'+vo.l_name+'</a></p></div>';
						if(vo.l_private_yn == 'Y'){
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
						} else {
							html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
						}
					}
					$(".playlist_insert_modal_content").eq(0).nextAll().remove();
					$(".preview-list").append(html);
				},
			}); // ajax 끝
		}
	});
    
	
    // 모달창 끄기 2가지
	$(".playlist_insert_modal_close").click(function() {
		$("#playlist_insert_modal").hide();
	});
	
	playlist_insert_modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("playlist_insert_modal_overlay")) {
			$("#playlist_insert_modal").hide();
		}
	});
	
	// 미니 버튼들 a태그 색상 바꾸기
	$("i.mdi").parent('a').css('color','#8f5fe8');
	
});

	// 선택 담기
	function playlistSelectInsertDo(l_no){
	/* $("input[name=s_no]").each(function(){
		if(!(this.checked)){
			console.log("히든 지우기");
			$(this).parent().next("input[name=a_no]").remove();
		} 
		console.log(this.checked);
		}); */
		var s_noArray = [];
		var a_noArray = [];
		$('input[name=s_no]:checked').each(function(){ //체크된 리스트 저장
			s_noArray.push($(this).val());
			a_noArray.push($(this).parent().next("input[name=a_no]").val());
	    });
		/* $('input[name=a_no]').each(function(){
			a_noArray.push($(this).val());
	    }); */
		console.log("s_noArray: "+s_noArray);
		console.log("a_noArray: "+a_noArray);
		var ajaxData = {
				s_no : s_noArray,
				a_no : a_noArray,
				l_no : l_no
		}
	
		$.ajax({
			url: root_path + "/mymusic/insertSound",
			type: "post",
			dataType: "json",
			data: ajaxData,
			traditional:true,
			beforeSend: function(xhr){
    				        xhr.setRequestHeader(header, token);
    				    },
			success: function(result) {
				if(result == "0"){
					alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
				} else if(result == "1"){
					alert("해당 곡을 담았습니다.");
					$("#playlist_insert_modal").hide();
				}
			},
			error:function(){
				
			}
		});  // ajax 끝
	}
	// 한곡 담기
	function playlistInsertDo(a_no, s_no, l_no){
		console.log("한곡담기");
		$.ajax({
			url: root_path + "/mymusic/insertSound",
			type: "post",
			beforeSend: function(xhr){
    				        xhr.setRequestHeader(header, token);
    				    },
			data:{
				a_no:a_no,
				s_no:s_no,
				l_no:l_no
			},
			success: function(result) {
				if(result == "0"){
					alert("곡 담기에 실패 했습니다. 다시 시도해주세요.");
				} else if(result == "1"){
					alert("해당 곡을 담았습니다.");
					$("#playlist_insert_modal").hide();
				}
			},
			error:function(){
				
			}
		}); // ajax 끝
	}

	// 새 플레이 리스트 만들기 - 선택 담기
	function newPlaylist(){
		console.log("모달 새 플리 만들기");
    	sound_frm.action= root_path + "/mymusic/insertPlaylist";
    	sound_frm.method="post";
    	sound_frm.submit();
	};
	// 새 플레이 리스트 만들기 - 한곡 담기
	function newPlaylistOne(a_no, s_no){
		console.log("모달 새 플리 만들기");
    	var frm = document.createElement('form');
	    var input_s_no = document.createElement('input');
	    input_s_no.setAttribute('type', 'hidden');
	    input_s_no.setAttribute('name', 's_no');
	    input_s_no.setAttribute('value', s_no);
	
		var input_a_no = document.createElement('input');
	    input_a_no.setAttribute('type', 'hidden');
	    input_a_no.setAttribute('name', 'a_no');
	    input_a_no.setAttribute('value', a_no);
	
	    var input_csrf = document.createElement('input');
	    input_csrf.setAttribute('type', 'hidden');
	    input_csrf.setAttribute('id', 'csrf');
	    input_csrf.setAttribute('name', csrf_parameterName);
	    input_csrf.setAttribute('value', csrf_token);
		frm.appendChild(input_csrf);
	    frm.appendChild(input_s_no);
	    frm.appendChild(input_a_no);
	    frm.setAttribute('method', 'post');
	    frm.setAttribute('action', root_path + "/mymusic/insertPlaylist");
	    document.body.appendChild(frm);
	    frm.submit();
	};
	
	//로그인 페이지로
	function goLogin(){
		location.href= root_path + "/member/login"
	};
	// 제목, 아티스트, 앨범 클릭시 상세조회 페이지
	function selectSoundDetail(a_no, s_no){
		location.href = root_path + "/sound/soundDetail?a_no=" + a_no + "&s_no=" + s_no;
	};
	function selectArtistDetail(artist_no){
		location.href = root_path + "/sound/artistDetail?artist_no=" + artist_no;
	};
	function selectAlbumDetail(a_no){
		location.href = root_path + "/sound/albumDetail?a_no=" + a_no;
	};
	
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
	
	    var input_csrf = document.createElement('input');
	    input_csrf.setAttribute('type', 'hidden');
	    input_csrf.setAttribute('id', 'csrf');
	    input_csrf.setAttribute('name', csrf_parameterName);
	    input_csrf.setAttribute('value', csrf_token);
		frm.appendChild(input_csrf);
	    frm.appendChild(input_s_no);
	    frm.appendChild(input_a_no);
	    frm.setAttribute('method', 'post');
	    frm.setAttribute('action', root_path + '/sound/play');
	    document.body.appendChild(frm);
		windowObj = window.open('', 'SoundPlayer', 'top=10, left=10, width=450, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		frm.target="SoundPlayer";
	    frm.submit();
	};

	//노래 좋아요 - ajax
	function soundLike(a_no,s_no){
		console.log("좋아요");
		$.ajax({
			url: root_path + "/sound/like",
			type:"post",
			beforeSend: function(xhr){
				
					        xhr.setRequestHeader(header, token);
					    },
			data:{
				a_no:a_no,
				s_no:s_no
				},
			success: function(result){
				if(result == "-2"){
					alert("로그인 후 이용해 주세요.");
					location.href = root_path + "/member/login";
				} else if(result == "-1"){
					alert("좋아요 취소에 실패했습니다. 다시 시도해주세요.");
				} else if(result == "0"){
					alert("해당 곡을 좋아요를 취소했습니다.");
					location.reload();
				} else if(result == "1"){
					alert("해당 곡을 좋아요를 실패 했습니다. 다시 시도해주세요.");
				} else if(result == "2"){
					alert("해당 곡을 좋아요 했습니다.");
					location.reload();
				}
				
			},
			error:function(){
				
			}
		}); //ajax 끝
	};
	
	// 플레이리스트 한곡 담기 모달창
	function playlistInsert(a_no, s_no){
		$("#playlist_insert_modal").show();
		$.ajax({
			url: root_path + "/mymusic/playlist.ax",
			type: "post",
			dataType: "json",
			beforeSend: function(xhr){
    				        xhr.setRequestHeader(header, token);
    				    },
			success: function(result) {
				var html = "";
				for(var i = 0; i < result.length; i++){
					var resultData = result[i];
					html += '<div class="preview-item border-bottom">';
					html += '<div class="preview-thumbnail">';
					html += '<img src='+resultData.l_image+' class="modal_content">';
					html += '</div>';
					html += '<div class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">';
					html += '<div class="flex-grow">';
					html +=	'<p class="text-muted mb-0 modal_content"><a href="javascript:playlistInsertDo('+a_no +','+ s_no +','+ resultData.l_no +')">'+resultData.l_name+'</a></p></div>';
					if(resultData.l_private_yn == 'Y'){
						html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">공개</p></div></div></div>';
					} else {
						html += '<div class="mr-auto text-sm-right pt-2 pt-sm-0"><p class="text-muted modal_content">비공개</p></div></div></div>';
					}
				}
				$(".playlist_insert_modal_new h5").children("a#newPlaylist").attr('href','javascript:newPlaylistOne('+a_no +','+ s_no +')');
				$(".playlist_insert_modal_content").eq(0).nextAll().remove();
				$(".preview-list").append(html);
			},
		}); // ajax 끝
	}
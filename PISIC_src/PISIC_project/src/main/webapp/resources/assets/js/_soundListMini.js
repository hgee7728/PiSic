$(function(){
	
    
	// 체크박스 전체선택
    $("#check_all").click(function(){
    	if($('#check_all').is(':checked')){
    		$('input:checkbox').prop('checked',true);
    	} else {
    		$('input:checkbox').prop('checked',false);
    	}
    })
    $("input:checkbox").click(function() {
		var total = $(".sound_checkbox").length;
		var checked = $(".sound_checkbox:checked").length;
		console.log("total : " + total);
		console.log("checked : " + checked);
		if(total != checked) {
			$("#check_all").prop("checked", false);
		} else {
			$("#check_all").prop("checked", true); 
		}
	});

    // 선택 재생
    $("#select_play").click(function(){
    	if($('input[name=s_no]:checked').length == '0'){
			alert("곡을 선택하세요.");
		} else {
			$("input[name=s_no]").each(function(){
				if(!(this.checked)){
					console.log("히든 지우기");
					$(this).parent().next("input[name=a_no]").remove();
				} 
			});
	    	// Post 방식으로 새창 열기
	    	window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	    	sound_frm.action= root_path + "/sound/play";
	    	sound_frm.target="SoundPlayer";
	    	sound_frm.method="post";
	    	sound_frm.submit();
		}
    });
    
    
	
	// 미니 버튼들 a태그 색상 바꾸기
	$("i.mdi").parent('a').css('color','#8f5fe8');
	
});

	

	
	
	//로그인 페이지로
	function goLogin(){
		location.href= root_path + "/login"
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
		windowObj = window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
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
	
	
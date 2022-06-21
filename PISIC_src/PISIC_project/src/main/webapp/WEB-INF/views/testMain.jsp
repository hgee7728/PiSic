<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
테스트화면이야
<br>
<form id="frm">
	<input type="checkbox" name="sound_data" class="sound_data" value="제목1"><input type="hidden" name="hidden_data" value="가수1">
	<input type="checkbox" name="sound_data" class="sound_data" value="제목2"><input type="hidden" name="hidden_data" value="가수2">
	<input type="checkbox" name="sound_data" class="sound_data" value="제목3"><input type="hidden" name="hidden_data" value="가수3">
	<button type="button" id="btn_player">테스트 선택듣기</button>
</form>
<form action="<%=request.getContextPath() %>/sound/upload" method="post" enctype="multipart/form-data">
	<input type="file" name="upload">
	<button type="submit">노래 업로드</button>
</form>
<script>


//post로 새창 열기
// 체크된 체크박스만 value 2개씩 들고 가기
$("#btn_player").click(function(){
	$("[name=sound_data]").each(function(){
		if(!(this.checked)){
			$(this).next().remove();
		} 
		//console.log(this.checked);
	})
	window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.action="<%=request.getContextPath() %>/sound/play";
	frm.target="SoundPlayer";
	frm.method="post";
	frm.submit();
});
<%-- $("#btn_player2").click(function(){
	window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.action="<%=request.getContextPath() %>/sound/play2";
	frm.target="SoundPlayer";
	frm.method="post";
	frm.submit();
}); --%>
</script>
</body>
</html>
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
	<input type="text" name="post_data" value="전달data">
	<button type="button" id="btn_player">테스트 player</button>
	<button type="button" id="btn_player2">테스트 player2</button>
</form>
<form action="<%=request.getContextPath() %>/sound/upload" method="post" enctype="multipart/form-data">
	<input type="file" name="upload">
	<button type="submit">노래 업로드</button>
</form>
<form action="<%=request.getContextPath() %>/sound/test" method="post" enctype="multipart/form-data">
	<input type="file" name="upload">
	<button type="submit">테스트 업로드</button>
</form>
<script>


//post로 새창 열기
$("#btn_player").click(function(){
	window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.action="<%=request.getContextPath() %>/sound/play";
	frm.target="SoundPlayer";
	frm.method="post";
	frm.submit();
});
$("#btn_player2").click(function(){
	window.open('', 'SoundPlayer', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
	frm.action="<%=request.getContextPath() %>/sound/play2";
	frm.target="SoundPlayer";
	frm.method="post";
	frm.submit();
});
</script>
</body>
</html>
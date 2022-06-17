<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
메인페이지야~
<br>
<button type="button" id="insert">회원가입</button>
<script>
$("#insert").click(function(){
	location.href="<%=request.getContextPath()%>/member/insert";
});
var msg = "${msg}";
if(msg){
	alert(msg);
}
</script>
</body>
</html>
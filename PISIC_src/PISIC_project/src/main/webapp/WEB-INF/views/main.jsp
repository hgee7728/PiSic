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
메인화면이야
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/crawling/insertA" method="post">
	1. 아티스트 추가 <br>
	아티스트 : <input type="text" name="artist" required>
	<button type="submit">시작</button>
</form>
<form action="<%=request.getContextPath() %>/crawling/insertB" method="post">
	2. 앨범 노래 추가 <br>
	아티스트 :  <input type="text" name="artist" required>
	<button type="submit">시작</button>
</form>
</body>
</html>